using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using Dapper;
using System.Reflection;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq.Expressions;
using NDapper.Interfaces;
using Extensions;
using static Dapper.SqlMapper;
using DapperQueryBuilder;

namespace NDapper
{
    /// <summary>
    /// ANY OPERATION
    /// </summary>
    public class Dapper : IDataBase
    {
        private readonly ConnectionManager.ConnectionManager connectionManager;

        public Dapper()
        {
        }

        public Dapper(ConnectionManager.ConnectionManager connectionManager)
        {
            this.connectionManager = connectionManager;
        }

        protected DBType DBType = DBType.MSSQL;
        protected IQueryTranslatorDialect Dialect => QueryHelper.CreateDialect(DBType);

        public IEnumerable<T> ExucuteQueryWithFilеterRange<T>(FormattableString selectClause, List<FilterRange> filterRanges)
        {
            using (IDbConnection db = new SqlConnection(connectionManager.GetConnectionString()))
            {
                QueryBuilder query = db.QueryBuilder(selectClause);

                foreach (FilterRange _filter in filterRanges)
                    query.Where($@"{_filter.field_name:raw} BETWEEN 
                                 {_filter.field_min} AND {_filter.field_max} OR {_filter.field_name:raw} is NULL");

                return query.Query<T>();
            }
        }

        public IEnumerable<T> ExucuteQuery<T>(string query, object param = null)
        {
            using (IDbConnection db = new SqlConnection(connectionManager.GetConnectionString()))
            {
                IEnumerable<T> result = db.Query<T>(query, param).ToList();

                return result;
            }
        }

        public IDapperRepository<T> Repository<T>() => new DapperRepository<T>(connectionManager);
    }

    /// <summary>
    /// CRUD Operation
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class DapperRepository<T> : Dapper, IDapperRepository<T>
    {
        private readonly ConnectionManager.ConnectionManager connectionManager;
        private string Table { get; set; }
        protected Dictionary<string, PropertyInfo> keys = new Dictionary<string, PropertyInfo>();
        protected Dictionary<string, PropertyInfo> columns = new Dictionary<string, PropertyInfo>();
        protected string noKeyMessage => $"Entity {typeof(T).Name} doesn't contain any key property";

        public DapperRepository(ConnectionManager.ConnectionManager connectionManager)
        {
            this.connectionManager = connectionManager;

            var type = typeof(T);
            Table = type.GetCustomAttribute<System.ComponentModel.DataAnnotations.Schema.TableAttribute>()?.Name ?? type.Name.ToLower();

            var props = type.GetProperties().Where(o => o.GetCustomAttribute<ColumnAttribute>() != null);

            foreach (var p in props)
            {
                if (p.GetCustomAttributes(typeof(KeyAttribute), false).Any())
                    keys.Add(p.Name, p);
                if (!p.GetCustomAttributes(typeof(ComputedAttribute), false).Any() &&
                    !p.GetCustomAttributes(typeof(KeyAttribute), false).Any())
                    columns.Add(p.Name, p);
            }
        }

        public void CreateEntity(T entity)
        {
            var props = typeof(T).GetProperties(BindingFlags.Instance | BindingFlags.Public)
                .Where(o => o.GetCustomAttribute<ColumnAttribute>() != null);
            var cols = new List<string>();
            var vals = new List<string>();
            var parms = new Dictionary<string, object>();
            PropertyInfo identity = null;
            var n = 0;

            foreach (var prop in props)
            {
                if (identity == null)
                {
                    var hasIdentity = prop.GetCustomAttributes<Attribute>().Any();
                    identity = hasIdentity ? prop : null;
                    if (hasIdentity) continue;
                }

                var val = prop.GetValue(entity);
                if (val != null)
                {
                    cols.Add(prop.Name.ToLower());
                    vals.Add("@i" + n);
                    parms.Add("i" + n, val);
                    n++;
                }
            }

            var colsClause = cols.Join(", ");
            var valuesClause = vals.Join(", ");
            var returning = identity == null ? "" : string.Format(Dialect.ReturningIdentity, identity.Name.ToLower());

            var query = props.Count() > 1 ? $"insert into {Table}({colsClause}) values({valuesClause}) {returning}" : string.Format(Dialect.InsertDefault, Table) + " " + returning;

            using (IDbConnection db = new SqlConnection(connectionManager.GetConnectionString()))
            {
                var ret = db.ExecuteScalar(query, parms);

                if (identity != null)
                    identity.SetValue(entity, identity.PropertyType == typeof(Int32) ? Convert.ToInt32(ret) : ret);
            }
        }

        public IEnumerable<T> GetTable()
        {
            using (IDbConnection db = new SqlConnection(connectionManager.GetConnectionString()))
            {
                IEnumerable<T> result = db.Query<T>($"select * from {Table}").ToList();

                return result;
            }
        }

        public void DeleteEntity(int id)
        {
            using (IDbConnection db = new SqlConnection(connectionManager.GetConnectionString()))
            {
                var where = GetByIdWhereClause(id);
                var query = $"delete from {Table} where {where.clause}";

                db.ExecuteScalar(query, where.parms);
            }
        }

        public void Dispose(bool disposing)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public void EditEntity(T entity)
        {
            var keyCollection = new Dictionary<string, object>();
            var setCollection = new UpdateSetCollection<T>();

            foreach (var col in columns)
                setCollection.Set(col.Key, col.Value.GetValue(entity));

            foreach (var key in keys)
                keyCollection.Add(key.Key, key.Value.GetValue(entity));

            var where = GetByIdWhereClause(keyCollection);
            var query = $"update {Table} set {setCollection.GetClause()} where {where.clause}";

            foreach (var i in setCollection.GetParms())
                where.parms.Add(i.Key, i.Value);


            using (IDbConnection db = new SqlConnection(connectionManager.GetConnectionString()))
            {
                db.Execute(query, where.parms);
            }
        }

        public T FindEntity(int? id)
        {
            var (clause, parms) = GetByIdWhereClause(id);
            var query = $"select * from {Table} where {clause}";


            using (IDbConnection db = new SqlConnection(connectionManager.GetConnectionString()))
            {
                var result = db.QuerySingleOrDefault<T>(query, parms);

                return result;
            }
        }

        protected (string clause, Dictionary<string, object> parms) GetByIdWhereClause(object id)
        {
            var parms = new Dictionary<string, object>();
            var idtype = id.GetType();

            if (idtype == typeof(Dictionary<string, object>))
            {
                var ids = id as Dictionary<string, object>;
                int i = 0;
                var clause = ids.Select(k => {
                    var s = $"{k.Key.ToLower()} = @p{i}";
                    parms.Add($"p{i}", k.Value);
                    i++;
                    return s;
                }).Join(" and ");
                return (clause, parms);
            }
            else if (idtype == typeof(string) || idtype == typeof(Guid) || idtype == typeof(DateTime) ||
                     (idtype.IsValueType && idtype.IsPrimitive))
            {
                if (keys.Count == 0) throw new Exception(noKeyMessage);
                parms.Add("p0", id);
                return (keys.Keys.First().ToLower() + " = @p0", parms);
            }
            else if (idtype.IsValueType)
            {
                if (keys.Count == 0) throw new Exception(noKeyMessage);
                var props = id.GetType().GetProperties();
                int i = 0;
                var clause = keys.Select(k => {
                    var s = $"{k.Key.ToLower()} = @p{i}";
                    parms.Add($"p{i}", props[i].GetValue(id));
                    i++;
                    return s;
                }).Join(" and ");
                return (clause, parms);
            }
            else
                throw new Exception(noKeyMessage);
        }
    }

    public interface IQueryTranslatorDialect
    {
        string LikeKeyword { get; }
        string Concat { get; }
        string In { get; }
        bool BracketsForIn { get; }
        string ReturningIdentity { get; }
        string InsertDefault { get; }
    }

    public static class QueryHelper
    {
        public static IQueryTranslatorDialect CreateDialect(DBType dbType) => dbType == DBType.MSSQL ? (IQueryTranslatorDialect) new QueryTranslatorMSSQL() :
            dbType == DBType.POSTGRESQL ? new QueryTranslatorPostgres() :
            throw new NotSupportedException();
    }

    public class QueryTranslatorMSSQL : IQueryTranslatorDialect
    {
        public string InsertDefault => @"insert into {0} default values";
        public string ReturningIdentity => "select SCOPE_IDENTITY()";

        public string LikeKeyword => "LIKE";
        public string Concat => "+";
        public string In => "IN";
        public bool BracketsForIn => false;
    }

    public class QueryTranslatorPostgres : IQueryTranslatorDialect
    {
        public string InsertDefault => @"insert into {0} values(default)";
        public string ReturningIdentity => @"returning {0}";

        public string LikeKeyword => "ILIKE";
        public string Concat => "||";
        public string In => "= ANY";
        public bool BracketsForIn => true;
    }

    public enum DBType
    {
        MSSQL, DB2, ORACLE, POSTGRESQL
    }

    public class UpdateSetCollection<TEntity>
    {
        List<string> _columns = new List<string>();
        Dictionary<string, object> _parms = new Dictionary<string, object>();

        public UpdateSetCollection<TEntity> Set<TValue>(Expression<Func<TEntity, TValue>> property, TValue value)
        {
            if (property.Body is MemberExpression expr)
                return Set(expr.Member.Name, value);
            return this;
        }

        public UpdateSetCollection<TEntity> Set(string property, object value)
        {
            var n = _columns.Count;
            _columns.Add(property.ToLower());
            _parms.Add("u" + n.ToString(), value);
            return this;
        }

        public string GetClause() => _columns.Select((s, n) => $"{s} = @u{n}").Join(", ");

        public Dictionary<string, object> GetParms() => _parms;
        public IEnumerable<string> GetColumns() => _columns;

        public Dictionary<string, object> GetColumnsWithValues()
        {
            var res = new Dictionary<string, object>();
            for (int i = 0; i < _columns.Count; i++)
                res.Add(_columns[i], _parms[$"u{i}"]);
            return res;
        }
    }

    public class TableAttribute : Attribute
    {
        public string Name { get; }

        public TableAttribute(string name)
        {
            Name = name;
        }
    }

    public class IdentityAttribute : Attribute
    {
    }

    public class ComputedAttribute : Attribute
    {
    }

    public record FilterRange
    {
        public string field_name { get; set; }
        public string field_min { get; set; }
        public string field_max { get; set; }
    }
}
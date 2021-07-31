using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using static Dapper.SqlMapper;

namespace NDapper.Interfaces
{
    public interface IDataBase
    {
        IRepository<T> Repository<T>() where T : class;
    }

    public interface IRepository<T>
    {
        void CreateEntity(T entity);
        T FindEntity(int? id);
        IEnumerable<T> GetTable();
        void EditEntity(T entity);
        void DeleteEntity(int id);
    }
}
using System.Collections.Generic;
using System.Linq;
using NDapper.Interfaces;

namespace WMBLogic.Repository
{
    public class EF : IDataBase
    {
        private readonly DBContext _dbContext;

        public EF(DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IRepository<T> Repository<T>()
            where T : class
        {
            return new EFRepository<T>(_dbContext);
        }
    }

    public class EFRepository<T> : EF, IRepository<T>
        where T : class
    {
        private readonly DBContext _dbContext;
        
        public EFRepository(DBContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public void CreateEntity(T entity)
        {
            _dbContext.Add(entity);
            _dbContext.SaveChanges();
        }

        public T FindEntity(int? id)
        {
            return (T)_dbContext.Find(typeof(T), id);
        }

        public IEnumerable<T> GetTable()
        {
            return _dbContext.Set<T>().ToList();
        }

        public void EditEntity(T entity)
        {
            _dbContext.Update(entity);
            _dbContext.SaveChanges();
        }

        public void DeleteEntity(int id)
        {
            var entity = FindEntity(id);

            _dbContext.Remove(entity);
            _dbContext.SaveChanges();

        }
    }
}
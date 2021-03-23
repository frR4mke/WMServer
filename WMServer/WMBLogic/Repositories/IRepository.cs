using System;
using System.Collections.Generic;
using System.Text;

namespace WMBLogic.Repositories
{
    public interface IRepository<T> : IEntity<T>
    {
        void AddEntity(T entity);
        IEnumerable<T> GetTable();
        void EditEntity(T entity);
        void DeleteEntity(int id);

        void Dispose(bool disposing);
    }
    public interface IEntity<T>
    {
        T GetEntity(int? id);

    }
}

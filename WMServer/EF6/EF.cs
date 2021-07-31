using System;
using System.Collections.Generic;
using NDapper.Interfaces;

namespace EF6
{
    public class EF : IDataBase
    {
        private readonly ConnectionManager.ConnectionManager connectionManager;

        public EF(ConnectionManager.ConnectionManager connectionManager)
        {
            this.connectionManager = connectionManager;
        }

        public IRepository<T> Repository<T>()
        {
            throw new NotImplementedException();
        }
    }

    public class Repository<T> : EF, IRepository<T>
    {
        public Repository(ConnectionManager.ConnectionManager connectionManager) : base(connectionManager)
        {
        }

        public void CreateEntity(T entity)
        {
            throw new NotImplementedException();
        }

        public T FindEntity(int? id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<T> GetTable()
        {
            throw new NotImplementedException();
        }

        public void EditEntity(T entity)
        {
            throw new NotImplementedException();
        }

        public void DeleteEntity(int id)
        {
            throw new NotImplementedException();
        }
    }
}
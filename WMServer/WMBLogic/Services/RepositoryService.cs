using NDapper.Interfaces;

namespace WMBLogic.Services
{
    public class RepositoryService
    {
        private IDataBase _dataBase;

        public RepositoryService(IDataBase dataBase)
        {
            _dataBase = dataBase;
        }

        public void CreateEntity<T>(T entity)
            where T : class
        {
            var rep = _dataBase.Repository<T>();

            rep.CreateEntity(entity);
        }

        public void EditEntity<T>(T entity)
            where T : class
        {
            var rep = _dataBase.Repository<T>();

            rep.EditEntity(entity);
        }

        public void DeleteEntity<T>(int id)
            where T : class
        {
            var rep = _dataBase.Repository<T>();

            rep.DeleteEntity(id);
        }

        public T FindEntity<T>(int id)
            where T : class
        {
            var rep = _dataBase.Repository<T>();

            return rep.FindEntity(id);
        }
    }
}
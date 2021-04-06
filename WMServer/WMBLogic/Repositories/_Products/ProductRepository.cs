using NDapper.Interfaces;
using System.Collections.Generic;
using WMBLogic.Models.DB;

namespace WMBLogic.Repositories._Products
{
	public class ProductRepository : IRepository<Products>
	{
		private IDapperRepository<Products> repository;

		public ProductRepository(IDapperRepository<Products> repository)
		{
			this.repository = repository;
		}

		public void AddEntity(Products entity)
		{
			repository.CreateEntity(entity);
		}
		public Products GetEntity(int? id)
		{
			return repository.FindEntity(id);
		}
		public IEnumerable<Products> GetTable()
		{
			return repository.GetTable();
		}
		public void DeleteEntity(int id)
		{
			repository.DeleteEntity(id);
		}

		public void Dispose(bool disposing)
		{
			if (disposing)
			{
				if (repository != null)
				{
					repository.Dispose();
					repository = null;
				}
			}
		}

		public void EditEntity(Products entity)
		{
			repository.EditEntity(entity);
		}

		

		
	}
}

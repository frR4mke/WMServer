using NDapper.Interfaces;
using System.Collections.Generic;
using WMBLogic.Models.DB;

namespace WMBLogic.Repositories._Products
{
	public class ProductOptionsRepository : IRepository<ProductOptions>
	{
		private IDapperRepository<ProductOptions> repository;

		public ProductOptionsRepository(IDapperRepository<ProductOptions> repository)
		{
			this.repository = repository;
		}

		public void AddEntity(ProductOptions entity)
		{
			repository.CreateEntity(entity);
		}
		public ProductOptions GetEntity(int? id)
		{
			return repository.FindEntity(id);
		}
		public IEnumerable<ProductOptions> GetTable()
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

		public void EditEntity(ProductOptions entity)
		{
			repository.EditEntity(entity);
		}
	}
}

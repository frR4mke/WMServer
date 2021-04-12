using NDapper.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using WMBLogic.Models.DB;

namespace WMBLogic.Repositories._Products
{
	public class OrderRepository : IRepository<Orders>
	{
		private IDapperRepository<Orders> repository;

		public OrderRepository(IDapperRepository<Orders> repository)
		{
			this.repository = repository;
		}

		public void AddEntity(Orders entity)
		{
			repository.CreateEntity(entity);
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

		public void EditEntity(Orders entity)
		{
			repository.EditEntity(entity);
		}

		public Orders GetEntity(int? id)
		{
			return repository.FindEntity(id);
		}

		public IEnumerable<Orders> GetTable()
		{
			return repository.GetTable();
		}
	}
}

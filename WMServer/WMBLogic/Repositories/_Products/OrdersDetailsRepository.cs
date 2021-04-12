using NDapper.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using WMBLogic.Models.DB;

namespace WMBLogic.Repositories._Products
{
	public class OrdersDetailsRepository : IRepository<OrdersDetails>
	{
		private IDapperRepository<OrdersDetails> repository;

		public OrdersDetailsRepository(IDapperRepository<OrdersDetails> repository)
		{
			this.repository = repository;
		}
		public void AddEntity(OrdersDetails entity)
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

		public void EditEntity(OrdersDetails entity)
		{
			repository.EditEntity(entity);
		}

		public OrdersDetails GetEntity(int? id)
		{
			return repository.FindEntity(id);
		}

		public IEnumerable<OrdersDetails> GetTable()
		{
			return repository.GetTable();
		}
	}
}

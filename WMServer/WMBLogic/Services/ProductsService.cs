using NDapper.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace WMBLogic.Services
{
	public class ProductsService
	{
		readonly IDataBase database;

		public ProductsService(IDataBase database)
		{
			this.database = database;
		}
	}
}

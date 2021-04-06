using NDapper.Interfaces;
using System.Collections.Generic;
using System.Linq;
using WMBLogic.Models.DB;
using WMBLogic.Models.DTO;
using WMBLogic.Repositories;
using System;
using WMBLogic.Models.ENUMS;
using Extensions;
using WMBLogic.Embedded;
using WMBLogic.Models.FILTRES;
using WMBLogic.Models.INTERFACES;

namespace WMBLogic.Services
{
	public class ProductsService
	{
		readonly FilterService filterService;
		readonly IDataBase database;

		readonly IRepository<ProductOptions> productOptionsrepository;
		public ProductsService(IDataBase database, IRepository<ProductOptions> productOptionsrepository, FilterService filterService)
		{
			this.database = database;
			this.productOptionsrepository = productOptionsrepository;
			this.filterService = filterService;
			
		}

		public ProductOptions GetProductOption(int productOptions_id)
		{
			ProductOptions productOption = productOptionsrepository.GetEntity(productOptions_id);

			return productOption;
		}
		public IEnumerable<DTOProductOptions> GetProductOptionsList(int product_id)
		{
			string sql = EmbeddedResourceManager.GetString(typeof(ProductsService), DTOPath.DTOProductOptionsSql) + " where po.product_id = @product_id";

			IEnumerable<DTOProductOptions> productOptionList = database.ExucuteQuery<DTOProductOptions>(sql, new { product_id });

			return productOptionList;
		}

		public IEnumerable<DTOProducts> GetDTOProducts()
		{
			string sql = EmbeddedResourceManager.GetString(typeof(ProductsService), DTOPath.DTOProductSql);

			IEnumerable<DTOProducts> products = database.ExucuteQuery<DTOProducts>(sql);

			return products;
		}

		


	}
}

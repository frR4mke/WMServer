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
    public class HeatingFloorService
    {
        readonly FilterService filterService;
        readonly IDataBase database;

        public HeatingFloorService(FilterService filterService, IDataBase database)
        {
            this.filterService = filterService;
            this.database = database;
        }
        
        public IEnumerable<DTOProducts> GetProdutsForCatalog(int productType_id, HeatingFloorFilter filter)
        {			
            string productOptSql = EmbeddedResourceManager.GetString(typeof(ProductsService), DTOPath.DTOProductOptionsSql) + " where p.productType_id = @productType_id";

            IEnumerable<DTOProductOptions> productsOptions = database.ExucuteQuery<DTOProductOptions>(productOptSql, new { productType_id });

            if (productsOptions != null)
            {
                productsOptions = filterService.ApplyHeatingFloorFilter(filter, productsOptions);

                IEnumerable<string> product_ids = productsOptions.Select(x => x.product_id.ToString()).Distinct();

                string productSql = EmbeddedResourceManager.GetString(typeof(ProductsService), DTOPath.DTOProductSql) + " where p.product_id in @product_ids";				

                IEnumerable<DTOProducts> products = database.ExucuteQuery<DTOProducts>(productSql, new { product_ids });

                products = filterService.ApplyManyfacturersFilter(filter.manufacturer.Select(x => x.manufacturer_id).ToArray(), products);

                return products;

            }
            else
                throw new ArgumentNullException(nameof(productsOptions));

        }
        public IEnumerable<DTOProductOptions> GetProductOptionFiltred(int product_id, HeatingFloorFilter filter)
        {
            string sql = EmbeddedResourceManager.GetString(typeof(ProductsService), DTOPath.DTOProductOptionsSql) + " where po.product_id = @product_id";

            IEnumerable<DTOProductOptions> productOptionList = database.ExucuteQuery<DTOProductOptions>(sql, new { product_id });

            productOptionList = filterService.ApplyHeatingFloorFilter(filter, productOptionList);

            return productOptionList;
        }
    }
}
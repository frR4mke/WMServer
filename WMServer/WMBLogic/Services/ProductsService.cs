using System.Collections.Generic;
using System.Linq;
using WMBLogic.Models.DB;
using WMBLogic.Models.DTO;
using System;
using System.Data;
using Dapper;
using DapperQueryBuilder;
using Extensions;
using NDapper;
using WMBLogic.Embedded;

using Filter = WMBLogic.Models.FILTRES.Filter;


namespace WMBLogic.Services
{
    public class ProductsService : IHasEmbeddedResources
    {
        readonly IDbConnection dbConnection;

        public ProductsService(IDbConnection dbConnection)
        {
            this.dbConnection = dbConnection;
        }

        public IEnumerable<DTOSearchProduct> SearchProducts(string search)
        {
            var sql = $"select product_id, product_title from Products where product_title like '%{search}%'";
            
            IEnumerable<DTOSearchProduct> products = dbConnection.Query<DTOSearchProduct>(sql);
            
            return products;
        }
        public IEnumerable<DTOProductOptions> GetProductOptionsList(int product_id)
        {
            string sql = EmbeddedResourceManager.GetString(typeof(ProductsService), SQLPath.DTOProductOptionsSql);

            IEnumerable<DTOProductOptions> productOptionList = dbConnection.Query<DTOProductOptions>(sql, new {product_id});

            return productOptionList;
        }

        public IEnumerable<DTOProducts> GetDTOProducts()
        {
            string sql = this.GetString(SQLPath.DTOProductSql);

            IEnumerable<DTOProducts> products = dbConnection.Query<DTOProducts>(sql);
    
            return products;
        }
        public IEnumerable<DTOProducts> GetDTOPromotionalProducts()
        {
            string sql = this.GetString(SQLPath.DTOPromotionalProducts);

            IEnumerable<DTOProducts> products = dbConnection.Query<DTOProducts>(sql);
    
            return products;
        }
        
        public DTOProductView GetProductView(int product_id)
        {
            string sql = EmbeddedResourceManager.GetString(typeof(ProductsService), SQLPath.DTOProductViewSql);

            SqlMapper.GridReader result = dbConnection.QueryMultiple(sql, new {product_id});

            var productView = result.Read<DTOProductView>();

            if (productView != null)
            {
                var productAttributes = result.Read<ProductAttributes>().OrderBy(x => x.sort).ToArray();

                foreach (var p in productView)
                    p.productAttributes = productAttributes;
            }

            return productView.FirstOrDefault();
        }

        public IEnumerable<DTOProductOptions> GetProductOptionFiltred(int product_id, Filter filter)
        {
            FormattableString querySelect = $@"
            			SELECT  po.*,
                                CAST(ROUND( po.price - (po.price * (d.percentage / 100)), 0) AS decimal(7,0)) as discountprice,
                                p.productType_id,
                                i.image_title,
                                p.full_product_title
                                FROM ProductOptions po  
                                    JOIN Products p ON p.product_id = po.product_id and p.product_id = {product_id}
                                    LEFT JOIN PercentageDiscount d on p.product_id = d.product_id
		                            JOIN Images i ON p.product_id = i.product_id
            			/**where**/";

            IEnumerable<DTOProductOptions> productOptionList = ExucuteQueryWithFilеterRange<DTOProductOptions>(querySelect, filter.rangeFilter);

            return productOptionList;
        }

        public IEnumerable<DTOProducts> GetProductForCatalog(int productType_id, Filter filter)
        {
            FormattableString querySelect = $@"
            			SELECT po.product_id FROM ProductOptions po
                        JOIN Products p ON p.product_id = po.product_id and p.productType_id = {productType_id}
            			/**where**/ group by po.product_id";

            IEnumerable<int> product_ids = ExucuteQueryWithFilеterRange<int>(querySelect, filter.rangeFilter);


            string productSql = EmbeddedResourceManager.GetString(typeof(ProductsService), SQLPath.DTOProductSql) +
                                " where p.product_id in @product_ids and p.manufacturer_id in @manufacturer";

            IEnumerable<DTOProducts> products =
                dbConnection.Query<DTOProducts>(productSql, new {product_ids, manufacturer = filter.manufacturer.Select(x => x.manufacturer_id).ToList()});

            return products;
        }

        private IEnumerable<T> ExucuteQueryWithFilеterRange<T>(FormattableString selectClause, List<FilterRange> filterRanges)
        {
            QueryBuilder query = dbConnection.QueryBuilder(selectClause);

            foreach (FilterRange _filter in filterRanges)
                query.Where($@"{_filter.field_name:raw} BETWEEN 
                                 {_filter.field_min} AND {_filter.field_max} OR {_filter.field_name:raw} is NULL");

            return query.Query<T>();
        }

        public IEnumerable<ProductSelectList> GetProductSelectList()
        {
            var sql = "select product_id, product_title from Products";

            var result = dbConnection.Query<ProductSelectList>(sql);

            return result;
        }

        public IEnumerable<ProductOptionsSelectList> GetProductOptionsSelectListByIds(int[] product_ids)
        {

            var sql = @"select productOptions_id, 
			case when power is not null then CONVERT(varchar, power) + N' ВТ/ ' else '' end  +
			case when layingArea is not null then CONVERT(varchar, layingArea) + N' м2 /' else '' end  +
			case when wireLength is not null then CONVERT(varchar, wireLength) + N' м /' else '' end  +
			case when matLength is not null then CONVERT(varchar, matLength) + N' м ' else '' end  as productOptions_title,
            price, product_id
			from ProductOptions where product_id in @ids";

            var result = dbConnection.Query<ProductOptionsSelectList>(sql, new {@ids = product_ids});

            return result;
        }

        public IEnumerable<ProductOptionsSelectList> GetProductOptionsSelectListById(int product_id)
        {
            var sql = @"select productOptions_id, 
			case when power is not null then CONVERT(varchar, power) + N' ВТ/ ' else '' end  +
			case when layingArea is not null then CONVERT(varchar, layingArea) + N' м2 /' else '' end  +
			case when wireLength is not null then CONVERT(varchar, wireLength) + N' м /' else '' end  +
			case when matLength is not null then CONVERT(varchar, matLength) + N' м ' else '' end  as productOptions_title,
            price, product_id
			from ProductOptions where product_id = @product_id";

            var result = dbConnection.Query<ProductOptionsSelectList>(sql, new {@product_id = product_id});

            return result;
        }
    }
}
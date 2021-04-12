using NDapper.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using WMBLogic.Models.FILTRES;
using System.Linq;
using Extensions;
using WMBLogic.Models.DTO;
using WMBLogic.Models.INTERFACES;
using System.Data;
using Dapper;

namespace WMBLogic.Services
{
    public class FilterService
    {
        readonly IDataBase database;
        readonly IDbConnection dbConnection;

        public FilterService(IDataBase database, IDbConnection dbConnection)
		{
			this.dbConnection = dbConnection;

            this.database = database;		
		}
        public HeatingFloorFilter GetHeatingFloorFilter(int productType_id)
		{
            string resultSql = "Embedded.DTO.HeatingFloorFilter.sql";

            string sql = EmbeddedResourceManager.GetString(typeof(HeatingFloorFilter), resultSql);


			SqlMapper.GridReader result = dbConnection.QueryMultiple(sql, new { productType_id  });

            var minMax = result.Read<(decimal power_min, decimal power_max, decimal price_min, decimal price_max, decimal
                    layingArea_min, decimal layingArea_max)>().FirstOrDefault();


            List<Manufacturers> manufacturersList = new List<Manufacturers>();

			List<(string man_titile, int man_id)> manufacturers = result.Read<(string man_titile,int man_id)>().ToList();

            manufacturers.ForEach(x => {
                manufacturersList.Add(new Manufacturers {
                    manufacturer_id = x.man_id,
                    manufacturer_name = x.man_titile
                });
            });

            HeatingFloorFilter filter = new HeatingFloorFilter() {
                power_max = minMax.power_max,
                power_min = minMax.power_min,
                layingArea_max = minMax.layingArea_max,
                layingArea_min = minMax.layingArea_min,
                price_max = minMax.price_max,
                price_min = minMax.price_min,
                manufacturer = manufacturersList.ToArray()
            };

            return filter;

        }
        

        public IEnumerable<DTOProductOptions> ApplyHeatingFloorFilter(HeatingFloorFilter _filter,
            IEnumerable<DTOProductOptions> products)
        {
            if (_filter != null)
            {
                return products.Where(x =>
                    x.power >= (_filter.power_min ?? decimal.MinValue) &&
                    x.power <= (_filter.power_max ?? decimal.MaxValue) &&
                    x.price >= (_filter.price_min ?? decimal.MinValue) &&
                    x.price <= (_filter.price_max ?? decimal.MaxValue) &&
                    x.layingArea >= (_filter.layingArea_min ?? decimal.MinValue) &&
                    x.layingArea <= (_filter.layingArea_max ?? decimal.MaxValue));
            }

            return products;
        }
        public IEnumerable<DTOProducts> ApplyManyfacturersFilter(int[] manufacturers, IEnumerable<DTOProducts> products)
		{
            if (manufacturers.Length > 0)
            {
                return products.Where(x => manufacturers.Contains(x.manufacturer_id));
            }
            else
                return products;

        }
    }
}
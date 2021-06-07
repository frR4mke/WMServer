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
using NDapper;
using WMBLogic.Embedded;

namespace WMBLogic.Services
{
    public class FilterService
    {
        public readonly IDataBase database;
        public readonly IDbConnection dbConnection;

        public FilterService(IDataBase database, IDbConnection dbConnection)
        {
            this.dbConnection = dbConnection;
            this.database = database;
        }

        public Filter GetFilter(int productType_id)
        {
            _Filter _filter = _GetFilter(productType_id);

            return new Filter
            {
                manufacturer = _filter.Manufacturers,
                rangeFilter = new List<FilterRange>()
                {
                    new()
                    {
                        field_name = "price",
                        field_min = _filter.MinMax.price_min.ToString(),
                        field_max = _filter.MinMax.price_max.ToString()
                    },
                    new()
                    {
                        field_name = "power",
                        field_min = _filter.MinMax.power_min.ToString(),
                        field_max = _filter.MinMax.power_max.ToString()
                    },
                    new()
                    {
                        field_name = "layingArea",
                        field_min = _filter.MinMax.layingArea_min.ToString().Replace(',', '.'),
                        field_max = _filter.MinMax.layingArea_max.ToString().Replace(',', '.')
                    },
                    new()
                    {
                        field_name = "wireLength",
                        field_min = _filter.MinMax.wireLength_min.ToString().Replace(',', '.'),
                        field_max = _filter.MinMax.wireLength_max.ToString().Replace(',', '.')
                    },
                    new()
                    {
                        field_name = "matLength",
                        field_min = _filter.MinMax.matLength_min.ToString().Replace(',', '.'),
                        field_max = _filter.MinMax.matLength_max.ToString().Replace(',', '.')
                    }
                }
            };
        }

        private _Filter _GetFilter(int productType_id)
        {
            string resultSql = "Embedded.DTO.Filter.sql";

            string sql = EmbeddedResourceManager.GetString(typeof(Filter), SQLPath.Filter);

            SqlMapper.GridReader result = dbConnection.QueryMultiple(sql, new {productType_id});

            var (powerMin, powerMax, priceMin, priceMax, layingAreaMin, layingAreaMax, wireLengthMin, wireLengthMax, matLengthMin, matLengthMax) = result
                .Read<(decimal power_min, decimal power_max, decimal price_min, decimal price_max, decimal
                    layingArea_min, decimal layingArea_max, decimal wireLength_min, decimal wireLength_max, decimal
                    matLength_min, decimal matLength_max)>()
                .FirstOrDefault();

            List<(string man_titile, int man_id)> manufacturers =
                result.Read<(string man_titile, int man_id)>().ToList();

            List<Manufacturers> manufacturersList = new List<Manufacturers>();

            manufacturers.ForEach(x => {
                manufacturersList.Add(new Manufacturers
                {
                    manufacturer_id = x.man_id,
                    manufacturer_name = x.man_titile
                });
            });

            return new _Filter
            {
                MinMax = (powerMin, powerMax, priceMin, priceMax, layingAreaMin, layingAreaMax, wireLengthMin, wireLengthMax, matLengthMin, matLengthMax),
                Manufacturers = manufacturersList
            };
        }

        public class _Filter
        {
            public (decimal power_min, decimal power_max, decimal price_min, decimal price_max, decimal layingArea_min,
                decimal layingArea_max, decimal wireLength_min, decimal wireLength_max, decimal matLength_min, decimal
                matLength_max) MinMax { get; set; }

            public List<Manufacturers> Manufacturers { get; set; }
        }
    }
}
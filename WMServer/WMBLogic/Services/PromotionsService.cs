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
using NDapper.Interfaces;
using WMBLogic.Embedded;

namespace WMBLogic.Services
{
    public class PromotionsService: IHasEmbeddedResources
    {
        readonly IDbConnection dbConnection;
        readonly IDataBase database;
        
        public PromotionsService(IDbConnection dbConnection, IDataBase database)
        {
            this.dbConnection = dbConnection;
            this.database = database;
        }

        public List<DTOGiftGoods> GetDTOGiftGoods()
        {
            var sql = this.GetString(SQLPath.DTOGiftGoods);

            var result = dbConnection.Query<DTOGiftGoods>(sql).ToList();

            return result;
        }
        public List<DTOPercentageDiscount> GetDTOPercentageDiscount()
        {
            var sql = this.GetString(SQLPath.DTOPercentageDiscount);

            var result = dbConnection.Query<DTOPercentageDiscount>(sql).ToList();

            return result;
        }

        public PercentageDiscount GetPromotionById(int percentageDiscount_id)
        {
            var rep = database.Repository<PercentageDiscount>();

            return rep.FindEntity(percentageDiscount_id);
        }
        public void AddPromotion(PercentageDiscount promotions)
        {
            var rep = database.Repository<PercentageDiscount>();

            rep.CreateEntity(promotions);
        }
        public void DeletePromotion(int percentageDiscount_id)
        {
            var rep = database.Repository<PercentageDiscount>();

            rep.DeleteEntity(percentageDiscount_id);
        }
        
        public void EditPromotion(PercentageDiscount promotions)
        {
            var rep = database.Repository<PercentageDiscount>();

            rep.EditEntity(promotions);
        }
        
    }
}
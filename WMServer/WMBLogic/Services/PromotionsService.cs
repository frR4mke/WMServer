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

        public PromotionsService(IDbConnection dbConnection)
        {
            this.dbConnection = dbConnection;
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

        // public void AddPromotion(PercentageDiscount promotions)
        // {
        //     var rep = database.Repository<PercentageDiscount>();
        //
        //     rep.CreateEntity(promotions);
        // }
        // public void DeletePromotion(int percentageDiscount_id)
        // {
        //     var rep = database.Repository<PercentageDiscount>();
        //
        //     rep.DeleteEntity(percentageDiscount_id);
        // }
        //
        // public void EditPromotion(PercentageDiscount promotions)
        // {
        //     var rep = database.Repository<PercentageDiscount>();
        //
        //     rep.EditEntity(promotions);
        // }
        
    }
}
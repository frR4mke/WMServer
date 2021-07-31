using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using WMBLogic.Models.DB;
using WMBLogic.Models.DTO;
using WMBLogic.Services;

namespace WMServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PromotionsController : ControllerBase
    {
        private RepositoryService _repositoryService;
        private PromotionsService _promotionsService;
        private ErrorLogger _errorLogger;
        public PromotionsController(PromotionsService promotionsService, RepositoryService repositoryService, ErrorLogger errorLogger)
        {
            _promotionsService = promotionsService;
            _repositoryService = repositoryService;
            _errorLogger = errorLogger;
        }

        [Route("GetDTOGiftGoods")]
        public List<DTOGiftGoods> GetDTOGiftGoods()
        {
            try
            {
                return _promotionsService.GetDTOGiftGoods();
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения списка акций");
                throw;
            }
        }
        [Route("GetDTOPercentageDiscount")]
        public List<DTOPercentageDiscount> GetDTOPercentageDiscount()
        {
            try
            {
                return _promotionsService.GetDTOPercentageDiscount();
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения списка акций");
                throw;
            }
        }
        
        [HttpPost]
        [Route("EditGift")]
        public void EditGift([FromBody] GiftGoods giftGoods)
        {
            try
            {
                _repositoryService.EditEntity(giftGoods);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка редактирования акции");
                throw;
            }
        }

        [HttpPost]
        [Route("AddGift")]
        public void AddGift([FromBody] GiftGoods giftGoods)
        {
            try
            {
                _repositoryService.CreateEntity(giftGoods);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка добавления акции");
                throw;
            }
        }
        [Route("GetGiftById/{giftGoods_id}")]
        public GiftGoods GetGiftById(int giftGoods_id)
        {
            try
            {
                return _repositoryService.FindEntity<GiftGoods>(giftGoods_id);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения акции");
                throw;
            }
        }
        [Route("DeleteGift/{giftGoods_id}")]
        public void DeleteGift(int giftGoods_id)
        {
            try
            {
                _repositoryService.DeleteEntity<GiftGoods>(giftGoods_id);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения акции");
                throw;
            }
        }
        
        
        [HttpPost]
        [Route("EditPromotion")]
        public void EditPromotion([FromBody] PercentageDiscount promotions)
        {
            try
            {
                _repositoryService.EditEntity(promotions);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка редактирования акции");
                throw;
            }
        }

        [HttpPost]
        [Route("AddPromotion")]
        public void AddPromotion([FromBody] PercentageDiscount promotions)
        {
            try
            {
                _repositoryService.CreateEntity(promotions);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка добавления акции");
                throw;
            }
        }
        [Route("GetPromotionById/{percentageDiscount_id}")]
        public PercentageDiscount GetPromotionById(int percentageDiscount_id)
        {
            try
            {
                return _repositoryService.FindEntity<PercentageDiscount>(percentageDiscount_id);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения акции");
                throw;
            }
        }
        [Route("DeletePromotion/{percentageDiscount_id}")]
        public void DeletePromotion(int percentageDiscount_id)
        {
            try
            {
                _repositoryService.DeleteEntity<PercentageDiscount>(percentageDiscount_id);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения акции");
                throw;
            }
        }
    }
}
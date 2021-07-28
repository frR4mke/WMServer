using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using WMBLogic.Models.DTO;
using WMBLogic.Models.FILTRES;
using WMBLogic.Services;
using System.Web;
using WMBLogic.Models.DB;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WMServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private FilterService _filterService;
        private ProductsService _productsService;
        private ErrorLogger.ErrorLogger _errorLogger;

        // GET: api/<ProductsController>
        public ProductsController(FilterService filterService,
            ProductsService productsService, ErrorLogger.ErrorLogger errorLogger)
        {
            _filterService = filterService;
            _productsService = productsService;
            _errorLogger = errorLogger;
        }

        [HttpGet]
        public IEnumerable<DTOProducts> Get()
        {
            try
            {
                return _productsService.GetDTOProducts();
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения списка продуктов");
                throw;
            }
           
        }

        [Route("GetProductOptionsList/{product_id}")]
        public IEnumerable<DTOProductOptions> GetProductOptionsList(int product_id)
        {
            try
            {
                return _productsService.GetProductOptionsList(product_id);

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения опций товара");
                throw;
            }
        }

        [Route("GetFilter/{productType_id}")]
        public Filter GetFilter(int productType_id)
        {
            try
            {
                return _filterService.GetFilter(productType_id);

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения фильтра");
                throw;
            }
        }

        [Route("GetProductView/{product_id}")]
        public DTOProductView GetProductView(int product_id)
        {
            try
            {
                return _productsService.GetProductView(product_id);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения карточки товара");
                throw;
            }
            
        }

        [HttpPost]
        [Route("GetProductOptionFiltred/{product_id}")]
        public IEnumerable<DTOProductOptions> GetProductOptionFiltred([FromBody] Filter filter,
            int product_id)
        {
            try
            {
                return _productsService.GetProductOptionFiltred(product_id, filter);

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения отфильтрованных опций");
                throw;
            }
        }

        [HttpPost]
        [Route("GetProductForCatalog/{productType_id}")]
        public IEnumerable<DTOProducts> GetProductForCatalog([FromBody] Filter filter, int productType_id)
        {
            try
            {
                return _productsService.GetProductForCatalog(productType_id, filter);

            }
            catch (Exception e)
            {               
                _errorLogger.LogError(e, "Ошибка получения товаров для каталога");
                throw;
            }
        }

        [HttpGet]
        [Route("GetProductSelectList")]
        public IEnumerable<ProductSelectList> GetProductSelectList()
        {
            try
            {
                return _productsService.GetProductSelectList();

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения списка товаров");
                throw;
            }
        }

        [HttpGet]
        [Route("GetProductOptionsSelectListById/{product_id}")]
        public IEnumerable<ProductOptionsSelectList> GetProductOptionsSelectListById(int product_id)
        {
            try
            {
                return _productsService.GetProductOptionsSelectListById(product_id);

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения опции товара");
                throw;
            }
        }

        [HttpPost]
        [Route("GetProductOptionsSelectListByIds")]
        public IEnumerable<ProductOptionsSelectList> GetProductOptionsSelectListByIds([FromBody] int[] product_ids)
        {
            try
            {
                return _productsService.GetProductOptionsSelectListByIds(product_ids);
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения опции товара");
                throw;
            }
           
        }
      
        [HttpGet]
        [Route("GetDTOPromotionalProducts")]
        public IEnumerable<DTOProducts> GetDTOPromotionalProducts()
        {
            try
            {
                return _productsService.GetDTOPromotionalProducts();

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения товаров по акции");
                throw;
            }
        }
    }
}
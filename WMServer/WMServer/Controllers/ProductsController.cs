using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using WMBLogic.Models.DTO;
using WMBLogic.Models.FILTRES;
using WMBLogic.Services;
using System.Web;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WMServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        public FilterService filterService;
        public ProductsService productsService;

        // GET: api/<ProductsController>
        public ProductsController(FilterService filterService,
            ProductsService productsService)
        {
            this.filterService = filterService;
            this.productsService = productsService;
        }

        [HttpGet]
        public IEnumerable<DTOProducts> Get()
        {
            return productsService.GetDTOProducts();
        }

        [Route("GetProductOptionsList/{product_id}")]
        public IEnumerable<DTOProductOptions> GetProductOptionsList(int product_id)
        {
            return productsService.GetProductOptionsList(product_id);
        }

        [Route("GetFilter/{productType_id}")]
        public Filter GetFilter(int productType_id)
        {
            return filterService.GetFilter(productType_id);
        }

        [Route("GetProductView/{product_id}")]
        public DTOProductView GetProductView(int product_id)
        {
            return productsService.GetProductView(product_id);
        }

        [HttpPost]
        [Route("GetProductOptionFiltred/{product_id}")]
        public IEnumerable<DTOProductOptions> GetProductOptionFiltred([FromBody] Filter filter,
            int product_id)
        {
            return productsService.GetProductOptionFiltred(product_id, filter);
        }

        [HttpPost]
        [Route("GetProductForCatalog/{productType_id}")]
        public IEnumerable<DTOProducts> GetProductForCatalog([FromBody] Filter filter, int productType_id)
        {
            return productsService.GetProductForCatalog(productType_id, filter);
        }
    }
}
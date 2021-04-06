using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WMBLogic.Models.DB;
using WMBLogic.Models.DTO;
using WMBLogic.Models.FILTRES;
using WMBLogic.Repositories;
using WMBLogic.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WMServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly HeatingFloorService heatingFloorService;
        readonly FilterService filterService;
        readonly ProductsService productsService;

        // GET: api/<ProductsController>
        public ProductsController(HeatingFloorService heatingFloorService, FilterService filterService,
            ProductsService productsService)
        {
            this.heatingFloorService = heatingFloorService;
            this.filterService = filterService;
            this.productsService = productsService;
        }

        [HttpGet]
        public IEnumerable<DTOProducts> Get()
        {
            return productsService.GetDTOProducts();
        }

        [Route("GetProductOption/{productOptions_id}")]
        public ProductOptions GetProductOption(int productOptions_id)
        {
            return productsService.GetProductOption(productOptions_id);
        }


        [Route("GetProductOptionsList/{product_id}")]
        public IEnumerable<DTOProductOptions> GetProductOptionsList(int product_id)
        {
            return productsService.GetProductOptionsList(product_id);
        }

        [Route("GetHeatingFloorFilter/{productType_id}")]
        public HeatingFloorFilter GetHeatingFloorFilter(int productType_id)
        {
            return filterService.GetHeatingFloorFilter(productType_id);
        }

        #region HeatingFloorFilter

        [HttpPost]
        [Route("GetHeatingFloorProductOptionFiltred/{product_id}")]
        public IEnumerable<DTOProductOptions> GetHeatingFloorProductOptionFiltred([FromBody] HeatingFloorFilter filter,
            int product_id)
        {
            return heatingFloorService.GetProductOptionFiltred(product_id, filter);
        }

        [HttpPost]
        [Route("GetProdutsForCatalog/{productType_id}")]
        public IEnumerable<DTOProducts> GetProdutsForCatalog([FromBody] HeatingFloorFilter filter, int productType_id)
        {
            return heatingFloorService.GetProdutsForCatalog(productType_id, filter);
        }

        #endregion


        // GET api/<ProductsController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ProductsController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ProductsController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ProductsController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
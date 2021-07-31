using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using WMBLogic.Models.DB;
using WMBLogic.Models.DTO;
using WMBLogic.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WMServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private OrderService orderService;
        private ErrorLogger _errorLogger;

        public OrdersController(OrderService orderService, ErrorLogger errorLogger)
        {
            this.orderService = orderService;
            _errorLogger = errorLogger;
        }


        // POST api/<OrderController>
        [HttpPost]
        public int Post([FromBody] DTOOrderEdit formOrder)
        {
            try
            {
                return orderService.SaveOrder(formOrder, Request.Headers["Referer"].ToString());

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка сохранения заказа");
                throw;
            }
        }

        [Route("GetSelectLists")]
        public SelectLists GetSelectLists()
        {
            try
            {
                return orderService.GetSelectLists();

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения формы для оформления заказа");
                throw;
            }
        }

        [Route("GetDTOOrder")]
        public IEnumerable<DTOOrder> GetDTOOrder()
        {
            try
            {
                return orderService.GetDTOOrder();
            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения заказов");
                throw;
            }
           
        }

        [Route("GetOrder/{order_id}")]
        public DTOOrderEdit GetOrder(int order_id)
        {
            try
            {
                return orderService.GetOrder(order_id);

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка получения заказа");
                throw;
            }
        }

        [HttpPost]
        [Route("UpdateOrder")]
        public void UpdateOrder([FromBody] DTOOrderEdit order)
        {
            try
            {
                orderService.UpdateOrder(order);

            }
            catch (Exception e)
            {
                _errorLogger.LogError(e, "Ошибка редактирования заказа");
                throw;
            }
        }
    }
}
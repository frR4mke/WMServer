using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WMBLogic.Models.DTO;
using WMBLogic.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WMServer.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class OrdersController : ControllerBase
	{
		
		readonly OrderService orderService;

		public OrdersController(OrderService orderService)
		{
			this.orderService = orderService;
		}

		
		// POST api/<OrderController>
		[HttpPost]
		public int Post([FromBody] DTOFormOrder formOrder)
		{
			return orderService.SaveOrder(formOrder);
		}

		[Route("GetCustomerForm")]
		public CustomerForm GetCustomerForm()
		{
			return orderService.GetCustomerForm();
		}
		[Route("GetDTOOrder")]
		public IEnumerable<DTOOrder> GetDTOOrder()
		{
			return orderService.GetDTOOrder();
		}
		
	}
}

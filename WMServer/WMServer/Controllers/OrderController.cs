﻿using Microsoft.AspNetCore.Mvc;
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
		
		readonly OrderService orderService;

		public OrdersController(OrderService orderService)
		{
			this.orderService = orderService;
		}

		
		// POST api/<OrderController>
		[HttpPost]
		public int Post([FromBody] DTOFormOrder formOrder)
		{
			var test = $"{this.Request.Scheme}://{this.Request.Host}{this.Request.PathBase}";
			
			return orderService.SaveOrder(formOrder);
		}

		[Route("GetSelectLists")]
		public SelectLists GetSelectLists()
		{
			return orderService.GetSelectLists();
		}
		[Route("GetDTOOrder")]
		public IEnumerable<DTOOrder> GetDTOOrder()
		{
			return orderService.GetDTOOrder();
		}
		[Route("GetOrder/{order_id}")]
		public Orders GetOrder(int order_id)
		{
			return orderService.GetOrder(order_id);
		}
		[HttpPost]
		[Route("UpdateOrder")]
		public void UpdateOrder([FromBody] Orders order)
		{
			orderService.UpdateOrder(order);
		}
		
		
	}
}

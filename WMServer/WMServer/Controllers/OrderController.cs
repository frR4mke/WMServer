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

		// GET: api/<OrderController>
		[HttpGet]
		public IEnumerable<string> Get()
		{
			return new string[] { "value1", "value2" };
		}

		// GET api/<OrderController>/5
		[HttpGet("{id}")]
		public string Get(int id)
		{
			return "value";
		}

		// POST api/<OrderController>
		[HttpPost]
		public int Post([FromBody] DTOFormOrder formOrder)
		{
			return this.orderService.SaveOrder(formOrder);
		}

		// PUT api/<OrderController>/5
		[HttpPut("{id}")]
		public void Put(int id, [FromBody] string value)
		{
		}

		// DELETE api/<OrderController>/5
		[HttpDelete("{id}")]
		public void Delete(int id)
		{
		}
	}
}

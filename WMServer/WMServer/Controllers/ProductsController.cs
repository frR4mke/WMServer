using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WMBLogic.Models.DB;
using WMBLogic.Repositories;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WMServer.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ProductsController : ControllerBase
	{
		IRepository<Products> repository;

		public ProductsController(IRepository<Products> repository)
		{
			this.repository = repository;
		}

		// GET: api/<ProductsController>
		[HttpGet]
		public IEnumerable<Products> Get()
		{
			return repository.GetTable();
		}

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

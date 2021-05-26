using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using NDapper.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WMBLogic.Models.DTO;
using WMBLogic.Services;

namespace WMServer.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class WeatherForecastController : ControllerBase
	{
		private static readonly string[] Summaries = new[]
		{
			"Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
		};
		readonly ProductsService test;

		public WeatherForecastController(ProductsService test)
		{
			this.test = test;
		}

		[HttpGet]
		public IEnumerable<DTOProducts> Get()
		{
			return test.GetDTOProducts();
		}
	}
}

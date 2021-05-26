using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WMBLogic.Models.DB;
using WMBLogic.Models.INTERFACES;

namespace WMServer.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class UsersController : ControllerBase
	{
		private readonly IUserService _userService;

		public UsersController(IUserService userService)
		{
			_userService = userService;
		}
		
		[HttpPost]
		[Route("Login")]
		public IActionResult Login([FromBody]User user)
		{
			var _user = _userService.Login(user);

			if (_user is not null)
			{
				var token = _userService.GenerateToken(_user);
				
				return Ok(new {
					acces_token = token
				});
			}
			
			return Unauthorized();
		}
	}
}

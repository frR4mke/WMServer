using Microsoft.IdentityModel.Tokens;
using System;
using System.Text;

namespace AuthLibrary
{
	public class AuthOptions
	{
		public string Issuer { get; set; }
		public string Audience { get; set; }
		public string Secret { get; set; }
		/// <summary>
		/// Секунды
		/// </summary>
		public int TokenLifetime { get; set; }
		public SymmetricSecurityKey GetSymmetricSecurityKey()
		{
			return new SymmetricSecurityKey(Encoding.ASCII.GetBytes(Secret));
		}

	}
}

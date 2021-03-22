using AuthLibrary;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace WMServer.Configure
{
	public static class AuthenticationConfig
	{
		public static void ConfigureAuthentication(this IServiceCollection services, IConfiguration Configuration)
		{
			var authOptionsConfig = Configuration.GetSection("Auth").Get<AuthOptions>();

			services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
				.AddJwtBearer(options => {

					options.RequireHttpsMetadata = false;
					options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters {

						ValidateIssuer = true,
						ValidIssuer = authOptionsConfig.Issuer,

						ValidateAudience = true,
						ValidAudience = authOptionsConfig.Audience,

						ValidateLifetime = true,

						IssuerSigningKey = authOptionsConfig.GetSymmetricSecurityKey(),
						ValidateIssuerSigningKey = true,

					};

				});
		}
	}
}

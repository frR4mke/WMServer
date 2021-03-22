using Microsoft.Extensions.Configuration;

namespace ConnectionManager
{
	public class ConnectionManager
	{
		private const string defaultConnection = "DefaultConnection";

		private readonly IConfiguration Configuration;

		public ConnectionManager(IConfiguration configuration)
		{
			this.Configuration = configuration;
		}

		public string GetConnectionString() => Configuration.GetConnectionString(defaultConnection);

	}
}

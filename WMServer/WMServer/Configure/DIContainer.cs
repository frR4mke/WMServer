using Microsoft.Extensions.DependencyInjection;
using NDapper;
using NDapper.Interfaces;
using WMBLogic.Models.DB;
using WMBLogic.Repositories;
using WMBLogic.Repositories._Products;

namespace WMServer.Configure
{
	public static class DIContainer
	{
		public static void RegisterComponents(this IServiceCollection services)
		{
			services.AddScoped<ConnectionManager.ConnectionManager, ConnectionManager.ConnectionManager>();
			//Dapper
			services.AddScoped<IDataBase, NDapper.Dapper>();
			services.AddScoped<IDapperRepository<Products>, DapperRepository<Products>>();
			///Repository
			services.AddScoped<IRepository<Products>, ProductRepository>();
		}
	}
}

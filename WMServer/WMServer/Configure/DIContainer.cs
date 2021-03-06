using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NDapper;
using NDapper.Interfaces;
using System.Data;
using System.Data.SqlClient;
using WMBLogic.Models.DB;
using WMBLogic.Repositories;
using WMBLogic.Repositories._Products;
using WMBLogic.Services;

namespace WMServer.Configure
{
	public static class DIContainer
	{
		public static void RegisterComponents(this IServiceCollection services, IConfiguration configuration)
		{
			services.AddScoped<ConnectionManager.ConnectionManager, ConnectionManager.ConnectionManager>();
			//Dapper
			services.AddScoped<IDataBase, NDapper.Dapper>();
			services.AddScoped<IDapperRepository<Products>, DapperRepository<Products>>();
			services.AddScoped<IDapperRepository<ProductOptions>, DapperRepository<ProductOptions>>();
			services.AddScoped<IDapperRepository<Orders>, DapperRepository<Orders>>();
			services.AddScoped<IDapperRepository<OrdersDetails>, DapperRepository<OrdersDetails>>();
			//Repository
			services.AddScoped<IRepository<Products>, ProductRepository>();
			services.AddScoped<IRepository<ProductOptions>, ProductOptionsRepository>();
			services.AddScoped<IRepository<Orders>, OrderRepository>();
			services.AddScoped<IRepository<OrdersDetails>, OrdersDetailsRepository>();
			//Services
			services.AddScoped<ProductsService, ProductsService>();
			services.AddScoped<FilterService, FilterService>();
			services.AddScoped<HeatingFloorService, HeatingFloorService>();		
			services.AddScoped<OrderService, OrderService>();


			//DbConnection
			services.AddScoped<IDbConnection>(x => {
				var conn = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));
				conn.Open();				
				return conn;
			});

		}
	}
}

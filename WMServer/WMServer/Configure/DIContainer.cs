using Mail;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using NDapper.Interfaces;
using System.Data;
using System.Data.SqlClient;
using WMBLogic.Services;


namespace WMServer.Configure
{
    public static class DIContainer
    {
        public static void RegisterComponents(this IServiceCollection services, IConfiguration configuration)
        {
            //ErrorLog
            services.AddScoped<ErrorLogger.ErrorLogger, ErrorLogger.ErrorLogger>();
            //ConnectionManager
            services.AddScoped<ConnectionManager.ConnectionManager, ConnectionManager.ConnectionManager>();
            //Dapper
            services.AddScoped<IDataBase, NDapper.Dapper>();
            //Services
            services.AddScoped<ProductsService, ProductsService>();
            services.AddScoped<FilterService, FilterService>();
            services.AddScoped<HeatingFloorService, HeatingFloorService>();
            services.AddScoped<OrderService, OrderService>();
            //Mail
            services.Configure<MailCredentials>(setup =>
            {
                setup.Address = configuration["MailCredentials:Address"];
                setup.Password = configuration["MailCredentials:Password"];
            });
            services.AddScoped<MailHandler, MailHandler>(x =>
            {
                var mc = x.GetService<IOptions<MailCredentials>>();
                var error = x.GetService<ErrorLogger.ErrorLogger>();

                return new MailHandler(new NetMail(), mc, error);
            });

            //DbConnection
            services.AddScoped<IDbConnection>(x =>
            {
                var conn = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));
                conn.Open();
                return conn;
            });
        }
    }
}
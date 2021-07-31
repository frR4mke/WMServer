using System.Data;
using System.Data.SqlClient;
using Mail;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using NDapper.Interfaces;
using WMBLogic.Models.INTERFACES;
using WMBLogic.Services;
using WMBLogic;


namespace WMServer.Configure
{
    public static class DIContainer
    {
        public static void RegisterComponents(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<DBContext>(options => options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));

            services.AddScoped<ProductsService, ProductsService>();

            //ConnectionManager
            services.AddScoped<ConnectionManager.ConnectionManager, ConnectionManager.ConnectionManager>();
            //Dapper
            // services.AddScoped<IDataBase, NDapper.Dapper>();
            //EF6
            services.AddScoped<IDataBase, WMBLogic.Repository.EF>();

            //Services          
            services.AddScoped<FilterService, FilterService>();
            services.AddScoped<OrderService, OrderService>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<PromotionsService, PromotionsService>();
            services.AddScoped<RepositoryService, RepositoryService>();
            services.AddScoped<WMBLogic.Services.ErrorLogger, WMBLogic.Services.ErrorLogger>();
            //Mail
            services.Configure<MailCredentials>(setup => {
                setup.Address = configuration["MailCredentials:Address"];
                setup.Password = configuration["MailCredentials:Password"];
            });
            services.AddScoped<MailHandler, MailHandler>(x => {
                var mc = x.GetService<IOptions<MailCredentials>>(); 

                return new MailHandler(new NetMail(), mc);
            });

            //DbConnection
            services.AddTransient<IDbConnection>(x => {
                return new SqlConnection(configuration.GetConnectionString("DefaultConnection"));
            });

            
        }
    }
}
using Microsoft.EntityFrameworkCore;
using WMBLogic.Models.DB;


namespace WMBLogic
{
    public partial class DBContext : DbContext
    {
        private ConnectionManager.ConnectionManager _connectionManager;
        
        public DBContext(ConnectionManager.ConnectionManager connectionManager)
        {
            _connectionManager = connectionManager;
            Database.EnsureCreated();
        }
        
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(_connectionManager.GetConnectionString());
            }
        }
        
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            OnModelCreatingPartial(modelBuilder);
        }
        
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

        public DbSet<GiftGoods> GiftGoods { get; set; }
        public DbSet<PercentageDiscount> PercentageDiscount { get; set; }
        public DbSet<OrdersDetails> OrdersDetails { get; set; }
        public DbSet<Orders> Orders { get; set; }
        public DbSet<AuthOption> AuthOption { get; set; }
        public DbSet<ErrorLog> ErrorLog { get; set; }
        public DbSet<CitiesServed> CitiesServed { get; set; }
        public DbSet<DeliveryMethods> DeliveryMethods { get; set; }
        public DbSet<OrderStates> OrderStates { get; set; }
        public DbSet<PaymentType> PaymentType { get; set; }
        public DbSet<PaymentMethods> PaymentMethods { get; set; }
        

        
    }
}
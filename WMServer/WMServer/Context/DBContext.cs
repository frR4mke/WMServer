// using ErrorLogger;
// using Microsoft.EntityFrameworkCore;
//
// namespace WMServer.Context
// {
//     public partial class DBContext : DbContext
//     {
//         private ConnectionManager.ConnectionManager _connectionManager;
//
//         public DBContext(ConnectionManager.ConnectionManager connectionManager)
//         {
//             _connectionManager = connectionManager;
//             Database.EnsureCreated();
//         }
//
//         protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//         {
//             if (!optionsBuilder.IsConfigured)
//             {
//                 optionsBuilder.UseSqlServer(_connectionManager.GetConnectionString());
//             }
//         }
//
//         protected override void OnModelCreating(ModelBuilder modelBuilder)
//         {
//             OnModelCreatingPartial(modelBuilder);
//         }
//
//         partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
//
//         public virtual DbSet<ErrorLog> Users { get; set; }
//     }
// }
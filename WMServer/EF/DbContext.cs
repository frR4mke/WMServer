using System;
using System.Data.Entity;
using ErrorLogger;

namespace EF
{
    public class DBContext : DbContext
    {
        private readonly ConnectionManager.ConnectionManager _connectionManager;

        public DBContext() :base("DefaultConnection")
        {
            
        }
        
        public DbSet<ErrorLog> ErrorLog { get; set; }

    }
}
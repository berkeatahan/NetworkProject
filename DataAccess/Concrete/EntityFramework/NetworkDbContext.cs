using Entities.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EntityFramework
{
    public class NetworkDbContext:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=DESKTOP-515MSAO\\SQLEXPRESS;Database=NetworkDb;Trusted_Connection=true;");
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category>  Categories { get; set; }

    }
}

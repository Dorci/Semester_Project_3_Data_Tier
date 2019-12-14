using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Tier3.Data;

namespace Tier3.Models
{
    public class DiningEventContext : DbContext
    {
        public DiningEventContext(DbContextOptions<DiningEventContext> options):base(options)
        {

        }

        public DbSet<DiningEvent> DiningEvents { get;set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<City> Cities { get; set; }
    }
}

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Tier3v4
{
    public class Database : Microsoft.EntityFrameworkCore.DbContext

    {
       

        public Database(DbContextOptions<Database> options ) : base(options)
        {

        }

        public Microsoft.EntityFrameworkCore.DbSet<User> Users { get; set; }
        public Microsoft.EntityFrameworkCore.DbSet<Event> Events { get; set; }
        public Microsoft.EntityFrameworkCore.DbSet<Address> Addresses { get; set; }

    }
}

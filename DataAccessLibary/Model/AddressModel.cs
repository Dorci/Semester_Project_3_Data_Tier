using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLibary.Model
{
    class Address
    {
        public string City { get; set; }
        public string StreeName { get; set; }
       public int BuildingNr { get; set; }
        public int Floor { get; set; }
       public int PostalCode { get; set; }
        public string Block { get; set; }
        public string Flat{ get; set; }

    }
}

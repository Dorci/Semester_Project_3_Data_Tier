using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLibary.Model
{
    class Address
    {
        string City { get; set; }
        string Street { get; set; }
        int StreetNr { get; set; }
        string DoorSide { get; set; }
        int PostCode { get; set; }

    }
}

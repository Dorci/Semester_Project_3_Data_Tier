using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Tier3v4
{
    public class Address
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int AddressId { get; set; }
        public string City { get; set; }
        public string StreetName { get; set; }
        public int Floor { get; set; }
        public string Block { get; set; }
        public string Flat { get; set; }
        public int BuildingNo { get; set; }
        public int PostalCode { get; set; }
    }
}

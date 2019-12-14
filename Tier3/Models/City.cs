using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Tier3.Models
{
    public class City
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CityId { get; set; }
        public string CityName { get; set; }
        public int PostalCode { get; set; }

        public override string ToString()
        {
            return $"{nameof(CityId)}: {CityId}, {nameof(CityName)}: {CityName}, {nameof(PostalCode)}: {PostalCode}";
        }
    }
}

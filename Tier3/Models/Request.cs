using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Tier3.Models;

namespace Tier3.Data
{
    public class Request
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int RequestId { get; set; }
        [ForeignKey("User")]
        public User UserId { get; set; }
        [ForeignKey("DiningEvent")]
        public int EventId { get; set; }
        [ForeignKey("Address")]
        public int AddressId { get; set; }
        [ForeignKey("City")]
        public int CityId { get; set; }

        public Boolean RequestStatus { get; set; }
       
    }
}

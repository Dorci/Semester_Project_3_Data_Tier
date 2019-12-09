using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Tier3v4
{
    public class Event
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int eventId { get; set; }
        public int myProperty { get; set; }
        public bool alcoholicDrink { get; set; }
        public string startTime { get; set; }
        public string endTime { get; set; }
        public string description { get; set; }
        public int ageLimit { get; set; }
        public bool pets { get; set; }
        public bool entertainment { get; set; }
        public int maxNoOfGuests { get; set; }
        public double entryFee { get; set; }
        public string starter { get; set; }
        public string mainCourse { get; set; }
        public string dessert { get; set; }

        public User userId { get; set; }
        public Address addressId { get; set; }
    }
}

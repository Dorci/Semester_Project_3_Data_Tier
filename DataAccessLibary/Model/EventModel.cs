using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLibary.Model
{
    class EventModel
    {
        public int UserId { get; set; }
        public int AddressId { get; set; }
        public DateTime Date { get; set; }
        public string Starter { get; set; }
        public string MainCourse { get; set; }
        public string Dessert { get; set; }
        public bool AlcoholicDrink { get; set; }


        public string StartTime { get; set; }

        public string EndTime { get; set; }
        public string Description { get; set; }
        public int AgeLimit { get; set; }
        public bool Pets { get; set; }

        public bool Entertainment { get; set; }
        public int MaximumNoOfGuests { get; set; }
        public double EntryFee { get; set; }
       



    }
}

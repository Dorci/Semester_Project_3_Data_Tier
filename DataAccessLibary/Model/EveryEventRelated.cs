using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLibary.Model
{
   public  class EveryEventRelated
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }

        string City { get; set; }
        string Street { get; set; }
        int StreetNr { get; set; }
        string DoorSide { get; set; }
        int PostCode { get; set; }
        int Day { get; set; }
        int Month { get; set; }
        int Year { get; set; }
        string Starter { get; set; }
        string MainCourse { get; set; }
        string Dessert { get; set; }
        string Alcoholic { get; set; }
        string NonAlciholic { get; set; }

        public string StartTime { get; set; }

        public string EndTime { get; set; }
        public string Description { get; set; }
        public int AgeLimit { get; set; }
        public string Pets { get; set; }

        public string Entertainment { get; set; }
        public int Guests { get; set; }
        public int WelcomeFee { get; set; }
    }
}

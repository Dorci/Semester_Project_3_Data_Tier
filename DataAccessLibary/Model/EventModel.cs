using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLibary.Model
{
    class EventModel
    {
        public int EventId { get; set; }
        public int UserId { get; set; }
        public struct Address { 

            string City { get; set; }
            string Street { get; set; }
            int StreetNr { get; set; }
            string DoorSide { get; set; }
            int PostCode { get; set; }

        
        }

        public struct Date 
        { 
            int Day { get; set; }
            int Month { get; set; }
            int Year { get; set; }
        }

        public struct Food 
        { 
            string Starter { get; set; }
            string MainCourse { get; set; }
            string Dessert { get; set; }
        }
        public struct Drink 
        {
        string Alcoholic { get; set; }
        string NonAlciholic { get; set; }
        }
        public int StartTime { get; set; }

        public int EndTime { get; set; }
        public int Description { get; set; }
        public int AgeLimit { get; set; }
        public int Pets { get; set; }
        
        public int Entertainment { get; set; }
        public int Guests { get; set; }
        public int WelcomeFee { get; set; }

    }
}

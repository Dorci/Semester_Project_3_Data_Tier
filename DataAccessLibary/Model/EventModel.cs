using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLibary.Model
{
    class EventModel
    {
        
        public int StartTime { get; set; }

        public int EndTime { get; set; }
        public string Description { get; set; }
        public int AgeLimit { get; set; }
        public string Pets { get; set; }
        
        public string Entertainment { get; set; }
        public int Guests { get; set; }
        public int WelcomeFee { get; set; }
        public DateTime datet { get; set; }
       public bool alcoholic { get; set; }

        

    }
}

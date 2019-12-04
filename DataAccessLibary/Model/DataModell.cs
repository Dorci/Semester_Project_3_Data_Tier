using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLibary.Model
{
   public class DataModell
    {
       
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }

        public DateTime Dob { get; set; }
        public string Password { get; set; }

    }
}

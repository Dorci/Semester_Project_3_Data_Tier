using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Tier3v4
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int userID { get; set; }
        public string fName  { get; set; }
        public string lName { get; set; }
        public string email { get; set; }
        public DateTime dob { get; set; }
        public string password { get; set; }
    }
}

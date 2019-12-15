using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Tier3.Models
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UserId { get; set; }
        public string FName  { get; set; }
        public string LName { get; set; }
        public string Email { get; set; }
        public string Dob { get; set; }
        public string Password { get; set; }
        

       
    }
}

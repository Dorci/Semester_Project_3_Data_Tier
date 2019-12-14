using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SEP3.Models
{
    public class UserModel
    {
        [Display(Name = "User ID")]
        [Range(1000, 9999, ErrorMessage ="You must enter a valid UserId.")]
        public int UserId { get; set; }

        [Display(Name = "First Name")]
        [Required(ErrorMessage = "You need to give us your first name.")]
        public string FirstName{ get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "You need to give us your last name.")]
        public string LastName { get; set; }

        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email Address")]
        [Required(ErrorMessage = "You need to give us your email address.")]
        public string EmailAddress { get; set; }

        [Display(Name = "Confirm Email")]
        [Compare("EmailAddress", ErrorMessage = "The Email and Confirm do not match.")]
        
        public string ConfirmEmail { get; set; }

        [Display(Name = "Age")]
        [Range(16, 120, ErrorMessage = "You must enter a valid age.")]
        [Required(ErrorMessage = "You need to give us your age.")]
        public int Age { get; set; }

        [Display(Name = "Password")]
        [Required(ErrorMessage ="You must have a password.")]
        [DataType(DataType.Password)]
        [StringLength(100, MinimumLength = 4, ErrorMessage = "You must provide a long enough password.")]
        public string Password { get; set; }

        [Display(Name = "Confirm Password")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage ="Your password and confirm password do not match.")]
        public string ConfirmPassword { get; set; }
    }
}
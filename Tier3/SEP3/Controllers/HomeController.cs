using SEP3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLibary;
using static DataLibary.BusinessLogic.UserProcessor;
using DataLibary.Model;

namespace SEP3.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }

        public ActionResult SignUp()
        {
            ViewBag.Title = "Create Account";

            return View();
        }

      

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SignUp(UserModel model)
        {
            if (ModelState.IsValid)
            {
               int recordsCreate = CreateUser(model.UserId,
                    model.FirstName,
                    model.LastName,
                    model.EmailAddress,
                    model.Age);
                return RedirectToAction("Index");
            }

            return View();
        }

        public ActionResult ViewUsers()
        {
            ViewBag.Title = "User List";

            var data = LoadUsers();

            List<UserModel> users = new List<UserModel>();

            foreach (var row in data)
            {
                users.Add(new UserModel
                {
                    UserId = row.UserId,
                    FirstName = row.FirstName,
                    LastName = row.LastName,
                    EmailAddress = row.EmailAddress,
                    ConfirmEmail = row.EmailAddress,
                    Age = row.Age
                });

            }

            ViewData["Users"] = users;

            return View();
        }
    }
}

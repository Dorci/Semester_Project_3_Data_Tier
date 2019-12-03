using DataAccessLibary.DataAccess;
using DataAccessLibary.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLibary.BusnissLogic
{
    public static class DBLogic
    {
        public static int CreateUser(string firstName, string lastName, string emailAddress, int age)
        {
            DataModell data = new DataModell
            {
                
                FirstName = firstName,
                LastName = lastName,
                EmailAddress = emailAddress,
                Age = age
            };

            string sql = @"INSERT INTO [dbo].[User](FirstName, LastName, EmailAddress,Age) VALUES ( @FirstName, @LastName, @EmailAddress, @Age);";

            return DBHelper.SaveData(sql, data);
        }

        public static List<DataModell> LoadUsers()
        {
            string sql = @"SELECT UserId, FirstName, LastName, EmailAddress, Age FROM [dbo].[User];";

            return (List<DataModell>)DBHelper.LoadData<DataModell>(sql);
        }

        //public static int CreateEventint(int eventId, int userId, struct address, struct date, struct food, struct drink, int startTime, int endTime, string description, int ageLimit, string pets, string entertainment, int guests, int welcomeFee)
        //{
        //    EventModel eData = new EventModel
        //    {
        //       EventId = eventId,
        //   UserId = userId,
        // address = address, 
        // Date = date, 
        // Food = food, 
        // Drink = drink, 
        // StartTime = startTime, 
        // EndTime = endTime,
        // Description = description,
        // AgeLimit = ageLimit, 
        // Pets = pets,
        // Entertainment = entertainment, 
        // Guests = guests,
        // WelcomeFee = welcomeFee
        //    };

        //string sql = @"INSERT INTO [dbo].[User](UserId,FirstName, LastName, EmailAddress,Age) VALUES (@UserId, @FirstName, @LastName, @EmailAddress, @Age);";

        //    return DBHelper.SaveData(sql, eData);
        //}
    }
}

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
        public static int CreateUser(string firstName, string lastName, string emailAddress, DateTime dob,string password)
        {
            DataModell data = new DataModell
            {

                FirstName = firstName,
                LastName = lastName,
                EmailAddress = emailAddress,
                Dob = dob,
               Password = password
            };

            string sql = @"INSERT INTO [dbo].[UserTable](FName, LName, email,dob,passwordq) VALUES ( @FirstName, @LastName, @EmailAddress, @Dob,@Password);";

            return DBHelper.SaveData(sql, data);
        }

        public static List<DataModell> LoadUsers()
        {
            string sql = @"SELECT fName, LName, email FROM [dbo].[UserTable] where dbo.UserTable.userId = 1;";

            return (List<DataModell>)DBHelper.LoadData<DataModell>(sql);
        }

        public static List<EveryEventRelated> LoadEvent()
        {
            string sql = @"SELECT dbo.UserTable.fName, dbo.UserTable.lName , dbo.AddressTable.city,dbo.AddressTable.street,dbo.AddressTable.streetNr,dbo.AddressTable.doorSide,dbo.AddressTable.postCode,dbo.Date.day,dbo.Date.month,dbo.Date.year,dbo.FoodTable.starter,dbo.FoodTable.mainCourse,dbo.FoodTable.dessert,dbo.DrinkTable.alcoholic,dbo.DrinkTable.nonAlcoholic,dbo.EventTable.startTime,dbo.EventTable.endTime,dbo.EventTable.descriptions,dbo.EventTable.ageLimit,dbo.EventTable.pets,dbo.EventTable.entertainment,dbo.EventTable.guests,dbo.EventTable.welcomeFee
                            FROM dbo.EventTable
                            FULL OUTER JOIN dbo.UserTable ON dbo.EventTable.userId = dbo.UserTable.userId
                            FULL OUTER JOIN dbo.AddressTable ON dbo.EventTable.AddressId = dbo.AddressTable.AddressId
                            FULL OUTER JOIN dbo.Date on dbo.EventTable.DateId = dbo.Date.DateId
                            FULL OUTER JOIN dbo.FoodTable on dbo.EventTable.foodId = dbo.FoodTable.foodId
                            FULL OUTER JOIN dbo.DrinkTable on dbo.EventTable.drinkId = dbo.DrinkTable.drinkId;";
            return (List<EveryEventRelated>)DBHelper.LoadData<EveryEventRelated>(sql);
        }

        //public static bool accountExists(string emailAddress, string password)
        //{
        //    bool accountExists = false;
        //    DataModell data = new DataModell
        //    {
        //        EmailAddress = emailAddress,
        //        Password = password
        //    };
        //    string sql = @"SELECT dbo.UserTable.email, dbo.UserTable.passwordq from UserTable where dbo.UserTable.email = '@EmailAddress' and dbo.UserTable.passwordq = '@Password';";

        //    if()
            
        //}

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

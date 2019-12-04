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
            string sql =    @"SELECT dbo.UserTable.fName, dbo.UserTable.lName , dbo.AddressTable.city,dbo.AddressTable.streeName,dbo.AddressTable.floor,dbo.AddressTable.block,dbo.AddressTable.flat,dbo.AddressTable.buildingNr,dbo.AddressTable.postalCode,dbo.EventTable.dateT,dbo.EventTable.starter,dbo.EventTable.mainCourse,dbo.EventTable.dessert,dbo.EventTable.alcoholicDrink,dbo.EventTable.startTime,dbo.EventTable.endTime,dbo.EventTable.description,dbo.EventTable.ageLimit,dbo.EventTable.pets,dbo.EventTable.entertainment,dbo.EventTable.MaxNoOfGuests,dbo.EventTable.entryFee
                            FROM dbo.EventTable
                            FULL OUTER JOIN dbo.UserTable ON dbo.EventTable.userId = dbo.UserTable.userId
                            FULL OUTER JOIN dbo.AddressTable ON dbo.EventTable.AddressId = dbo.AddressTable.AddressId";
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

        public static int CreateEventint(int userId,int addressId , string city, string streeName, int floor, string block, string flat, int buildingNr, int postalCode, DateTime dateT, string starter, string mainCourse, string dessert, bool alcoholicDrink, string startTime,string endTime, string description, int ageLimit, bool pets, bool entertainment, int MaxNoOfGuests, double entryFee)
        {
            EventModel eventData = new EventModel
            {
             UserId = userId,
             AddressId = addressId,
             AlcoholicDrink = alcoholicDrink,
             StartTime = startTime,
             EndTime = endTime,
             Description = description,
             AgeLimit = ageLimit,
             Pets = pets,
             Entertainment = entertainment,
             MaximumNoOfGuests = MaxNoOfGuests,
             EntryFee = entryFee,
             Date = dateT,
             Starter = starter,
             MainCourse = mainCourse,
             Dessert = dessert
                
            };

            Address addressData = new Address
            {
                City = city,
                StreeName = streeName,
                Floor = floor,
                Block = block,
                Flat = flat,
                BuildingNr = buildingNr,
                PostalCode = postalCode


            };

            if(addressData != null )
            {
                string sql = @"INSERT INTO [dbo].[UserTable](FName, LName, email,dob,passwordq) VALUES ( @FirstName, @LastName, @EmailAddress, @Dob,@Password);";

                return DBHelper.SaveData(sql, data);
            }



        //string sql = @"INSERT INTO [dbo].[User](UserId,FirstName, LastName, EmailAddress,Age) VALUES (@UserId, @FirstName, @LastName, @EmailAddress, @Age);";

        //    return DBHelper.SaveData(sql, eData);
        }
    }
}

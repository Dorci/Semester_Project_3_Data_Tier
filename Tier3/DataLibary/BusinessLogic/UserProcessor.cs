using DataLibary.DataAccess;
using DataLibary.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibary.BusinessLogic
{
    public static class UserProcessor
    {
        public static int CreateUser(int userId, string firstName, string lastName, string emailAddress, int age)
        {
            UserModelDB data = new UserModelDB
            {
                UserId = userId,
                FirstName = firstName,
                LastName = lastName,
                EmailAddress = emailAddress,
                Age = age
            };

            string sql = @"INSERT INTO dbo.UserTable(UserId,FirstName, LastName, EmailAddress,Age) VALUES (@UserId, @FirstName, @LastName, @EmailAddress, @Age);";

            return SqlDataAccess.SaveData(sql, data);
        }

        public static List<UserModelDB> LoadUsers()
        {
            string sql = @"SELECT UserId, FirstName, LastName, EmailAddress, Age
                         FROM dbo.UserTable;";

            return SqlDataAccess.LoadData<UserModelDB>(sql);
        }
    }
}

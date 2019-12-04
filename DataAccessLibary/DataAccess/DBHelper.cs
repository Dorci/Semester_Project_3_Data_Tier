using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLibary.DataAccess
{
   public static class DBHelper
    {
        
            public static string GetConnectionString(string connectionName = "Database")
            {
                return ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
            }

            public static List<T> LoadData<T>(string sql)
            {
                using (IDbConnection cnn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Tier3;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"))
                {
                    return cnn.Query<T>(sql).ToList();
                }
            }

            public static int SaveData<T>(string sql, T data)
            {
                using (IDbConnection cnn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Tier3;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"))
                {
                    return cnn.Execute(sql, data);
                }
            }
        
    }
}

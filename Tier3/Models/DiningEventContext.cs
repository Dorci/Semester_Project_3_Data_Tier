using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Tier3.Data;
using Tier3.Models;
using Tier3.Socket;

namespace Tier3.Models
{
    public class DiningEventContext : DbContext
    {
        public DiningEventContext(DbContextOptions<DiningEventContext> options):base(options)
        {
            
        }
        

        public DbSet<DiningEvent> DiningEvents { get;set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<User> User { get; set; }
//        
//        private void SocketLogin()
//        {
//            Console.WriteLine("Starting Server...");
//
//            IPAddress ipAddress = Dns.Resolve("localhost").AddressList[0];
//            TcpListener listener = new TcpListener(ipAddress,4567);
//            listener.Start();
//            
//
//            Console.WriteLine("Server started");
//            TcpClient client = listener.AcceptTcpClient()
//                ;
//            Console.WriteLine("Client accepted");
//            NetworkStream stream = client.GetStream()
//                ;
//
//            byte[] bytes = new byte[1024];
//            int bytesRead = stream.Read(bytes, 0, bytes.Length);
//            String messageFromClient = Encoding.ASCII.GetString(bytes, 0, bytesRead);
//            Login login = JsonConvert.DeserializeObject<Login>(messageFromClient);
//            var userFromDb = User.Single(a => a.Email.Equals(login.Email));
//            if (userFromDb == null)
//            {
//                SendMessage("Email not found", stream);
//            }
//            else if(userFromDb.Password.Equals(login.Password))
//            {
//                SendMessage("Login successful", stream);
//            }
//            else
//            {
//                SendMessage("Password mismatched", stream);
//            }
//            
//            client.Close();
//        }

//        private void SendMessage(String message, NetworkStream stream)
//        {
//            byte[] bytess = Encoding.ASCII.GetBytes(message);
//            stream.Write(bytess,0,bytess.Length);
//        }

       
    }
}

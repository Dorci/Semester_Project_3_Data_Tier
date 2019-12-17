using System;
using System.Net.Sockets;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SQLitePCL;
using Tier3.Models;

namespace Tier3.Socket
{
    public class SocketListener
    {


        public static void main(String[] args)
        {

            Console.WriteLine("Starting Server...");
            TcpListener listener = new TcpListener(4000);
            listener.Start();

            Console.WriteLine("Server started");
            TcpClient client = listener.AcceptTcpClient()
                ;
            Console.WriteLine("Client accepted");
            NetworkStream stream = client.GetStream()
                ;

            byte[] bytes = new byte[1024];
            int bytesRead = stream.Read(bytes, 0, bytes.Length);
            String messageFromClient = Encoding.ASCII.GetString(bytes, 0, bytesRead);
            Login login = JsonConvert.DeserializeObject<Login>(messageFromClient);
            
            Console.WriteLine(messageFromClient);
            client.Close();
            Console.WriteLine("Server terminated");
        }
    }
}
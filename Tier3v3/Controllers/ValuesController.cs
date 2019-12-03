using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataAccessLibary.BusnissLogic;
using DataAccessLibary.Model;
using Microsoft.AspNetCore.Mvc;


namespace Tier3v3.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET api/values
        [HttpGet]
       public ActionResult<IEnumerable<DataModell>> Get()
       {
             
            return DBLogic.LoadUsers(); 
       }

        [HttpGet("test")]
        public ActionResult<IEnumerable<DataModell>> GetTest()
        {

            return Ok("hi");
        }

        ////// GET api/values/5
        //[HttpGet("{id}")]
        //public ActionResult<string> Get(int id)
        //{
        //    return "value";
        //}

        // POST api/values
        [HttpPost]
        public void Post([FromBody] DataModell data)
        {
            DBLogic.CreateUser(data.FirstName, data.LastName, data.EmailAddress, data.Age);
        }

        // PUT api/values/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        // DELETE api/values/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}

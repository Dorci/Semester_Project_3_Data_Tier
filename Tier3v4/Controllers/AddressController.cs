using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Tier3v4;

namespace Tier3v4.Controllers
{
    [Route("api/Addresses")]
    [ApiController]
    public class AddressController : ControllerBase

        
    {
        private readonly Database data;

        public AddressController(Database database)
        {
            data = database;
        }
        //Get: api/Addresses
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Address>>> GetAddress()
        {
            return await data.Addresses.ToListAsync();
        }
        //post: api/Addresses
        [HttpPost]
        public async Task<ActionResult<Address>> PostAddress(Address address)
        {
            data.Addresses.Add(address);
            await data.SaveChangesAsync();

            return CreatedAtAction("GetAddress", new { id = address.AddressId }, address);

        }

    }
}

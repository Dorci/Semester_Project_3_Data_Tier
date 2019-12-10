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
    [Route("api/Users")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly Database data;

        public UsersController(Database context)
        {
            data = context;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> Getusers()
        {
            return await data.Users.ToListAsync();
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            var user = await data.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }
        [HttpGet("{email}")]
        public async Task<ActionResult<User>> GetUser(string email)
        {
            var user = await data.Users.FindAsync(email);
            if (user == null)
            {
                return NotFound();


            }
            return user;
        }
        //[HttpGet("{email}")]
        //public async Task<ActionResult<User>> GetUserId(string email)
        //{
        //    var user = data.Users.Where(u => u.Equals(email)).Select(s=>s.userID);

        //    if(email == null)
        //    {
        //        return NotFound();
        //    }
            
        //    return (User)user;

        //}

        // PUT: api/Users/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{i}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            if (id != user.userID)
            {
                return BadRequest();
            }

            data.Entry(user).State = EntityState.Modified;

            try
            {
                await data.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // PUT: api/Users/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{check}")]
        public async Task<IActionResult> PutUserByEmail(string email, User user)
        {
            if (email != user.email)
            {
                return BadRequest();
            }

            data.Entry(user).State = EntityState.Modified;

            try
            {
                await data.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmailExists(email))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Users
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            data.Users.Add(user);
            await data.SaveChangesAsync();

            return CreatedAtAction("GetUser", new { id = user.userID }, user);
        }
        

        
        // DELETE: api/Users/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<User>> DeleteUser(int id)
        {
            var user = await data.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            data.Users.Remove(user);
            await data.SaveChangesAsync();

            return user;
        }

        private bool UserExists(int id)
        {
            return data.Users.Any(e => e.userID == id);
        }
        private bool EmailExists(string email)
        {
            return data.Users.Any(e =>e.email == email);
        }
    }
}

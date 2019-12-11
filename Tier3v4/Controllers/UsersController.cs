using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Tier3v4.Controllers
{
    [Route("api/{controller}")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly Database _data;

        public UsersController(Database context)
        {
            _data = context;
        }

        // GET: api/Users
        [HttpGet("allUsers")]
        public async Task<ActionResult<IEnumerable<User>>> Getusers()
        {
            return await _data.Users.ToListAsync();
        }

        // GET: api/Users/5
        [HttpGet("userID")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            var user = await _data.Users.FindAsync(id);

            if (user == null) return NotFound();

            return user;
        }
        //[HttpGet("{email}")]
        //public async Task<ActionResult<User>> GetUser(string email)
        //{
        //    var user = await data.Users.FindAsync(email);
        //    if (user == null)
        //    {
        //        return NotFound();


        //    }
        //    return user;
        //}
        [HttpGet("user")]
        public async Task<ActionResult<int>> GetUserId(string email)
        {
            var userId = _data.Users
                .Where(u => u.email.Equals(email)).Select(s => s.userID);

            if (email == null) return NotFound();

            return userId.ToList()[0];
        }

        // PUT: api/Users/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.

        [HttpPost("login")]
        public async Task<ActionResult<int>> LoginUser(string email, string password)
        {
            var check = await _data.Users.FirstAsync(p => p.email.Equals(email));
            if (check == null) return NotFound();

            if (!check.password.Equals(password)) return BadRequest();

            return check.userID;
        }


        [HttpPost("register")]
        public async Task<ActionResult<User>> RegisterUser(User user)
        {
            Console.WriteLine(user);
            var check1 = await _data.Users.AnyAsync(u => u.email.Equals(user.email));
            if (check1) return BadRequest();

            _data.Users.Add(user);
            await _data.SaveChangesAsync();
            return user;
        }


        [HttpPut("{i}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            if (id != user.userID) return BadRequest();

            _data.Entry(user).State = EntityState.Modified;

            try
            {
                await _data.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                    return NotFound();
                throw;
            }

            return NoContent();
        }

        // PUT: api/Users/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{check}")]
        public async Task<IActionResult> PutUserByEmail(string email, User user)
        {
            if (email != user.email) return BadRequest();

            _data.Entry(user).State = EntityState.Modified;

            try
            {
                await _data.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmailExists(email))
                    return NotFound();
                throw;
            }

            return NoContent();
        }

        // POST: api/Users
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            _data.Users.Add(user);
            await _data.SaveChangesAsync();

            return CreatedAtAction("GetUser", new {id = user.userID}, user);
        }


        // DELETE: api/Users/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<User>> DeleteUser(int id)
        {
            var user = await _data.Users.FindAsync(id);
            if (user == null) return NotFound();

            _data.Users.Remove(user);
            await _data.SaveChangesAsync();

            return user;
        }

        private bool UserExists(int id)
        {
            return _data.Users.Any(e => e.userID == id);
        }

        private bool EmailExists(string email)
        {
            return _data.Users.Any(e => e.email == email);
        }
    }
}
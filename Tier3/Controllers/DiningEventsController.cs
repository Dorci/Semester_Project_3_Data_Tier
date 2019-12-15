using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query.Internal;
using Tier3.Models;

namespace Tier3.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiningEventsController : ControllerBase
    {
        private readonly DiningEventContext _context;

        public DiningEventsController(DiningEventContext context)
        {
            _context = context;
        }

        // GET: api/DiningEvents
        [HttpGet]
        public async Task<ActionResult<List<DiningEvent>>> GetDiningEvents()
        {
            // Return whole hierarchy
            // TODO: Read this :)
            return await _context.DiningEvents
                .Include(a => a.Address)
                    .ThenInclude(city => city.City)
                .ToListAsync();
        }

        // GET: api/DiningEvents/5
        [HttpGet("{id}")]
        public async Task<ActionResult<DiningEvent>> GetDiningEvent(int id)
        {
            var diningEvent = await _context.DiningEvents.FindAsync(id);

            if (diningEvent == null)
            {
                return NotFound();
            }

            return diningEvent;
        }

        // PUT: api/DiningEvents/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDiningEvent(int id, DiningEvent diningEvent)
        {
            if (id != diningEvent.EventId)
            {
                return BadRequest();
            }

            _context.Entry(diningEvent).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DiningEventExists(id))
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

        // POST: api/DiningEvents
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost("newEvent")]
        public async Task<ActionResult<DiningEvent>> PostDiningEvent(DiningEvent diningEvent)
        {
            Console.WriteLine("Received: " + diningEvent);
            _context.DiningEvents.Add(diningEvent);
            Console.WriteLine(_context.Addresses);

            await _context.SaveChangesAsync();

            return CreatedAtAction("GetDiningEvent", new { id = diningEvent.EventId }, diningEvent);
        }

        // DELETE: api/DiningEvents/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<DiningEvent>> DeleteDiningEvent(int id)
        {
            var diningEvent = await _context.DiningEvents.FindAsync(id);
            if (diningEvent == null)
            {
                return NotFound();
            }

            _context.DiningEvents.Remove(diningEvent);
            await _context.SaveChangesAsync();

            return diningEvent;
        }

        private bool DiningEventExists(int id)
        {
            return _context.DiningEvents.Any(e => e.EventId == id);
        }
    }
}

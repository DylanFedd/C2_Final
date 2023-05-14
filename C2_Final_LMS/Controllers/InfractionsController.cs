using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using C2_Final.Models;
using Microsoft.AspNetCore.Authorization;
using System.Data;

namespace C2_Final.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "law")]
    public class InfractionsController : ControllerBase
    {
        private readonly C2_FinalContext _context;

        public InfractionsController(C2_FinalContext context)
        {
            _context = context;
        }

        // GET: api/Infractions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Infraction>>> GetInfractions()
        {
          if (_context.Infractions == null)
          {
              return NotFound();
          }
            return await _context.Infractions.ToListAsync();
        }

        // GET: api/Infractions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Infraction>> GetInfraction(int id)
        {
          if (_context.Infractions == null)
          {
              return NotFound();
          }
            var infraction = await _context.Infractions.FindAsync(id);

            if (infraction == null)
            {
                return NotFound();
            }

            return infraction;
        }

        // PUT: api/Infractions/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInfraction(int id, Infraction infraction)
        {
            if (id != infraction.InfractionsId)
            {
                return BadRequest();
            }

            _context.Entry(infraction).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InfractionExists(id))
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

        // POST: api/Infractions
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Infraction>> PostInfraction(Infraction infraction)
        {
          if (_context.Infractions == null)
          {
              return Problem("Entity set 'C2_FinalContext.Infractions'  is null.");
          }
            _context.Infractions.Add(infraction);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InfractionExists(infraction.InfractionsId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInfraction", new { id = infraction.InfractionsId }, infraction);
        }

        // DELETE: api/Infractions/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInfraction(int id)
        {
            if (_context.Infractions == null)
            {
                return NotFound();
            }
            var infraction = await _context.Infractions.FindAsync(id);
            if (infraction == null)
            {
                return NotFound();
            }

            _context.Infractions.Remove(infraction);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InfractionExists(int id)
        {
            return (_context.Infractions?.Any(e => e.InfractionsId == id)).GetValueOrDefault();
        }
    }
}

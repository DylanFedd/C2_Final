using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using C2_Final.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.CodeAnalysis.VisualBasic.Syntax;

namespace C2_Final.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize(Roles = "dmv,law")]
    public class DriversController : ControllerBase
    {
        private readonly C2_FinalContext _context;

        public DriversController(C2_FinalContext context)
        {
            _context = context;
        }

        // GET: api/Drivers
        // [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Driver>>> GetDrivers()
        {
          if (_context.Drivers == null)
          {
              return NotFound();
          }
            return await _context.Drivers.ToListAsync();
        }

        // GET: api/Drivers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Driver>> GetDriver(int id)
        {
          if (_context.Drivers == null)
          {
              return NotFound();
          }
            var driver = await _context.Drivers.FindAsync(id);

            if (driver == null)
            {
                return NotFound();
            }

            return driver;
        }

        // GET: GetDriverByName
        [HttpGet()]
        public async Task<ActionResult<Driver>> GetDriverByName( [FromQuery] DriversLookUp lookup)
        {
            if (_context.Drivers == null)
            {
                return NotFound();
            }

            var driver = _context.Drivers.Where(driver => driver.DriverFname == lookup.FName && driver.DriverLname == lookup.LName).FirstOrDefault();

            if (driver == null)
            {
                return NotFound();
            }

            return driver;
        }

        // GET: GetDriverBySSN
        [HttpGet()]
        public async Task<ActionResult<Driver>> GetDriverBySSN([FromQuery] DriversLookUpSSN lookup)
        {
            if (_context.Drivers == null)
            {
                return NotFound();
            }

            var driver = _context.Drivers.Where(driver => driver.Ssn == lookup.SSN).FirstOrDefault();

            if (driver == null)
            {
                return NotFound();
            }

            return driver;
        }

        // PUT: api/Drivers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDriver(int id, Driver driver)
        {
            if (id != driver.DriversLicenseNumber)
            {
                return BadRequest();
            }

            _context.Entry(driver).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DriverExists(id))
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

        // POST: api/Drivers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Driver>> PostDriver(Driver driver)
        {
          if (_context.Drivers == null)
          {
              return Problem("Entity set 'C2_FinalContext.Drivers'  is null.");
          }
            _context.Drivers.Add(driver);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (DriverExists(driver.DriversLicenseNumber))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetDriver", new { id = driver.DriversLicenseNumber }, driver);
        }

        // DELETE: api/Drivers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDriver(int id)
        {
            if (_context.Drivers == null)
            {
                return NotFound();
            }
            var driver = await _context.Drivers.FindAsync(id);
            if (driver == null)
            {
                return NotFound();
            }

            _context.Drivers.Remove(driver);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DriverExists(int id)
        {
            return (_context.Drivers?.Any(e => e.DriversLicenseNumber == id)).GetValueOrDefault();
        }
    }
}

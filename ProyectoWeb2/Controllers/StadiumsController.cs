using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Models;

namespace ProyectoWeb2.Controllers
{
    // [ApiController] attribute indicates that this controller responds to web API requests.
    [ApiController]
    // [Route] attribute defines the URL pattern for the actions in this controller.
    // "api/[controller]" means the URL will be "/api/Stadiums".
    [Route("api/[controller]")]
    public class StadiumsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        // The database context is injected into the controller via the constructor.
        // This is called Dependency Injection and is a best practice in ASP.NET Core.
        public StadiumsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Stadiums
        // This endpoint retrieves all stadiums from the database.
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Stadium>>> GetStadiums()
        {
            // Asynchronously fetches the list of all stadiums and returns them.
            return await _context.Stadiums.ToListAsync();
        }

        // GET: api/Stadiums/5
        // This endpoint retrieves a specific stadium by its ID.
        [HttpGet("{id}")]
        public async Task<ActionResult<Stadium>> GetStadium(int id)
        {
            // Asynchronously finds a stadium by its primary key (Id).
            var stadium = await _context.Stadiums.FindAsync(id);

            // If the stadium is not found, return a 404 Not Found response.
            if (stadium == null)
            {
                return NotFound();
            }

            // If found, return the stadium with a 200 OK response.
            return stadium;
        }

        // POST: api/Stadiums
        // This endpoint creates a new stadium.
        [HttpPost]
        public async Task<ActionResult<Stadium>> PostStadium(Stadium stadium)
        {
            // Adds the new stadium entity to the context.
            _context.Stadiums.Add(stadium);
            // Asynchronously saves the changes to the database.
            await _context.SaveChangesAsync();

            // Returns a 201 Created response, including the newly created stadium and a URL to access it.
            return CreatedAtAction(nameof(GetStadium), new { id = stadium.StadiumId }, stadium);
        }

        // PUT: api/Stadiums/5
        // This endpoint updates an existing stadium.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutStadium(int id, Stadium stadium)
        {
            // If the ID in the URL doesn't match the ID in the request body, return a 400 Bad Request.
            if (id != stadium.StadiumId)
            {
                return BadRequest();
            }

            // Mark the entity as modified. EF Core will generate an UPDATE statement.
            _context.Entry(stadium).State = EntityState.Modified;

            try
            {
                // Try to save the changes to the database.
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // If the record was modified or deleted by another user, check if it still exists.
                if (!StadiumExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            // Return a 204 No Content response, indicating success.
            return NoContent();
        }

        // DELETE: api/Stadiums/5
        // This endpoint deletes a stadium.
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStadium(int id)
        {
            var stadium = await _context.Stadiums.FindAsync(id);
            if (stadium == null)
            {
                return NotFound();
            }

            _context.Stadiums.Remove(stadium);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool StadiumExists(int id)
        {
            return _context.Stadiums.Any(e => e.StadiumId == id);
        }
    }
}

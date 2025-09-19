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
    public class AttractionsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        // The database context is injected into the controller via the constructor.
        // This is called Dependency Injection and is a best practice in ASP.NET Core.
        public AttractionsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Stadiums
        // This endpoint retrieves all stadiums from the database.
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TouristAttraction>>> GetAttractions()
        {
            // Asynchronously fetches the list of all stadiums and returns them.
            return await _context.TouristAttractions.ToListAsync();
        }

        // GET: api/Stadiums/5
        // This endpoint retrieves a specific stadium by its ID.
        [HttpGet("{id}")]
        public async Task<ActionResult<TouristAttraction>> GetAttraction(int id)
        {
            // Asynchronously finds a stadium by its primary key (Id).
            var attraction = await _context.TouristAttractions.FindAsync(id);

            // If the stadium is not found, return a 404 Not Found response.
            if (attraction == null)
            {
                return NotFound();
            }

            // If found, return the stadium with a 200 OK response.
            return attraction;
        }

        // POST: api/Stadiums
        // This endpoint creates a new stadium.
        [HttpPost]
        public async Task<ActionResult<TouristAttraction>> PostAttraction(TouristAttraction attraction)
        {
            // Adds the new stadium entity to the context.
            _context.TouristAttractions.Add(attraction);
            // Asynchronously saves the changes to the database.
            await _context.SaveChangesAsync();

            // Returns a 201 Created response, including the newly created stadium and a URL to access it.
            return CreatedAtAction(nameof(GetAttraction), new { id = attraction.AttractionId }, attraction);
        }

        // PUT: api/Stadiums/5
        // This endpoint updates an existing stadium.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAttraction(int id, TouristAttraction attraction)
        {
            // If the ID in the URL doesn't match the ID in the request body, return a 400 Bad Request.
            if (id != attraction.AttractionId)
            {
                return BadRequest();
            }

            // Mark the entity as modified. EF Core will generate an UPDATE statement.
            _context.Entry(attraction).State = EntityState.Modified;

            try
            {
                // Try to save the changes to the database.
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // If the record was modified or deleted by another user, check if it still exists.
                if (!AttractionExists(id))
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
        public async Task<IActionResult> DeleteAttraction(int id)
        {
            var attraction = await _context.TouristAttractions.FindAsync(id);
            if (attraction == null)
            {
                return NotFound();
            }

            _context.TouristAttractions.Remove(attraction);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AttractionExists(int id)
        {
            return _context.TouristAttractions.Any(e => e.AttractionId == id);
        }
    }
}

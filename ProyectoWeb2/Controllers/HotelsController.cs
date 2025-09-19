using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Models;

namespace ProyectoWeb2.Controllers
{
    // [ApiController] attribute indicates that this controller responds to web API requests.
    [ApiController]
    // [Route] attribute defines the URL pattern for the actions in this controller.
    // "api/[controller]" means the URL will be "/api/Hotels".
    [Route("api/[controller]")]
    public class HotelsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        // The database context is injected into the controller via the constructor.
        // This is called Dependency Injection and is a best practice in ASP.NET Core.
        public HotelsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Hotels
        // This endpoint retrieves all hotels from the database.
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetHotels()
        {
            // Asynchronously fetches the list of all hotels and returns them.
            return await _context.Hotels.ToListAsync();
        }

        // GET: api/Hotels/5
        // This endpoint retrieves a specific hotel by its ID.
        [HttpGet("{id}")]
        public async Task<ActionResult<Hotel>> GetHotel(int id)
        {
            // Asynchronously finds a hotel by its primary key (Id).
            var hotel = await _context.Hotels.FindAsync(id);

            // If the hotel is not found, return a 404 Not Found response.
            if (hotel == null)
            {
                return NotFound();
            }

            // If found, return the hotel with a 200 OK response.
            return hotel;
        }

        // POST: api/Hotels
        // This endpoint creates a new hotel.
        [HttpPost]
        public async Task<ActionResult<Hotel>> PostHotel(Hotel hotel)
        {
            // Adds the new hotel entity to the context.
            _context.Hotels.Add(hotel);
            // Asynchronously saves the changes to the database.
            await _context.SaveChangesAsync();

            // Returns a 201 Created response, including the newly created hotel and a URL to access it.
            return CreatedAtAction(nameof(GetHotel), new { id = hotel.HotelId }, hotel);
        }

        // PUT: api/Hotels/5
        // This endpoint updates an existing hotel.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutHotel(int id, Hotel hotel)
        {
            // If the ID in the URL doesn't match the ID in the request body, return a 400 Bad Request.
            if (id != hotel.HotelId)
            {
                return BadRequest();
            }

            // Mark the entity as modified. EF Core will generate an UPDATE statement.
            _context.Entry(hotel).State = EntityState.Modified;

            try
            {
                // Try to save the changes to the database.
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // If the record was modified or deleted by another user, check if it still exists.
                if (!HotelExists(id))
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

        // DELETE: api/Hotels/5
        // This endpoint deletes a hotel.
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteHotel(int id)
        {
            var hotel = await _context.Hotels.FindAsync(id);
            if (hotel == null)
            {
                return NotFound();
            }

            _context.Hotels.Remove(hotel);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool HotelExists(int id)
        {
            return _context.Hotels.Any(e => e.HotelId == id);
        }
    }
}

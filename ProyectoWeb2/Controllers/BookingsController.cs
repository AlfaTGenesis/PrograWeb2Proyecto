using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Models;

namespace ProyectoWeb2.Controllers
{
    // [ApiController] attribute indicates that this controller responds to web API requests.
    [ApiController]
    // [Route] attribute defines the URL pattern for the actions in this controller.
    // "api/[controller]" means the URL will be "/api/Bookings".
    [Route("api/[controller]")]
    public class BookingsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        // The database context is injected into the controller via the constructor.
        // This is called Dependency Injection and is a best practice in ASP.NET Core.
        public BookingsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Bookings
        // This endpoint retrieves all bookings from the database.
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Booking>>> GetBookings()
        {
            // Asynchronously fetches the list of all bookings and returns them.
            return await _context.Bookings.ToListAsync();
        }

        // GET: api/Bookings/5
        // This endpoint retrieves a specific booking by its ID.
        [HttpGet("{id}")]
        public async Task<ActionResult<Booking>> GetBooking(int id)
        {
            // Asynchronously finds a booking by its primary key (Id).
            var booking = await _context.Bookings.FindAsync(id);

            // If the booking is not found, return a 404 Not Found response.
            if (booking == null)
            {
                return NotFound();
            }

            // If found, return the booking with a 200 OK response.
            return booking;
        }

        // POST: api/Bookings
        // This endpoint creates a new booking.
        [HttpPost]
        public async Task<ActionResult<Booking>> PostBooking(Booking booking)
        {
            // Adds the new booking entity to the context.
            _context.Bookings.Add(booking);
            // Asynchronously saves the changes to the database.
            await _context.SaveChangesAsync();

            // Returns a 201 Created response, including the newly created booking and a URL to access it.
            return CreatedAtAction(nameof(GetBooking), new { id = booking.BookingId }, booking);
        }

        // PUT: api/Bookings/5
        // This endpoint updates an existing booking.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBooking(int id, Booking booking)
        {
            // If the ID in the URL doesn't match the ID in the request body, return a 400 Bad Request.
            if (id != booking.BookingId)
            {
                return BadRequest();
            }

            // Mark the entity as modified. EF Core will generate an UPDATE statement.
            _context.Entry(booking).State = EntityState.Modified;

            try
            {
                // Try to save the changes to the database.
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // If the record was modified or deleted by another user, check if it still exists.
                if (!BookingExists(id))
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

        // DELETE: api/Bookings/5
        // This endpoint deletes a booking.
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBooking(int id)
        {
            var booking = await _context.Bookings.FindAsync(id);
            if (booking == null)
            {
                return NotFound();
            }

            _context.Bookings.Remove(booking);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BookingExists(int id)
        {
            return _context.Bookings.Any(e => e.BookingId == id);
        }
    }
}

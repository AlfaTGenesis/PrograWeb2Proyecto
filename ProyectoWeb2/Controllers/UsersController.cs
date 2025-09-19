using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Models;

namespace ProyectoWeb2.Controllers
{
    // [ApiController] attribute indicates that this controller responds to web API requests.
    [ApiController]
    // [Route] attribute defines the URL pattern for the actions in this controller.
    // "api/[controller]" means the URL will be "/api/Users".
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        // The database context is injected into the controller via the constructor.
        // This is called Dependency Injection and is a best practice in ASP.NET Core.
        public UsersController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Users
        // This endpoint retrieves all users from the database.
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            // Asynchronously fetches the list of all users and returns them.
            return await _context.Users.ToListAsync();
        }

        // GET: api/Users/5
        // This endpoint retrieves a specific user by its ID.
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            // Asynchronously finds a user by its primary key (Id).
            var user = await _context.Users.FindAsync(id);

            // If the user is not found, return a 404 Not Found response.
            if (user == null)
            {
                return NotFound();
            }

            // If found, return the user with a 200 OK response.
            return user;
        }

        // POST: api/Users
        // This endpoint creates a new user.
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            // Adds the new user entity to the context.
            _context.Users.Add(user);
            // Asynchronously saves the changes to the database.
            await _context.SaveChangesAsync();

            // Returns a 201 Created response, including the newly created user and a URL to access it.
            return CreatedAtAction(nameof(GetUser), new { id = user.UserId }, user);
        }

        // PUT: api/Users/5
        // This endpoint updates an existing user.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(int id, User user)
        {
            // If the ID in the URL doesn't match the ID in the request body, return a 400 Bad Request.
            if (id != user.UserId)
            {
                return BadRequest();
            }

            // Mark the entity as modified. EF Core will generate an UPDATE statement.
            _context.Entry(user).State = EntityState.Modified;

            try
            {
                // Try to save the changes to the database.
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // If the record was modified or deleted by another user, check if it still exists.
                if (!UserExists(id))
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

        // DELETE: api/Users/5
        // This endpoint deletes a user.
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool UserExists(int id)
        {
            return _context.Users.Any(e => e.UserId == id);
        }
    }
}

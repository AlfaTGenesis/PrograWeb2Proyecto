using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Models;

namespace ProyectoWeb2.Controllers
{
    // [ApiController] attribute indicates that this controller responds to web API requests.
    [ApiController]
    // [Route] attribute defines the URL pattern for the actions in this controller.
    // "api/[controller]" means the URL will be "/api/Reviews".
    [Route("api/[controller]")]
    public class ReviewsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        // The database context is injected into the controller via the constructor.
        // This is called Dependency Injection and is a best practice in ASP.NET Core.
        public ReviewsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Reviews
        // This endpoint retrieves all reviews from the database.
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Review>>> GetReviews()
        {
            // Asynchronously fetches the list of all reviews and returns them.
            return await _context.Reviews.ToListAsync();
        }

        // GET: api/Reviews/5
        // This endpoint retrieves a specific review by its ID.
        [HttpGet("{id}")]
        public async Task<ActionResult<Review>> GetReview(int id)
        {
            // Asynchronously finds a review by its primary key (Id).
            var review = await _context.Reviews.FindAsync(id);

            // If the review is not found, return a 404 Not Found response.
            if (review == null)
            {
                return NotFound();
            }

            // If found, return the review with a 200 OK response.
            return review;
        }

        // POST: api/Reviews
        // This endpoint creates a new review.
        [HttpPost]
        public async Task<ActionResult<Review>> PostReview(Review review)
        {
            // Adds the new review entity to the context.
            _context.Reviews.Add(review);
            // Asynchronously saves the changes to the database.
            await _context.SaveChangesAsync();

            // Returns a 201 Created response, including the newly created review and a URL to access it.
            return CreatedAtAction(nameof(GetReview), new { id = review.ReviewId }, review);
        }

        // PUT: api/Reviews/5
        // This endpoint updates an existing review.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutReview(int id, Review review)
        {
            // If the ID in the URL doesn't match the ID in the request body, return a 400 Bad Request.
            if (id != review.ReviewId)
            {
                return BadRequest();
            }

            // Mark the entity as modified. EF Core will generate an UPDATE statement.
            _context.Entry(review).State = EntityState.Modified;

            try
            {
                // Try to save the changes to the database.
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // If the record was modified or deleted by another user, check if it still exists.
                if (!ReviewExists(id))
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

        // DELETE: api/Reviews/5
        // This endpoint deletes a review.
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteReview(int id)
        {
            var review = await _context.Reviews.FindAsync(id);
            if (review == null)
            {
                return NotFound();
            }

            _context.Reviews.Remove(review);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ReviewExists(int id)
        {
            return _context.Reviews.Any(e => e.ReviewId == id);
        }
    }
}

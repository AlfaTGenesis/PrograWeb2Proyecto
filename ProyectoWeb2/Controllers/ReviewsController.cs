using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Dtos;
using ProyectoWeb2.Models;
using System.Security.Claims;

namespace ProyectoWeb2.Controllers
{
    [ApiController]
    // api/Reviews
    [Route("api/[controller]")]
    [Authorize]
    public class ReviewsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ReviewsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Review>>> GetReviews()
        {
            return await _context.Reviews.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Review>> GetReview(int id)
        {
            var review = await _context.Reviews.FindAsync(id);

            if (review == null)
            {
                return NotFound();
            }

            return review;
        }

        [HttpPost]
        [Authorize] 
        public async Task<IActionResult> PostReview([FromBody] CreateReviewDto createReviewDto)
        {

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var userName = User.FindFirstValue(ClaimTypes.Name) ?? "Anónimo";

            if (userId == null)
            {
                return Unauthorized(new { message = "Usuario no autorizado." });
            }

            var newReview = new Review
            {
                HotelId = createReviewDto.HotelId,
                UserId = int.Parse(userId),
                Comment = createReviewDto.Comment,
                Rating = createReviewDto.Rating,
                DatePosted = DateTime.UtcNow 
            };

            try
            {
                
                _context.Reviews.Add(newReview);
                await _context.SaveChangesAsync();

                var reviewDto = new ReviewDto
                {
                    ReviewId = newReview.ReviewId,
                    UserName = userName, 
                    Comment = newReview.Comment,
                    Rating = newReview.Rating,
                    DatePosted = newReview.DatePosted
                };

                return Ok(reviewDto);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al guardar la reseña: {ex.Message}");
                return StatusCode(500, new { message = "Error interno al guardar la reseña. Inténtelo de nuevo." });
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutReview(int id, Review review)
        {
            if (id != review.ReviewId)
            {
                return BadRequest();
            }

            _context.Entry(review).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ReviewExists(id))
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

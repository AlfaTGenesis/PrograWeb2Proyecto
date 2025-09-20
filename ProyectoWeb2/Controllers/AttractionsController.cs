using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Models;

namespace ProyectoWeb2.Controllers
{
    [ApiController]
    // api/Attractions
    [Route("api/[controller]")]
    [Authorize]
    public class AttractionsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public AttractionsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<TouristAttraction>>> GetAttractions()
        {
            return await _context.TouristAttractions.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<TouristAttraction>> GetAttraction(int id)
        {
            var attraction = await _context.TouristAttractions.FindAsync(id);

            if (attraction == null)
            {
                return NotFound();
            }

            return attraction;
        }

        [HttpPost]
        public async Task<ActionResult<TouristAttraction>> PostAttraction(TouristAttraction attraction)
        {
            _context.TouristAttractions.Add(attraction);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetAttraction), new { id = attraction.AttractionId }, attraction);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutAttraction(int id, TouristAttraction attraction)
        {
            if (id != attraction.AttractionId)
            {
                return BadRequest();
            }

            _context.Entry(attraction).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AttractionExists(id))
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

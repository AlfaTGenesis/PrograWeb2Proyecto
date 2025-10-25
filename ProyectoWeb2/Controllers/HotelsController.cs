using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Dtos;
using ProyectoWeb2.Models;

namespace ProyectoWeb2.Controllers
{
    [ApiController]
    // api/Hotels
    [Route("api/[controller]")]
    [Authorize]
    public class HotelsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public HotelsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetHotels()
        {
            return await _context.Hotels.ToListAsync();
        }

        [AllowAnonymous] 
        [HttpGet("{id}")]
        public async Task<ActionResult<HotelDetailDto>> GetHotel(int id)
        {
            try
            {
                var hotel = await _context.Hotels
                    .Include(h => h.Stadium) 
                    .Include(h => h.Reviews) 
                        .ThenInclude(r => r.User) 
                    .AsNoTracking()
                    .FirstOrDefaultAsync(h => h.HotelId == id);

                if (hotel == null)
                {
                    return NotFound(new { message = $"No se encontró el hotel con ID {id}" });
                }


                var hotelDetailDto = new HotelDetailDto
                {
                    HotelId = hotel.HotelId,
                    Name = hotel.Name,
                    Address = hotel.Address,
                    Stars = hotel.Stars,
                    Description = hotel.Description,
                    ImageUrl = hotel.ImageUrl,
                    StadiumName = hotel.Stadium?.Name, 

                    Reviews = hotel.Reviews.Select(r => new ReviewDto
                    {
                        ReviewId = r.ReviewId,
                        Rating = r.Rating,
                        Comment = r.Comment,
                        DatePosted = r.DatePosted,
                        UserName = r.User?.Name 
                    }).OrderByDescending(r => r.DatePosted).ToList() 
                };

                return Ok(hotelDetailDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Error interno del servidor al obtener detalles del hotel." });
            }
        }

        [HttpPost]
        public async Task<ActionResult<Hotel>> PostHotel(Hotel hotel)
        {
            _context.Hotels.Add(hotel);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetHotel), new { id = hotel.HotelId }, hotel);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutHotel(int id, Hotel hotel)
        {
            if (id != hotel.HotelId)
            {
                return BadRequest();
            }

            _context.Entry(hotel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HotelExists(id))
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

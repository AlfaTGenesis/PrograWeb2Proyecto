using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Dtos;
using ProyectoWeb2.Models;
using System.Diagnostics;

namespace ProyectoWeb2.Controllers
{
    [ApiController]

    // api/Stadiums
    [Route("api/[controller]")]
    [Authorize]
    public class StadiumsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public StadiumsController(ApplicationDbContext context)
        {
            _context = context;

        }

        [HttpGet]
        [AllowAnonymous] 
        public async Task<ActionResult<IEnumerable<StadiumDto>>> GetStadiums()
        {
            var stadiums = await _context.Stadiums
                .Select(s => new StadiumDto
                {
                    StadiumId = s.StadiumId,
                    Name = s.Name,
                    City = s.City,
                    ImageUrl = s.ImageUrl
                })
                .ToListAsync();

            return Ok(stadiums);
        }

        [AllowAnonymous] 
        [HttpGet("{id}")]
        public async Task<ActionResult<StadiumDetailDto>> GetStadium(int id)
        {
            try
            {

                var stadium = await _context.Stadiums
                  .Include(s => s.Hotels) 
                  .Include(s => s.TouristAttractions) 
                  .AsNoTracking() 
                  .FirstOrDefaultAsync(s => s.StadiumId == id); 

                if (stadium == null)
                {
                   // _logger.LogWarning($"No se encontró el estadio con ID: {id}");
                    return NotFound(new { message = $"No se encontró el estadio con ID {id}" });
                }

                var stadiumDetailDto = new StadiumDetailDto
                {
                    StadiumId = stadium.StadiumId,
                    Name = stadium.Name,
                    City = stadium.City,
                    Capacity = stadium.Capacity,
                    ImageUrl = stadium.ImageUrl,
                    Hotels = stadium.Hotels.Select(h => new HotelDto
                    {
                        HotelId = h.HotelId,
                        Name = h.Name,
                        Address = h.Address,
                        Stars = h.Stars,
                        ImageUrl = h.ImageUrl
                    }).ToList(),
                    TouristAttractions = stadium.TouristAttractions.Select(ta => new TouristAttractionDto
                    {
                        TouristAttractionId = ta.AttractionId,
                        Name = ta.Name,
                        Type = ta.Type,
                        ImageUrl = ta.ImageUrl
                    }).ToList()
                };

                return Ok(stadiumDetailDto);
            }
            catch (Exception ex)
            {
                //_logger.LogError(ex, $"Error al obtener detalles del estadio con ID: {id}");
                return StatusCode(500, new { message = "Error interno del servidor al obtener detalles del estadio." });
            }
        }

        [HttpPost]
        public async Task<ActionResult<Stadium>> PostStadium(Stadium stadium)
        {
            _context.Stadiums.Add(stadium);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetStadium), new { id = stadium.StadiumId }, stadium);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutStadium(int id, Stadium stadium)
        {
            if (id != stadium.StadiumId)
            {
                return BadRequest();
            }

            _context.Entry(stadium).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StadiumExists(id))
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

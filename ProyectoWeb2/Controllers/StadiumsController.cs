using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Dtos;
using ProyectoWeb2.Models;

namespace ProyectoWeb2.Controllers
{
    [ApiController]

    // api/Stadiums
    [Route("api/[controller]")]
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

        [HttpGet("{id}")]
        [AllowAnonymous] // También la hacemos pública para la página de detalle
        public async Task<ActionResult<StadiumDetailDto>> GetStadium(int id)
        {
            var stadium = await _context.Stadiums
                // Incluimos las colecciones relacionadas de Hoteles y Atracciones
                .Include(s => s.Hotels)
                .Include(s => s.TouristAttractions)
                // Buscamos el estadio por ID
                .Where(s => s.StadiumId == id)
                // Proyectamos el resultado al DTO de detalle
                .Select(s => new StadiumDetailDto
                {
                    StadiumId = s.StadiumId,
                    Name = s.Name,
                    City = s.City,
                    Capacity = s.Capacity,
                    ImageUrl = s.ImageUrl,

                    // Mapeamos la lista de Hoteles a HotelDto
                    Hotels = s.Hotels.Select(h => new HotelDto
                    {
                        HotelId = h.HotelId,
                        Name = h.Name,
                        Stars = h.Stars,
                        ImageUrl = h.ImageUrl
                    }).ToList(),

                    // Mapeamos la lista de Atracciones a TouristAttractionDto
                    TouristAttractions = s.TouristAttractions.Select(ta => new TouristAttractionDto
                    {
                        TouristAttractionId = ta.AttractionId,
                        Name = ta.Name,
                        Description = ta.Description,
                        Type = ta.Type,
                        ImageUrl = ta.ImageUrl
                    }).ToList()
                })
                // Obtenemos el primer resultado o null
                .FirstOrDefaultAsync();

            if (stadium == null)
            {
                return NotFound(new { message = "Estadio no encontrado." });
            }

            return Ok(stadium);
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

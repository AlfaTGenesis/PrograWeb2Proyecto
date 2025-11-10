using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProyectoWeb2.Dtos;
using ProyectoWeb2.Models;
using System.Security.Claims;

namespace ProyectoWeb2.Controllers
{
    [ApiController]
    // api/Bookings
    [Route("api/[controller]")]
    [Authorize]
    public class BookingsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;


        public BookingsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]

        [HttpGet]
        public async Task<IActionResult> GetUserBookings()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            Console.WriteLine($"Obteniendo reservas para el usuario ID: {userId}");
            if (userId == null)
            {
                return Unauthorized(new { message = "Usuario no autorizado." });
            }

            try
            {
                var bookings = await _context.Bookings
                    .Where(b => b.UserId == int.Parse(userId))
                    .Include(b => b.Hotel) // Incluir la información del hotel
                    .Select(b => new BookingDto
                    {
                        BookingId = b.BookingId,
                        HotelId = b.HotelId,
                        HotelName = b.Hotel != null ? b.Hotel.Name : "Hotel no disponible",
                        HotelImageUrl = b.Hotel != null ? b.Hotel.ImageUrl ?? "" : "",
                        HotelAddress = b.Hotel != null ? b.Hotel.Address : "",
                        CheckInDate = b.CheckInDate,
                        CheckOutDate = b.CheckOutDate,
                        NumberOfGuests = b.NumberOfGuests,
                        CreatedAt = b.CreatedAt
                    })
                    .ToListAsync();

                return Ok(bookings);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al obtener reservas: {ex.Message}");
                return StatusCode(500, new { message = "Error interno al obtener las reservas." });
            }
        }

        // --- INICIO DE LA ACTUALIZACIÓN ---

        // POST: api/Bookings
        // Crea una nueva reserva para el usuario autenticado
        [HttpPost]
        public async Task<IActionResult> CreateBooking([FromBody] CreateBookingDto createBookingDto)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            Console.WriteLine($"Creando reserva para el usuario ID: {userId}");

            if (userId == null)
            {
                return Unauthorized(new { message = "Usuario no autorizado." });
            }

            if (createBookingDto.CheckOutDate <= createBookingDto.CheckInDate)
            {
                return BadRequest(new { message = "La fecha de salida debe ser posterior a la fecha de entrada." });
            }

            if (createBookingDto.CheckInDate < DateTime.Today)
            {
                return BadRequest(new { message = "La fecha de entrada no puede ser en el pasado." });
            }

            try
            {
                var newBooking = new Booking
                {
                    UserId = int.Parse(userId),
                    HotelId = createBookingDto.HotelId,
                    CheckInDate = createBookingDto.CheckInDate,
                    CheckOutDate = createBookingDto.CheckOutDate,
                    NumberOfGuests = createBookingDto.NumberOfGuests,
                    CreatedAt = DateTime.UtcNow // Usar UTC para la hora del servidor
                };

                _context.Bookings.Add(newBooking);
                Console.WriteLine("Antes de SaveChangesAsync");
                var result = await _context.SaveChangesAsync();
                Console.WriteLine($"Filas afectadas: {result}");
                Console.WriteLine("Después de SaveChangesAsync");


                // Opcional: Devolver la reserva recién creada (usando el BookingDto)
                var hotel = await _context.Hotels.FindAsync(newBooking.HotelId);
                var bookingDto = new BookingDto
                {
                    BookingId = newBooking.BookingId,
                    HotelId = newBooking.HotelId,
                    HotelName = hotel?.Name ?? "N/A",
                    HotelImageUrl = hotel?.ImageUrl ?? "",
                    HotelAddress = hotel?.Address ?? "",
                    CheckInDate = newBooking.CheckInDate,
                    CheckOutDate = newBooking.CheckOutDate,
                    NumberOfGuests = newBooking.NumberOfGuests,
                    CreatedAt = newBooking.CreatedAt
                };

                // Devolver un 201 Created con la nueva reserva y la URL para verla
                return CreatedAtAction(nameof(GetUserBookings), new { id = newBooking.BookingId }, bookingDto);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al crear reserva: {ex.Message}  user: {userId}");
                return StatusCode(500, new { message = "Error interno al crear la reserva." });
            }
        }
        //public async Task<ActionResult<IEnumerable<Booking>>> GetBookings()
        //{
        //    return await _context.Bookings.ToListAsync();
        ////}
        //[HttpGet]
        //public async Task<IActionResult> GetUserBookings2()
        //{
        //    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        //    if (userId == null)
        //    {
        //        return Unauthorized(new { message = "Usuario no autorizado." });
        //    }

        //    try
        //    {
        //        var bookings = await _context.Bookings
        //            .Where(b => b.UserId == int.Parse(userId))
        //            .Include(b => b.Hotel) // Incluir la información del hotel
        //            .Select(b => new BookingDto
        //            {
        //                BookingId = b.BookingId,
        //                HotelId = b.HotelId,
        //                HotelName = b.Hotel != null ? b.Hotel.Name : "Hotel no disponible",
        //                HotelImageUrl = b.Hotel != null ? b.Hotel.ImageUrl ?? "" : "",
        //                HotelAddress = b.Hotel != null ? b.Hotel.Address : "",
        //                CheckInDate = b.CheckInDate,
        //                CheckOutDate = b.CheckOutDate,
        //                NumberOfGuests = b.NumberOfGuests,
        //                CreatedAt = b.CreatedAt
        //            })
        //            .ToListAsync();

        //        return Ok(bookings);
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine($"Error al obtener reservas: {ex.Message}");
        //        return StatusCode(500, new { message = "Error interno al obtener las reservas." });
        //    }
        //}
        [HttpGet("{id}")]
        public async Task<ActionResult<Booking>> GetBooking(int id)
        {
            var booking = await _context.Bookings.FindAsync(id);

            if (booking == null)
            {
                return NotFound();
            }

            return booking;
        }


        [HttpPut("{id}")]
        public async Task<IActionResult> PutBooking(int id, Booking booking)
        {
            if (id != booking.BookingId)
            {
                return BadRequest();
            }

            _context.Entry(booking).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookingExists(id))
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

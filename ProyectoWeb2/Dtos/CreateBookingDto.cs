using System.ComponentModel.DataAnnotations;

namespace ProyectoWeb2.Dtos
{
    public class CreateBookingDto
    {
        [Required]
        public int HotelId { get; set; }

        [Required]
        public DateTime CheckInDate { get; set; }

        [Required]
        public DateTime CheckOutDate { get; set; }

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "Debe haber al menos 1 huésped.")]
        public int NumberOfGuests { get; set; }
    }
}

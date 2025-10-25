namespace ProyectoWeb2.Dtos
{
    public class BookingDto
    {
        public int BookingId { get; set; }
        public int HotelId { get; set; }
        public string HotelName { get; set; } = string.Empty;
        public string HotelImageUrl { get; set; } = string.Empty;
        public string HotelAddress { get; set; } = string.Empty;
        public DateTime CheckInDate { get; set; }
        public DateTime CheckOutDate { get; set; }
        public int NumberOfGuests { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}

namespace ProyectoWeb2.Dtos
{
    // DTO para la vista de "detalle" de un estadio.
    public class StadiumDetailDto
    {
        public int StadiumId { get; set; }
        public string Name { get; set; }
        public string City { get; set; }
        public int Capacity { get; set; }
        public string? ImageUrl { get; set; }

        public List<HotelDto> Hotels { get; set; } = new List<HotelDto>();
        public List<TouristAttractionDto> TouristAttractions { get; set; } = new List<TouristAttractionDto>();
    }
}

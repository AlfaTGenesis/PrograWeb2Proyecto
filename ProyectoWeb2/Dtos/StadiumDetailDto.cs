namespace ProyectoWeb2.Dtos
{
    // DTO para la vista de "detalle" de un estadio.
    // Incluye el estadio y sus listas de hoteles y atracciones.
    public class StadiumDetailDto
    {
        public int StadiumId { get; set; }
        public string Name { get; set; }
        public string City { get; set; }
        public int Capacity { get; set; }
        public string? ImageUrl { get; set; }

        // Listas de DTOs anidados
        public List<HotelDto> Hotels { get; set; } = new List<HotelDto>();
        public List<TouristAttractionDto> TouristAttractions { get; set; } = new List<TouristAttractionDto>();
    }
}

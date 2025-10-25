namespace ProyectoWeb2.Dtos
{
    // DTO para representar una atracción turística en una respuesta de API.
    public class TouristAttractionDto
    {
        public int TouristAttractionId { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public string? Type { get; set; }
        public string? ImageUrl { get; set; }
    }
}

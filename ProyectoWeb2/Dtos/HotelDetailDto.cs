namespace ProyectoWeb2.Dtos
{
    public class HotelDetailDto
    {
        public int HotelId { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public double Stars { get; set; }
        public string? Description { get; set; }
        public string? ImageUrl { get; set; }
        public string? StadiumName { get; set; } 

        public List<ReviewDto> Reviews { get; set; } = new List<ReviewDto>();
    }
}

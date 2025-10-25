namespace ProyectoWeb2.Dtos
{
    public class ReviewDto
    {
        public int ReviewId { get; set; }
        public int Rating { get; set; }
        public string? Comment { get; set; }
        public DateTime DatePosted { get; set; }
        public string? UserName { get; set; } 
    }
}


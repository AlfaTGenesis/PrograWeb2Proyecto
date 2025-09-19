using System.ComponentModel.DataAnnotations;

namespace ProyectoWeb2.Models
{
    public class TouristAttraction
    {
        [Key]
        public int AttractionId { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        [StringLength(100)]
        public string City { get; set; }

        public string? ImageUrl { get; set; }
    }
}

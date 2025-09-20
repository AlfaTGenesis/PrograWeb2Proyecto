using System.ComponentModel.DataAnnotations;

namespace ProyectoWeb2.Models
{
    public class Stadium
    {
        [Key]
        public int StadiumId { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        [StringLength(100)]
        public string City { get; set; }

        [Required]
        public int Capacity { get; set; }

        public string? ImageUrl { get; set; }

        public virtual ICollection<Hotel> Hotels { get; set; } = new List<Hotel>();
    }
}

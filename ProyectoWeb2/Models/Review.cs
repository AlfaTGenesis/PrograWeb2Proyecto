using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProyectoWeb2.Models
{
    public class Review
    {
        [Key]
        public int ReviewId { get; set; }

        // Foreign Key to User
        public int UserId { get; set; }

        // Foreign Key to Hotel
        public int HotelId { get; set; }

        [Required]
        [Range(1, 5)]
        public int Rating { get; set; } // Rating from 1 to 5

        public string? Comment { get; set; }

        public DateTime DatePosted { get; set; } = DateTime.UtcNow;

        [ForeignKey("UserId")]
        public virtual User? User { get; set; }

        [ForeignKey("HotelId")]
        public virtual Hotel? Hotel { get; set; }
    }
}

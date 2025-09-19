using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ProyectoWeb2.Models
{
    public class Hotel
    {
        [Key]
        public int HotelId { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        [StringLength(200)]
        public string Address { get; set; }

        public int Stars { get; set; } // Rating from 1 to 5

        public string? Description { get; set; }

        public string? ImageUrl { get; set; }

        // Foreign Key to Stadium
        public int StadiumId { get; set; }

        [ForeignKey("StadiumId")]
        public virtual Stadium? Stadium { get; set; }
    }
}

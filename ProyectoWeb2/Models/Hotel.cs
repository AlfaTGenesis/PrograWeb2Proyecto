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

        [Range(0, 5)]
        public double Stars { get; set; } 

        public string? Description { get; set; }

        public string? ImageUrl { get; set; }

        public int StadiumId { get; set; }

        [ForeignKey("StadiumId")]
        public virtual Stadium? Stadium { get; set; }


        public virtual ICollection<Review> Reviews { get; set; } = new List<Review>();
    }
}

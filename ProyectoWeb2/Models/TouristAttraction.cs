using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

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
        [StringLength(50)]
        
        public string? Type { get; set; }

        public string? ImageUrl { get; set; }

        public int StadiumId { get; set; }
        [ForeignKey("StadiumId")]
        public virtual Stadium? Stadium { get; set; }

    }
}

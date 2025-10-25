using System.ComponentModel.DataAnnotations;

namespace ProyectoWeb2.Dtos
{
    public class CreateReviewDto
    {
        [Required]
        public int HotelId { get; set; }

        [Required]
        [Range(1, 5, ErrorMessage = "La calificación debe estar entre 1 y 5.")]
        public int Rating { get; set; }

        [MaxLength(1000, ErrorMessage = "El comentario no puede exceder los 1000 caracteres.")]
        public string? Comment { get; set; }
    }
}

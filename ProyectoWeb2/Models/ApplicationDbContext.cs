using Microsoft.EntityFrameworkCore;
namespace ProyectoWeb2.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Stadium> Stadiums { get; set; }
        public DbSet<Hotel> Hotels { get; set; }
        public DbSet<TouristAttraction> TouristAttractions { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Booking> Bookings { get; set; }
        public DbSet<Review> Reviews { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);


            modelBuilder.Entity<Stadium>()
                .HasMany(s => s.Hotels)
                .WithOne(h => h.Stadium)
                .HasForeignKey(h => h.StadiumId);

            modelBuilder.Entity<Stadium>()
                .HasMany(s => s.TouristAttractions)
                .WithOne(h => h.Stadium)
                .HasForeignKey(h => h.StadiumId);
        }
    }
}

using GoAnime.Domain.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace GoAnime.Infrastructure
{
    public class AnimeDbContext : IdentityDbContext<AnimeFan>
    {
        public AnimeDbContext(DbContextOptions<AnimeDbContext> options) : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<VoiceActor_Anime>().HasKey(v => new
            {
                v.VoiceActorId,
                v.AnimeId
            });
            modelBuilder.Entity<VoiceActor_Anime>().HasOne(a => a.Anime)
                .WithMany(v => v.VoiceActors_Anime).HasForeignKey(a => a.AnimeId);
            modelBuilder.Entity<VoiceActor_Anime>().HasOne(a => a.VoiceActor)
                .WithMany(v => v.VoiceActors_Anime).HasForeignKey(a => a.VoiceActorId);

            base.OnModelCreating(modelBuilder);
        }
        public DbSet<Anime> Anime { get; set; }
        public DbSet<VoiceActor> VoiceActors { get; set; }
        public DbSet<VoiceActor_Anime> VoiceActors_Anime { get; set; }
        public DbSet<Studio> Studios { get; set; }
        public DbSet<Producer> Producers { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<CartItem> CartItems { get; set; }

    }
}

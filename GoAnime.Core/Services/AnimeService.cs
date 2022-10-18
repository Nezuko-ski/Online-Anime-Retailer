using GoAnime.Core.Interfaces;
using GoAnime.Core.ViewModels;
using GoAnime.Domain.Models;
using GoAnime.Infrastructure;
using GoAnime.Infrastructure.Repository;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace GoAnime.Core.Services
{
    public class AnimeService : EntityBaseRepository<Anime>, IAnimeService
    {
        private readonly AnimeDbContext _context;
        public AnimeService(AnimeDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task AddNewAnimeAsync(NewAnimeVM newAnime)
        {
            var anime = new Anime()
            {
                Name = newAnime.Name,
                Description = newAnime.Description,
                Price = newAnime.Price,
                StudioId = newAnime.StudioId,
                ProducerId = newAnime.ProducerId,
                ImageURL = newAnime.ImageURL,
                StartDate = newAnime.StartDate,
                EndDate = newAnime.EndDate,
                AnimeGenre = newAnime.AnimeGenre
            };
            await _context.AddAsync(anime);
            await _context.SaveChangesAsync();

            //Add voice actors
            foreach (var voiceActorId in newAnime.VoiceActorIds)
            {
                var voiceActor = new VoiceActor_Anime()
                {
                    AnimeId = anime.Id,
                    VoiceActorId = voiceActorId
                };
                await _context.AddAsync(voiceActor);
            }
            await _context.SaveChangesAsync();
        }

        public async Task<Anime> GetAnimeByIdAsync(int id)
        {
            return await _context.Anime.Include(v => v.Studio)
                .Include(v => v.Producer).Include(q => q.VoiceActors_Anime)
                .ThenInclude(v => v.VoiceActor).FirstOrDefaultAsync(v => v.Id == id);
        }

        public async Task<NewAnimeDropdownVM> GetNewAnimeDropdownValuesAsync()
        {
            var response = new NewAnimeDropdownVM
            {
                Studios = await _context.Studios.OrderBy(v => v.Name).ToListAsync(),
                Producers = await _context.Producers.OrderBy(v => v.FullName).ToListAsync(),
                VoiceActors = await _context.VoiceActors.OrderBy(v => v.FullName).ToListAsync()
            };
            return response;
        }

        public async Task UpdateAnimeAsync(NewAnimeVM newAnime)
        {
            var dbAnime = await _context.Anime.FirstOrDefaultAsync(v => v.Id == newAnime.Id);
            if(dbAnime != null)
            {
                dbAnime.Name = newAnime.Name;
                dbAnime.Description = newAnime.Description;
                dbAnime.Price = newAnime.Price;
                dbAnime.StudioId = newAnime.StudioId;
                dbAnime.ProducerId = newAnime.ProducerId;
                dbAnime.ImageURL = newAnime.ImageURL;
                dbAnime.StartDate = newAnime.StartDate;
                dbAnime.EndDate = newAnime.EndDate;
                dbAnime.AnimeGenre = newAnime.AnimeGenre;
                await _context.SaveChangesAsync();
            }
            var existingVoiceActors = await _context.VoiceActors_Anime.Where(v => v.AnimeId == newAnime.Id).ToListAsync();
            _context.VoiceActors_Anime.RemoveRange(existingVoiceActors);
            await _context.SaveChangesAsync();

            //Add voice actors
            foreach (var voiceActorId in newAnime.VoiceActorIds)
            {
                var voiceActor = new VoiceActor_Anime()
                {
                    AnimeId = newAnime.Id,
                    VoiceActorId = voiceActorId
                };
                await _context.AddAsync(voiceActor);
            }
            await _context.SaveChangesAsync();
        }
    }
}

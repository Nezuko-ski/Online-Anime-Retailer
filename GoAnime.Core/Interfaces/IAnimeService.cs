using GoAnime.Core.ViewModels;
using GoAnime.Domain.Models;
using GoAnime.Infrastructure.IRepository;
using System.Threading.Tasks;

namespace GoAnime.Core.Interfaces
{
    public interface IAnimeService : IEntityBaseRepository<Anime>
    {
        Task<Anime> GetAnimeByIdAsync(int id);
        Task<NewAnimeDropdownVM> GetNewAnimeDropdownValuesAsync();
        Task AddNewAnimeAsync(NewAnimeVM newAnime);
        Task UpdateAnimeAsync(NewAnimeVM newAnime);

    }
}

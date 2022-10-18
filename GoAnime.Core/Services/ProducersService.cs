using GoAnime.Core.Interfaces;
using GoAnime.Domain.Models;
using GoAnime.Infrastructure;
using GoAnime.Infrastructure.Repository;

namespace GoAnime.Core.Services
{
    public class ProducersService : EntityBaseRepository<Producer>, IProducersService
    {
        public ProducersService(AnimeDbContext context) : base(context)
        {
        }
    }
    
}

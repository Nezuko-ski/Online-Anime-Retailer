using GoAnime.Domain.Models;
using GoAnime.Infrastructure.IRepository;

namespace GoAnime.Core.Interfaces
{
    public interface IVoiceActorsService : IEntityBaseRepository<VoiceActor>
    {
    }
}
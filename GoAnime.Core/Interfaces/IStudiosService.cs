using GoAnime.Domain.Models;
using GoAnime.Infrastructure.IRepository;
using System;
using System.Collections.Generic;
using System.Text;

namespace GoAnime.Core.Interfaces
{
    public interface IStudiosService : IEntityBaseRepository<Studio>
    {
    }
}
    

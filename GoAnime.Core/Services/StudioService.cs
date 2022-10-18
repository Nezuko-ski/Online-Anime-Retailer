using GoAnime.Core.Interfaces;
using GoAnime.Domain.Models;
using GoAnime.Infrastructure;
using GoAnime.Infrastructure.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace GoAnime.Core.Services
{
    public class StudioService : EntityBaseRepository<Studio>, IStudiosService
    {
        public StudioService(AnimeDbContext context) : base(context)
        {
        }
        
    }
   
}

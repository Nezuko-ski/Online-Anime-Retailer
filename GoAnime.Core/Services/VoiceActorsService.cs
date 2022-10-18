using GoAnime.Core.Interfaces;
using GoAnime.Domain.Models;
using GoAnime.Infrastructure;
using GoAnime.Infrastructure.Repository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GoAnime.Core.Services
{
    public class VoiceActorsService : EntityBaseRepository<VoiceActor>, IVoiceActorsService
    {
        public VoiceActorsService(AnimeDbContext context) : base(context)
        {         
        }       
    }
}

using System;
using System.Collections.Generic;
using System.Text;

namespace GoAnime.Domain.Models
{
    public class VoiceActor_Anime
    {
        public int AnimeId { get; set; }
        public Anime Anime { get; set; }
        public int VoiceActorId { get; set; }
        public VoiceActor VoiceActor { get; set; }
    }
}

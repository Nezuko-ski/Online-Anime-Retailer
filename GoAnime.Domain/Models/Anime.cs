using GoAnime.Domain.Enums;
using GoAnime.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace GoAnime.Domain.Models
{
    public class Anime : IEntityBase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public string ImageURL { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public AnimeGenre AnimeGenre { get; set; }
        //Relationship
        public List<VoiceActor_Anime> VoiceActors_Anime { get; set; }
        public int StudioId { get; set; }
        public Studio Studio { get; set; }
        public int ProducerId { get; set; }
        public Producer Producer { get; set; }

    }
}

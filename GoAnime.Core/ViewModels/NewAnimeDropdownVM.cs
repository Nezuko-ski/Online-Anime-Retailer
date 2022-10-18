using GoAnime.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace GoAnime.Core.ViewModels
{
    public class NewAnimeDropdownVM
    {
        public NewAnimeDropdownVM()
        {
            Producers = new List<Producer>();
            Studios = new List<Studio>();
            VoiceActors = new List<VoiceActor>();
        }
        public List<Producer> Producers { get; set; }
        public List<Studio> Studios { get; set; }
        public List<VoiceActor> VoiceActors { get; set; }
    }
}

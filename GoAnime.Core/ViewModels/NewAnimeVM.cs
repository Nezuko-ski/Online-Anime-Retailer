using GoAnime.Domain.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace GoAnime.Core.ViewModels
{
    public class NewAnimeVM
    {
        public int Id { get; set; }
        [Display(Name = "Anime Name")]
        [Required(ErrorMessage = "Name is required!")]
        public string Name { get; set; }
        [Display(Name = "Anime Description")]
        [Required(ErrorMessage = "Description is required!")]
        public string Description { get; set; }
        [Display(Name = "Price in $")]
        [Required(ErrorMessage = "Price is required!")]
        public double Price { get; set; }
        [Display(Name = "Anime Poster URL")]
        [Required(ErrorMessage = "Anime Poster URL IS required!")]
        public string ImageURL { get; set; }
        [Display(Name = "Start date")]
        [Required(ErrorMessage = "Start date is required!")]
        public DateTime StartDate { get; set; }
        [Display(Name = "End date")]
        [Required(ErrorMessage = "End date is required!")]
        public DateTime EndDate { get; set; }
        [Display(Name = "Select a genre")]
        [Required(ErrorMessage = "Anime genre is required!")]
        public AnimeGenre AnimeGenre { get; set; }
        //Relationship
        [Display(Name = "Select voice actor(s)")]
        [Required(ErrorMessage = "Voice actor(s) is required!")]
        public List<int> VoiceActorIds { get; set; }
        [Display(Name = "Select studio(s)")]
        [Required(ErrorMessage = "Studio(s) is required!")]
        public int StudioId { get; set; }
        [Display(Name = "Select producer(s)")]
        [Required(ErrorMessage = "Producer(s) is required!")]
        public int ProducerId { get; set; }

    }
}

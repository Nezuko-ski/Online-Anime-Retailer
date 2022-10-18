using GoAnime.Domain.Interfaces;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace GoAnime.Domain.Models
{
    public class Producer : IEntityBase
    {
        [Key]
        public int Id { get; set; }
        [Display(Name = "Profile Picture")]
        public string ProfilePictureURL { get; set; }
        [Display(Name = "Name")]
        public string FullName { get; set; }
        [Display(Name = "About")]
        public string Bio { get; set; }
        //Relationships
        public List<Anime> Anime { get; set; }
    }
}

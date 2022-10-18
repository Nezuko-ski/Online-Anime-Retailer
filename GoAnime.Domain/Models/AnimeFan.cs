using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace GoAnime.Domain.Models
{
    public class AnimeFan : IdentityUser
    {
        [Display(Name ="Full Name")]
        public string FullName { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;

namespace GoAnime.Domain.Models
{
    public class CartItem
    {
        [Key]
        public int Id { get; set; }
        public Anime Anime { get; set; }
        public int Quantity { get; set; }
        public string CartId { get; set; }
    }
}

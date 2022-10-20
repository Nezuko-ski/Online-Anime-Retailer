using GoAnime.Domain.Models;
using GoAnime.Infrastructure;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GoAnime.Core.CartFunctionality
{
    public class Cart
    {
        public AnimeDbContext _context { get; set; }
        public string CartId { get; set; }
        public List<CartItem> CartItems { get; set; }
        public Cart(AnimeDbContext context)
        {
            _context = context;
        }

        public static Cart GetCart(IServiceProvider provider)
        {
            ISession session = provider.GetRequiredService<IHttpContextAccessor>()?.HttpContext.Session;
            string cartId = session.GetString("CartId") ?? Guid.NewGuid().ToString();
            session.SetString("CartId", cartId);
            return new Cart(provider.GetService<AnimeDbContext>()) { CartId = cartId };
        }
        public void AddItemToCart(Anime anime)
        {
            var cartItem = _context.CartItems.FirstOrDefault(v => v.CartId == CartId
                && v.Anime.Id == anime.Id);
            if (cartItem == null)
            {
                cartItem = new CartItem
                {
                    CartId = CartId,
                    Anime = anime,
                    Quantity = 1,
                };
                _context.CartItems.Add(cartItem);
            }
            else
            {
                cartItem.Quantity++;
            }
            _context.SaveChanges();
        }

        public void RemoveItemFromCart(Anime anime)
        {
            var cartItem = _context.CartItems.FirstOrDefault(v => v.CartId == CartId
                && v.Anime.Id == anime.Id);
            if (cartItem != null)
            {
                if (cartItem.Quantity > 1)
                {
                    cartItem.Quantity--;
                }
                else
                {
                    _context.CartItems.Remove(cartItem);
                }
            }
            _context.SaveChanges();
        }

        public List<CartItem> GetCartItems() => CartItems ?? _context.CartItems.Where(v => v
        .CartId == CartId).Include(v => v.Anime).ToList();

        public double CartTotal() => _context.CartItems.Where(v => v.CartId == CartId).Sum(v => v.Anime.Price * v.Quantity);
        public async Task ClearCartAsync()
        {
            var anime = await _context.CartItems.Where(v => v.CartId == CartId).ToListAsync();
            _context.CartItems.RemoveRange(anime);
            await _context.SaveChangesAsync();
        }
    }
}

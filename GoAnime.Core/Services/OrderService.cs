using GoAnime.Core.Interfaces;
using GoAnime.Domain.Models;
using GoAnime.Infrastructure;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GoAnime.Core.Services
{
    public class OrderService : IOrderService
    {
        private readonly AnimeDbContext _context;
        public OrderService(AnimeDbContext context)
        {
            _context = context;
        }
        public async Task<List<Order>> GetOrdersByUserIdAndRoleAsync(string userId, string userRole)
        {
            var orders = await _context.Orders.Include(v => v.OrderItems).ThenInclude(v => v.Anime)
                .Include(v => v.Fan).ToListAsync();
            if(userRole != "Admin")
            {
                orders = orders.Where(v => v.UserId == userId).ToList();
            }
            return orders;
        }
        public async Task StoreOrderAsync(List<CartItem> items, string userId, string userEmail)
        {
            var order = new Order()
            {
                UserId = userId,
                Email = userEmail
            };
            await _context.Orders.AddAsync(order);
            await _context.SaveChangesAsync();
            foreach (var item in items)
            {
                var orderItems = new OrderItem()
                {
                    AnimeId = item.Anime.Id,
                    OrderId = order.Id,
                    Price = item.Anime.Price,
                    Quantity = item.Quantity
                };
                await _context.OrderItems.AddAsync(orderItems);
            }
            await _context.SaveChangesAsync();
        }
    }
}

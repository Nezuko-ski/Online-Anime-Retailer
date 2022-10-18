using GoAnime.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace GoAnime.Core.Interfaces
{
    public interface IOrderService
    {
        Task StoreOrderAsync(List<CartItem> items, string userId, string userEmail);
        Task<List<Order>> GetOrdersByUserIdAndRoleAsync(string userId, string userRole);
    }
}

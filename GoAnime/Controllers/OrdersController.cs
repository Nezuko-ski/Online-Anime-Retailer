using GoAnime.Core.CartFunctionality;
using GoAnime.Core.Interfaces;
using GoAnime.Core.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.Threading.Tasks;

namespace GoAnime.Controllers
{
    public class OrdersController : Controller
    {
        private readonly IAnimeService _service;
        private readonly IOrderService _order;
        private readonly Cart _cart;
        public OrdersController(IAnimeService service, Cart cart, IOrderService order)
        {
            _service = service;
            _cart = cart;
            _order = order;
        }
        public async Task<IActionResult> Index() 
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            string userRole = User.FindFirstValue(ClaimTypes.Role);
            return View(await _order.GetOrdersByUserIdAndRoleAsync(userId, userRole));
        } 
        public IActionResult Cart() 
        {
            var items = _cart.GetCartItems();
            _cart.CartItems = items;
            var response = new CartVM()
            {
                Cart = _cart,
                CartTotal = _cart.CartTotal()
            };
            return View(response);
        }
        public async Task<RedirectToActionResult> AddToCart(int id)
        {
            var anime = await _service.GetAnimeByIdAsync(id);
            if(anime != null)
            {
                _cart.AddItemToCart(anime);
            }
            return RedirectToAction(nameof(Cart));           
        }

        public async Task<RedirectToActionResult> RemoveFromCart(int id)
        {
            var anime = await _service.GetAnimeByIdAsync(id);
            if (anime != null)
            {
                _cart.RemoveItemFromCart(anime);
            }
            return RedirectToAction(nameof(Cart));
        }
        public async Task<IActionResult> CompleteOrder()
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            string userEmail = User.FindFirstValue(ClaimTypes.Email);
            await _order.StoreOrderAsync(_cart.GetCartItems(), userId, userEmail);
            await _cart.ClearCartAsync();
            return View("OrderCompleted");
            
        }
    }
}

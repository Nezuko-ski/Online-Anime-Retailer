using GoAnime.Core.CartFunctionality;
using Microsoft.AspNetCore.Mvc;

namespace GoAnime.ViewComponents
{
    public class CartSummary : ViewComponent
    {
        private readonly Cart _cart;
        public CartSummary(Cart cart)
        {
            _cart = cart;
        }
        public IViewComponentResult Invoke() => View(_cart.GetCartItems().Count);

    }
  
}

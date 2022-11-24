using ASPUI.Models;
using ASPUI.Models.Helpers;
using DataAccess.Concrete.EntityFramework;
using Microsoft.AspNetCore.Mvc;

namespace ASPUI.Controllers
{
    public class CartController : Controller
    {
        NetworkDbContext _context;
        public CartController(NetworkDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var cart = SessionHelper.GetObjectFromJson<List<BasketViewModel>>(HttpContext.Session, "cart");
            if (cart != null)
            {
                ViewBag.Total = cart.Sum(c => c.Quantity * c.Product.Price);
            }
            else
            {
                ViewBag.Total = 0;
            }
            return View(cart);
        }

        public IActionResult Buy(int id)
        {
            if (SessionHelper.GetObjectFromJson<List<BasketViewModel>>(HttpContext.Session, "cart") == null)
            {
                var cart = new List<BasketViewModel>();
                cart.Add(new BasketViewModel { Product = _context.Products.Find(id), Quantity = 1 });
                SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);
            }
            else
            {
                var cart = SessionHelper.GetObjectFromJson<List<BasketViewModel>>(HttpContext.Session, "cart");
                int index = isExits(cart, id);
                if (index == -1)
                {
                    cart.Add(new BasketViewModel { Product = _context.Products.Find(id), Quantity = 1 });
                }
                else
                {
                    cart[index].Quantity++;
                }
                SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);
            }
            return RedirectToAction("Index","Home");
        }

        public IActionResult Remove(int id)
        {
            var cart = SessionHelper.GetObjectFromJson<List<BasketViewModel>>(HttpContext.Session, "cart");
            int index = isExits(cart, id);
            cart.RemoveAt(index);
            SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);
            return RedirectToAction("Index");
        }

        private int isExits(List<BasketViewModel> cart, int id)
        {
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].Product.Id.Equals(id))
                {
                    return i;
                    break;
                }
            }
            return -1;
        }
    }
}

using ASPUI.Models;
using Business.Abstract;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace ASPUI.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        ICategoryService categoryService;
        IProductService productService;

        public HomeController(ICategoryService categoryService, IProductService productService)
        {
            this.categoryService = categoryService;
            this.productService = productService;
        }

        public IActionResult Index(int id)
        {
            HomeViewModel model = new HomeViewModel();
            if (id == 0)
            {
                model.products = productService.GetAll();
            }
            else
            {
                model.products = productService.GetAll(id);
            }
            model.categories = categoryService.GetAll();
            return View(model);
        }

        [HttpPost]
        public IActionResult Index(string name)
        {
            HomeViewModel model = new HomeViewModel();
            model.products = productService.GetAllByDescription(name);
            model.categories = categoryService.GetAll();
            return View(model);
        }
        public IActionResult Details(int id)
        {
            var product = productService.GetById(id);
            return View(product);
        }
    }
}
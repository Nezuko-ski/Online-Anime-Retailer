using GoAnime.Core.Interfaces;
using GoAnime.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace GoAnime.Controllers
{
    public class ProducersController : Controller
    {
        private readonly IProducersService _service;
        public ProducersController(IProducersService service)
        {
            _service = service;
        }
        public async Task<IActionResult> Index() => View(await _service.GetAllAsync());
        public IActionResult Create() => View();
        
        [HttpPost]
        public async Task<IActionResult> Create([Bind("FullName, ProfilePictureURL, Bio")] Producer producer)
        {
            if (ModelState.IsValid)
            {
                await _service.AddAsync(producer);
                return RedirectToAction(nameof(Index));
            }
            return View(producer);
        }

        public async Task<IActionResult> Details(int id)
        {
            var details = await _service.GetByIdAsync(id);
            return details == null ? View("NotFound") : View(details);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var details = await _service.GetByIdAsync(id);
            return details == null ? View("NotFound") : View(details);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, [Bind("Id, FullName, ProfilePictureURL, Bio")] Producer producer)
        {
            if (ModelState.IsValid)
            {
                await _service.UpdateAsync(id, producer);
                return RedirectToAction(nameof(Index));
            }
            return View(producer);
        }

        public async Task<IActionResult> Delete(int id)
        {
            var details = await _service.GetByIdAsync(id);
            return details == null ? View("NotFound") : View(details);
        }

        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var details = await _service.GetByIdAsync(id);
            if (details == null) return View("NotFound");
            await _service.DeleteAsync(id);
            return RedirectToAction(nameof(Index));
        }

    }
}

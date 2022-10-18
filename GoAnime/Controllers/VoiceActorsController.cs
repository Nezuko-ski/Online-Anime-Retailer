using GoAnime.Core.Interfaces;
using GoAnime.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace GoAnime.Controllers
{
    public class VoiceActorsController : Controller
    {
        private readonly IVoiceActorsService _service;
        public VoiceActorsController(IVoiceActorsService service)
        {
            _service = service;
        }
        public async Task<IActionResult> Index() => View(await _service.GetAllAsync());
        public IActionResult Create() => View();
        [HttpPost]
        public async Task<IActionResult> Create([Bind("FullName, ProfilePictureURL, Bio")] VoiceActor voiceActor)
        {
            if (ModelState.IsValid)
            {
                await _service.AddAsync(voiceActor);
                return RedirectToAction(nameof(Index));
            }
            return View(voiceActor);
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
        public async Task<IActionResult> Edit(int id, [Bind("Id, FullName, ProfilePictureURL, Bio")] VoiceActor voiceActor)
        {
            if (ModelState.IsValid)
            {
                await _service.UpdateAsync(id, voiceActor);
                return RedirectToAction(nameof(Index));
            }
            return View(voiceActor);
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

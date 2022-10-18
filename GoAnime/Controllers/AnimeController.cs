using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using System.Linq;
using GoAnime.Core.Interfaces;
using Microsoft.AspNetCore.Mvc.Rendering;
using GoAnime.Core.ViewModels;
using System;

namespace GoAnime.Controllers
{
    public class AnimeController : Controller
    {
        private readonly IAnimeService _service;
        public AnimeController(IAnimeService service)
        {
            _service = service;
        }
        public async Task<IActionResult> Index() => View(await _service.GetAllAsync(v => v.Studio));
        public async Task<IActionResult> Filter(string searchString) 
        {
            var allAnime = await _service.GetAllAsync(v => v.Studio);
            if (!string.IsNullOrEmpty(searchString))
            {
                var searchResult = allAnime.Where(v => string.Equals(v.Name, searchString, StringComparison.OrdinalIgnoreCase) || string.Equals(v.Description, searchString, StringComparison.OrdinalIgnoreCase) || string.Equals(v.AnimeGenre.ToString(), searchString, StringComparison.OrdinalIgnoreCase)).ToList();
                return View("Index", searchResult);
            }
            return View("Index", allAnime);
        } 

        public async Task<IActionResult> Details(int id) => View(await _service.GetAnimeByIdAsync(id));
        public async Task<IActionResult> Create()
        {
            var animeDropdown = await _service.GetNewAnimeDropdownValuesAsync();
            ViewBag.Studios = new SelectList(animeDropdown.Studios, "Id", "Name");
            ViewBag.Producers = new SelectList(animeDropdown.Producers, "Id", "FullName");
            ViewBag.VoiceActors = new SelectList(animeDropdown.VoiceActors, "Id", "FullName");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(NewAnimeVM anime)
        {
            if (ModelState.IsValid)
            {
                await _service.AddNewAnimeAsync(anime);
                return RedirectToAction(nameof(Index));
            }
            var animeDropdown = await _service.GetNewAnimeDropdownValuesAsync();
            ViewBag.Studios = new SelectList(animeDropdown.Studios, "Id", "Name");
            ViewBag.Producers = new SelectList(animeDropdown.Producers, "Id", "FullName");
            ViewBag.VoiceActors = new SelectList(animeDropdown.VoiceActors, "Id", "FullName");
            return View(anime);
        }

        public async Task<IActionResult> Edit(int id)
        {
            var animeDetails = await _service.GetAnimeByIdAsync(id);
            if (animeDetails == null) return View("NotFound");
            var response = new NewAnimeVM()
            {
                Id = animeDetails.Id,
                Name = animeDetails.Name,
                Description = animeDetails.Description,
                AnimeGenre = animeDetails.AnimeGenre,
                ImageURL = animeDetails.ImageURL,
                Price = animeDetails.Price,
                StartDate = animeDetails.StartDate,
                EndDate = animeDetails.EndDate,
                ProducerId = animeDetails.ProducerId,
                StudioId = animeDetails.StudioId,
                VoiceActorIds = animeDetails.VoiceActors_Anime.Select(v => v.VoiceActorId).ToList()
            };
            var animeDropdown = await _service.GetNewAnimeDropdownValuesAsync();
            ViewBag.Studios = new SelectList(animeDropdown.Studios, "Id", "Name");
            ViewBag.Producers = new SelectList(animeDropdown.Producers, "Id", "FullName");
            ViewBag.VoiceActors = new SelectList(animeDropdown.VoiceActors, "Id", "FullName");
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, NewAnimeVM anime)
        {
            if (id != anime.Id) return View("NotFound");
            if (ModelState.IsValid)
            {
                await _service.UpdateAnimeAsync(anime);
                return RedirectToAction(nameof(Index));
            }
            var animeDropdown = await _service.GetNewAnimeDropdownValuesAsync();
            ViewBag.Studios = new SelectList(animeDropdown.Studios, "Id", "Name");
            ViewBag.Producers = new SelectList(animeDropdown.Producers, "Id", "FullName");
            ViewBag.VoiceActors = new SelectList(animeDropdown.VoiceActors, "Id", "FullName");
            return View(anime);
        }
    }
}

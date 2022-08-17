using AutoMapper;
using Library.BLL.Interfaces;
using Library.Common;
using Library.Entities.LibraryItem;
using Library.PL.WebPL.Models.AuthorVM;
using Microsoft.AspNetCore.Mvc;

namespace EPAM.Library.PL.WebPL.Controllers
{
    public class AuthorController : Controller
    {
        // constructor
        IAuthorLogic _authorLogic = AuthorDependencyResolver.AuthorLogic;

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateFromBook(CreateAuthorVM model)
        {
            if (!ModelState.IsValid)
            {
                return View("~/Views/Book/Create.cshtml");
            }

            var config = new MapperConfiguration(cfg => cfg.CreateMap<CreateAuthorVM, Author>());
            IMapper mapper = new Mapper(config);
            var author = mapper.Map<Author>(model);

            _authorLogic.Add(author);
            try
            {
                return RedirectToAction("Create", "Book");
            }
            catch
            {
                return View("~/Views/Book/Create.cshtml");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateFromPatent(CreateAuthorVM model)
        {
            if (!ModelState.IsValid)
            {
                return View("~/Views/Patent/Create.cshtml");
            }

            var config = new MapperConfiguration(cfg => cfg.CreateMap<CreateAuthorVM, Author>());
            IMapper mapper = new Mapper(config);
            var author = mapper.Map<Author>(model);

            _authorLogic.Add(author);
            try
            {
                return RedirectToAction("Create", "Patent");
            }
            catch
            {
                return View("~/Views/Patent/Create.cshtml");
            }
        }
    }
}

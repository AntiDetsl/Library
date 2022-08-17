using AutoMapper;
using Library.BLL.Interfaces;
using Library.Common;
using Library.Entities.LibraryItem;
using Library.PL.WebPL.Models.Book;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EPAM.Library.PL.WebPL.Controllers
{
    public class BookController : Controller
    {
        private IBookLogic _bookLogic = BookDependencyResolver.BookLogic;

        // GET: BookController
        public ActionResult Index()
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Book, DisplayBookVM>());
            IMapper mapper = new Mapper(config);

            var books = mapper.Map<IEnumerable<DisplayBookVM>>(_bookLogic.GetAll());
            return View(books);
        }

        // GET: BookController/Details/5
        public ActionResult Details(Guid id)
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Book, DisplayBookVM>());
            IMapper mapper = new Mapper(config);

            var book = _bookLogic.GetAll().FirstOrDefault(item => item.ID == id);

            var model = mapper.Map<DisplayBookVM>(book);
            return View(model);
        }

        // GET: BookController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: BookController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([FromForm] CreateBookVM model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            var config = new MapperConfiguration(cfg => cfg.CreateMap<CreateBookVM, Book>());
            IMapper mapper = new Mapper(config);

            var book = mapper.Map<Book>(model);
            _bookLogic.Add(book);

            try 
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }



        // GET: BookController/Edit/5
        public ActionResult Edit(Guid id)
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Book, EditBookVM>());
            IMapper mapper = new Mapper(config);

            var book = _bookLogic.GetAll().FirstOrDefault(item => item.ID == id);
            var model = mapper.Map<EditBookVM>(book);

            return View(model);
        }

        // POST: BookController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Guid id, [FromForm] EditBookVM model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            var config = new MapperConfiguration(cfg => cfg.CreateMap<EditBookVM, Book>());
            IMapper mapper = new Mapper(config);

            var book = mapper.Map<Book>(model);
            book.ID = id;
            _bookLogic.Edit(book);

            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // POST: BookController/Delete/5
        public ActionResult Delete(Guid id)
        {
            _bookLogic.Delete(id);
            
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}

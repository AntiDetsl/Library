using AutoMapper;
using Library.BLL.Interfaces;
using Library.Common;
using Library.Entities.LibraryItem;
using Library.PL.WebPL.Models.Newspaper;
using Microsoft.AspNetCore.Mvc;

namespace EPAM.Library.PL.WebPL.Controllers
{
    public class NewspaperController : Controller
    {
        private INewspaperLogic _newspaperLogic;
        public NewspaperController()
        {
           _newspaperLogic = NewspaperDependencyResolver.NewspaperLogic;
        }
         
        public IActionResult Index()
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Newspaper, DisplayNewspaperVM>());
            IMapper mapper = new Mapper(config);

            var newspapers = mapper.Map<IEnumerable<DisplayNewspaperVM>>(_newspaperLogic.GetAll());
            return View(newspapers);
        }

        public IActionResult Details(Guid id)
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Newspaper, DisplayNewspaperVM>());
            IMapper mapper = new Mapper(config);

            var newspaper = _newspaperLogic.GetAll().FirstOrDefault(item => item.ID == id);
            var model = mapper.Map<DisplayNewspaperVM>(newspaper);

            return View(model);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([FromForm] CreateNewspaperVM model)
        {
            if(model.IssueDate.Year != model.PublicationYear)
            {
                ModelState.AddModelError("IssueDate", "Wrong date: year of publishing is not the same as year of issue");
            }

            if (!ModelState.IsValid)
            {
                return View();
            }
            
            var config = new MapperConfiguration(cfg => cfg.CreateMap<CreateNewspaperVM, Newspaper>());

            IMapper mapper = new Mapper(config);
            var newspaper = mapper.Map<Newspaper>(model);

            _newspaperLogic.Add(newspaper);

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
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Newspaper, EditNewspaperVM>());
            IMapper mapper = new Mapper(config);

            var newspaper = _newspaperLogic.GetAll().FirstOrDefault(item => item.ID == id);
            var model = mapper.Map<EditNewspaperVM>(newspaper);

            return View(model);
        }

        // POST: BookController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Guid id, [FromForm] EditNewspaperVM model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            var config = new MapperConfiguration(cfg => cfg.CreateMap<EditNewspaperVM, Newspaper>());
            IMapper mapper = new Mapper(config);

            var newspaper = mapper.Map<Newspaper>(model);
            newspaper.ID = id;
            _newspaperLogic.Edit(newspaper);

            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Delete(Guid id)
        {
            _newspaperLogic.Delete(id);

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

using AutoMapper;
using Library.BLL.Interfaces;
using Library.Common;
using Library.Entities.LibraryItem;
using Library.PL.WebPL.Models.Patent;
using Microsoft.AspNetCore.Mvc;

namespace EPAM.Library.PL.WebPL.Controllers
{
    public class PatentController : Controller
    {
        IPatentLogic _patentLogic;
        public PatentController()
        {
            _patentLogic = PatentDependencyResolver.PatentLogic;
        }

        public IActionResult Index()
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Patent, DisplayPatentVM>());

            IMapper mapper = new Mapper(config);
            var patents = mapper.Map<IEnumerable<DisplayPatentVM>>(_patentLogic.GetAll());

            return View(patents);
        }

        public IActionResult Details(Guid id)
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Patent, DisplayPatentVM>());
            IMapper mapper = new Mapper(config);

            var patent = _patentLogic.GetAll().FirstOrDefault(item => item.ID == id);
            var model = mapper.Map<DisplayPatentVM>(patent);

            return View(model);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(CreatePatentVM model)
        {
            if(model.ApplicationDate > model.PublicationDate)
            {
                ModelState.AddModelError("ApplicationDate", "Application date cannot be later than the publication date");
            }
            
            if (!ModelState.IsValid)
            {
                return View();
            }

            var config = new MapperConfiguration(cfg => cfg.CreateMap<CreatePatentVM, Patent>());

            IMapper mapper = new Mapper(config);
            var patent = mapper.Map<Patent>(model);

            _patentLogic.Add(patent);

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
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Patent, EditPatentVM>());
            IMapper mapper = new Mapper(config);

            var patent = _patentLogic.GetAll().FirstOrDefault(item => item.ID == id);
            var model = mapper.Map<EditPatentVM>(patent);

            return View(model);
        }

        // POST: BookController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Guid id, [FromForm] EditPatentVM model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            var config = new MapperConfiguration(cfg => cfg.CreateMap<EditPatentVM, Patent>());
            IMapper mapper = new Mapper(config);

            var patent = mapper.Map<Patent>(model);
            patent.ID = id;
            _patentLogic.Edit(patent);

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
            _patentLogic.Delete(id);

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

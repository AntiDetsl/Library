using AutoMapper;
using Library.BLL.Interfaces;
using Library.Common;
using Library.Entities;
using Library.PL.WebPL.Models.User;
using Microsoft.AspNetCore.Mvc;

namespace EPAM.Library.PL.WebPL.Controllers
{
    public class UserController : Controller
    {
        private IUserLogic _userLogic;
        public UserController()
        {
            _userLogic = UserDependencyResolver.UserLogic;
        }

        // GET: UserController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: UserController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([FromForm] CreateUserVM model)
        {
            if (_userLogic.GetAll().Any(item => item.Email == model.Email))
            {
                ModelState.AddModelError("Email", "This email already exists");
            }


            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var config = new MapperConfiguration(cfg => cfg.CreateMap<CreateUserVM, User>()
            .ForSourceMember(x => x.ConfirmPassword, opt => opt.DoNotValidate()));

            IMapper mapper = new Mapper(config);
            var user = mapper.Map<User>(model);

            user.Roles.Add(Role.User);

            _userLogic.Add(user);

            try
            {
                return RedirectToAction();
            }
            catch
            {
                return View();
            }
        }

        // GET: UserController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: UserController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: UserController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: UserController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
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

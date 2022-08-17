using Library.BLL.Interfaces;
using Library.Common;
using Library.PL.WebPL.Models.AuthorVM;
using Microsoft.AspNetCore.Mvc;

namespace Library.PL.WebPL.Components
{
    public class AuthorsList : ViewComponent
    {
        private IAuthorLogic _authorLogic;
        private DisplayAuthorVM _authorVM;

        public AuthorsList()
        {
            _authorLogic = AuthorDependencyResolver.AuthorLogic;
            _authorVM = new DisplayAuthorVM(_authorLogic.GetAll());
        }

        public IViewComponentResult Invoke()
        {
            return View("_AuthorsList", _authorVM);
        }
    }
}

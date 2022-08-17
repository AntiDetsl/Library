using EPAM.Library.DAL;
using Library.BLL.Interfaces;
using Library.BLL;
using Library.DAL.Interfaces;

namespace Library.Common
{
    public class AuthorDependencyResolver
    {
        private static IAuthorLogic _authorLogic;
        private static IAuthorDAO _authorDAO;
        static AuthorDependencyResolver()
        {
            _authorDAO = new AuthorDAO();
            _authorLogic = new AuthorLogic(_authorDAO);
        }

        public static IAuthorLogic AuthorLogic => _authorLogic;
        public static IAuthorDAO AuthorDAO => _authorDAO;
    }
}

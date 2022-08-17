using Library.BLL.Interfaces;
using Library.BLL;
using Library.DAL.Interfaces;
using Library.DAL;

namespace Library.Common
{
    public static class BookDependencyResolver
    {
        private static IBookLogic _bookLogic;
        private static IBookDAO _bookDAO;

        static BookDependencyResolver()
        {
            _bookDAO = new BookDAO();
            _bookLogic = new BookLogic(_bookDAO);
        }

        public static IBookLogic BookLogic => _bookLogic;
        public static IBookDAO BookDAO => _bookDAO;
    }
}

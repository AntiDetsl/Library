using Library.BLL;
using Library.BLL.Interfaces;
using Library.DAL;
using Library.DAL.Interfaces;

namespace Library.Common
{
    public static class UserDependencyResolver
    {
        private static IUserLogic _userLogic;
        private static IUserDAO _userDAO;
        static UserDependencyResolver()
        {
            _userDAO = new UserDAO();
            _userLogic = new UserLogic(_userDAO);
        }

        public static IUserLogic UserLogic => _userLogic;
        public static IUserDAO UserDAO => _userDAO;
    }
}

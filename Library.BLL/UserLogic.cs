using Library.BLL.Interfaces;
using Library.DAL.Interfaces;
using Library.Entities;

namespace Library.BLL
{
    public class UserLogic : IUserLogic
    {
        private IUserDAO _userDAO;
        public UserLogic(IUserDAO userDAO)
        {
            _userDAO = userDAO;
        }

        public Guid Add(User user)
        {
            var hash = System.Security.Cryptography.SHA512.Create();
            user.Password = hash.ComputeHash(user.Password);

            return _userDAO.Add(user);
        }

        public IEnumerable<User> GetAll()
        {
            return _userDAO.GetAll();
        }
    }
}

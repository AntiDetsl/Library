using Library.Entities;

namespace Library.DAL.Interfaces
{
    public interface IUserDAO
    {
        Guid Add(User user);
        IEnumerable<User> GetAll();
    }
}

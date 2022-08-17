using Library.Entities;

namespace Library.BLL.Interfaces
{
    public interface IUserLogic
    {
        Guid Add(User user);
        IEnumerable<User> GetAll();
    }
}

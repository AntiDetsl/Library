using Library.Entities.LibraryItem;

namespace Library.BLL.Interfaces
{
    public interface IAuthorLogic
    {
        Guid Add(Author author);
        IEnumerable<Author> GetAll();
    }
}

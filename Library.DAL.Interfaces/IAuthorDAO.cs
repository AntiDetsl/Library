using Library.Entities.LibraryItem;

namespace Library.DAL.Interfaces
{
    public interface IAuthorDAO
    {
        Guid Add(Author author);
        Guid? FindAuthor(Author author);
        IEnumerable<Author> GetAll();
        IEnumerable<Author> GetAuthorsByItemID(Guid itemID);
    }
}

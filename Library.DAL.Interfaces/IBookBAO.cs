using Library.Entities.LibraryItem;

namespace Library.DAL.Interfaces
{
    public interface IBookDAO
    {
        Guid Add(Book book);
        void Update(Book book);
        void DeleteByID(Guid id);
        void MarkAsDeleted(Guid id);
        IEnumerable<Book> GetAll();
    }
}

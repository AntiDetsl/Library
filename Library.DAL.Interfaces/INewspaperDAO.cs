using Library.Entities.LibraryItem;

namespace Library.DAL.Interfaces
{
    public interface INewspaperDAO
    {
        Guid Add(Newspaper newspaper);
        void Update(Newspaper newspaper);
        void DeleteByID(Guid id);
        void MarkAsDeleted(Guid id);
        IEnumerable<Newspaper> GetAll();
    }
}

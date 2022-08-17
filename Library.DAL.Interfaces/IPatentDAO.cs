using Library.Entities.LibraryItem;

namespace Library.DAL.Interfaces
{
    public interface IPatentDAO
    {
        Guid Add(Patent patent);
        void Update(Patent patent);
        void DeleteByID(Guid id);
        void MarkAsDeleted(Guid id);
        IEnumerable<Patent> GetAll();
    }
}

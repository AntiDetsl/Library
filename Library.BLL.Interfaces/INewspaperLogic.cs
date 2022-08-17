using Library.Entities.LibraryItem;

namespace Library.BLL.Interfaces
{
    public interface INewspaperLogic
    {
        Guid Add(Newspaper newspaper);
        void Edit(Newspaper newspaper);
        void Delete(Guid id);
        bool FindByName(string name, out List<Newspaper> newspapers);
        IEnumerable<Newspaper> GetAll();
        List<IGrouping<int, Newspaper>> GroupByPublicationYear();
        IEnumerable<Newspaper> OrderByPublicationYear(IEnumerable<Newspaper> newspapers);
        IEnumerable<Newspaper> OrderByPublicationYearDesc(IEnumerable<Newspaper> newspapers);
    }
}

using Library.BLL.Interfaces;
using Library.DAL.Interfaces;
using Library.Entities.LibraryItem;

namespace Library.BLL
{
    public class AuthorLogic : IAuthorLogic
    {
        private readonly IAuthorDAO _authorDAO;
        public AuthorLogic(IAuthorDAO authorDAO)
        {
            _authorDAO = authorDAO;
        }

        public Guid Add(Author author)
        {
            return _authorDAO.Add(author); 
        }

        public IEnumerable<Author> GetAll()
        {
            return _authorDAO.GetAll();
        }
    }
}

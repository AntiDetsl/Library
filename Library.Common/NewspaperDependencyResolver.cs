using Library.BLL.Interfaces;
using Library.BLL;
using Library.DAL.Interfaces;
using Library.DAL;

namespace Library.Common
{
    public static class NewspaperDependencyResolver
    {
        private static readonly INewspaperDAO _newspaperDAO;
        private static readonly INewspaperLogic _newspaperLogic;

        static NewspaperDependencyResolver()
        {
            _newspaperDAO = new NewspaperDAO();
            _newspaperLogic = new NewspaperLogic(_newspaperDAO);
        }

        public static INewspaperDAO NewspaperDAO => _newspaperDAO;
        public static INewspaperLogic NewspaperLogic => _newspaperLogic;
    }
}

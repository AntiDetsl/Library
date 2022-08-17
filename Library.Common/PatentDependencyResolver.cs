using Library.BLL.Interfaces;
using Library.BLL;
using Library.DAL.Interfaces;
using Library.DAL;

namespace Library.Common
{
    public static class PatentDependencyResolver
    {
        private static readonly IPatentDAO _patentDAO;
        private static readonly IPatentLogic _patentLogic;

        static PatentDependencyResolver()
        {
            _patentDAO = new PatentDAO();
            _patentLogic = new PatentLogic(_patentDAO);
        }

        public static IPatentLogic PatentLogic => _patentLogic;
        public static IPatentDAO PatentDAO => _patentDAO;
    }
}

using System.ComponentModel;
using Library.Entities.LibraryItem;

namespace Library.PL.WebPL.Models.Book
{
    public class DisplayBookVM
    {
        public Guid ID { get; set; }

        [DisplayName("Title")]
        public string Name { get; set; }

        [DisplayName("Publication year")]
        public int PublicationYear { get; set; }
        public string City { get; set; }
        public string Publisher { get; set; }
        public int Pages { get; set; }
        public string ISBN { get; set; }
        public string Description { get; set; }
        public List<Author> Authors { get; set; }
    }
}

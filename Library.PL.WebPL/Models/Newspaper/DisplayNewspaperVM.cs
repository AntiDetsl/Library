using System.ComponentModel;

namespace Library.PL.WebPL.Models.Newspaper
{
    public class DisplayNewspaperVM
    {
        public Guid ID { get; set; }

        [DisplayName("Title")]
        public string Name { get; set; }
        public string City { get; set; }
        public string Publisher { get; set; }
        public int Pages { get; set; }

        [DisplayName("Publication year")]
        public int PublicationYear { get; set; }
        public string ISSN { get; set; }

        [DisplayName("Issue number")]
        public string IssueNumber { get; set; }

        [DisplayName("Issue date")]
        public DateTime IssueDate { get; set; }
        public string Description { get; set; }
    }
}

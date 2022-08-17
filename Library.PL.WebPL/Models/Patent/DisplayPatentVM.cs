using System.ComponentModel;

namespace Library.PL.WebPL.Models.Patent
{
    public class DisplayPatentVM
    {
        public Guid ID { get; set; }

        [DisplayName("Title")]
        public string Name { get; set; }
        public string Country { get; set; }

        [DisplayName("Registration number")]
        public string RegistrationNumber { get; set; }
        public int Pages { get; set; }

        [DisplayName("Publication date")]
        public DateTime PublicationDate { get; set; }

        [DisplayName("Application date")]
        public DateTime ApplicationDate { get; set; }
        public string Description { get; set; }
        public List<string> Authors { get; set; }
    }
}

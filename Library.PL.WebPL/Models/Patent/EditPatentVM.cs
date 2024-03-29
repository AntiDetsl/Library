﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Library.PL.WebPL.Models.Patent
{
    public class EditPatentVM
    {
        [Required]
        [StringLength(300)]
        [DisplayName("Title")]
        public string Name { get; set; }

        [Required]
        [StringLength(200)]
        [RegularExpression("^[A-Z]([a-z]+|[A-Z]+)$|^[А-ЯЁ]([а-яё]+|[А-ЯЁ]+)$", ErrorMessage = "Wrong city format")]
        public string Country { get; set; }

        [Required]
        [StringLength(9)]
        [RegularExpression("^[0-9]{1,9}$", ErrorMessage = "Wrong registration number format")]
        [DisplayName("Registration number")]
        public string RegistrationNumber { get; set; }

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "The field Pages must be greater than 0")]
        public int Pages { get; set; }

        [Required]
        [DateRange("1/1/1474")]
        [DisplayName("Publication date")]
        [UIHint("date")]
        public DateTime PublicationDate { get; set; }

        [DateRange("1/1/1474")]
        [DisplayName("Application date")]
        [UIHint("date")]
        public DateTime ApplicationDate { get; set; }
        public string Description { get; set; }
    }
}

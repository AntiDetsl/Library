﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Library.PL.WebPL.Models.AuthorVM
{
    public class CreateAuthorVM
    {
        [Required]
        [RegularExpression("(^[A-Z][a-z]*(|-[A-Z][a-z]*)$)|(^[А-ЯЁ][а-яё]*(|-[А-ЯЁ][а-яё]*)$)"
            , ErrorMessage = "Wrong format")]
        [DisplayName("First name")]
        public string FirstName { get; set; }

        [Required]
        [RegularExpression("((^[A-Z]([a-z]*('[A-Z])?)*(|-[A-Z]|( [a-z]+|-[a-z]+)( |-)[A-Z])([a-z]*('[A-Z])?)*)$)" +
            "|((^[А-ЯЁ]([а-яё]*('[А-ЯЁ])?)*(|-[А-ЯЁ]|( [а-яё]+|-[а-яё]+)( |-)[А-ЯЁ])([а-яё]*('[А-ЯЁ])?)*)$)"
            , ErrorMessage = "Wrong format")]
        [DisplayName("Last name")]
        public string SecondName { get; set; }
    }
}

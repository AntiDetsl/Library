using System.ComponentModel.DataAnnotations;

namespace Library.PL.WebPL.Models.User
{
    public class CreateUserVM
    {
        [Required]
        [StringLength(200)]
        public string Name { get; set; }

        [Required]
        [RegularExpression(@"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$", ErrorMessage = "Wrong email format")]
        [EmailAddress(ErrorMessage = "Enter valid Email address")]
        public string Email { get; set; }

        [Required]
        [StringLength(255, ErrorMessage = "Must be between 8 and 255 characters", MinimumLength = 8)]
        [RegularExpression(@"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]*$"
            , ErrorMessage = "Wrong password format: minimum eight characters, at least one latin letter and one number, no spetial characters")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirm Password is required")]
        [StringLength(255, ErrorMessage = "Must be between 8 and 255 characters", MinimumLength = 8)]
        [DataType(DataType.Password)]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }
    }
}

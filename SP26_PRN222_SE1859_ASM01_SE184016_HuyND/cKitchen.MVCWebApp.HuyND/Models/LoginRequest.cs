using System.ComponentModel.DataAnnotations;

namespace cKitchen.MVCWebApp.HuyND.Models
{
    public class LoginRequest
    {
        [Required]
        [Display(Name = "User Name")]
        public string UserName { get; set; } = string.Empty;

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; } = string.Empty;
    }
}

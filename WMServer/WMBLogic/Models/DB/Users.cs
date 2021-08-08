using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace WMBLogic.Models.DB
{
    public class User
    {
        public int user_id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
    }

    public class AuthOption
    {
        [Key]
        public int authOption_id { get; set; }
        [Column]
        public string issuer { get; set; }

        [Column]
        public string audience { get; set; }

        [Column]
        public string secret { get; set; }

        [Column]
        public int tokenLifetime { get; set; }

        public SymmetricSecurityKey GetSymmetricSecurityKey()
        {
            return new SymmetricSecurityKey(Encoding.ASCII.GetBytes(secret));
        }
    }
}
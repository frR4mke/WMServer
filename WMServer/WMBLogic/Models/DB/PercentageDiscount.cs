using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WMBLogic.Models.DB
{
    public class PercentageDiscount
    {
        [Key]
        [Column]
        public int percentageDiscount_id { get; set; }
        [Column]
        public int product_id { get; set; }
        [Column]
        public int percentage { get; set; }

    }
}
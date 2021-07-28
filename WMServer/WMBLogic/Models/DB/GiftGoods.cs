using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WMBLogic.Models.DB
{
    public class GiftGoods
    {
        [Key]
        [Column]
        public int giftGoods_id { get; set; }
        [Column]
        public int product_id { get; set; }
        [Column]
        public int giftproduct_id { get; set; }
    }
}
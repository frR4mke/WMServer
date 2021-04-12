using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WMBLogic.Models.DB
{
    public class OrdersDetails
    {
        [Key]
        [Column]
        public int orderDetails_id { get; set; }
        [Column]
        public int order_id { get; set; }
        [Column]
        public int product_id { get; set; }
        [Column]
        public int quantity { get; set; }
        [Column]
        public int price { get; set; }

    }
}

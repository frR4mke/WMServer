using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace WMBLogic.Models.DB
{
    public class Products
    {
        [Key]
        [Column]
        public int product_id { get; set; }

        [Column]
        public string product_title { get; set; }

        [Column]
        public int quantity { get; set; }

        [Column]
        public int manufacturer_id { get; set; }

        [Column]
        public string description { get; set; }

        [Column]
        public string full_product_title { get; set; }

        [Column]
        public int sort_order { get; set; }

        [Column]
        public int productType_id { get; set; }

        [Column]
        public string country { get; set; }

        [Column]
        public int subProductType_id { get; set; }
    }
}
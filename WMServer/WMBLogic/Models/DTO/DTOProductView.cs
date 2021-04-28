using WMBLogic.Models.DB;

namespace WMBLogic.Models.DTO
{
    public class DTOProductView
    {
        public int product_id { get; set; }
        
        public string product_title { get; set; }
        
        public string full_product_title { get; set; }
        
        public string description { get; set; }
        
        public string country { get; set; }
        
        public decimal price { get; set; }

        public int productType_id { get; set; }
        
        public int subProductType_id { get; set; }
        
        public  string image_title { get; set; }
        public  string manufacturer_title { get; set; }

        public ProductAttributes[] productAttributes { get; set; }
    }
}
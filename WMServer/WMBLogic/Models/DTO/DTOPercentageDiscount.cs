namespace WMBLogic.Models.DTO
{
    public class DTOPercentageDiscount
    {
        public int percentageDiscount_id { get; set; }

        public int product_id { get; set; }
        
        public string product_title { get; set; }

        public int percentage { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Text;
using Extensions;
using WMBLogic.Models.ENUMS;

namespace WMBLogic.Models.DTO
{
    public class DTOOrder
    {
        public int order_id { get; set; }

        public string fio { get; set; }

        public string phoneNumber { get; set; }

        public string payment_title { get; set; }

        public string city_title { get; set; }

        public string delivery_title { get; set; }

        public string deliveryAddress { get; set; }

        public DateTime orderdatetime { get; set; }
        public string orderstate_title  { get; set; }
        
        public string paymenttype_title { get; set; }

        public decimal sum_price { get; set; }
    }


    public class DTOOrderDetails
    {
        public string product_title { get; set; }

        public int quantity { get; set; }

        public decimal price { get; set; }
        
        public string productOptions_title { get; set; }

        
    }
}
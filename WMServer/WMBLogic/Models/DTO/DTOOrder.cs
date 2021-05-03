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
        
        public OrderState orderstate { get; set; }

        public string orderstate_title => Enumerations.GetEnumDescription(this.orderstate);
        
        public decimal sum_price { get; set; }
    }

    public class DTOFormOrder
    {
        public string fio { get; set; }

        public string phoneNumber { get; set; }

        public int payment_id { get; set; }

        public int city_id { get; set; }

        public string deliveryAddress { get; set; }

        public int delivery_id { get; set; }

        public string comment { get; set; }

        public DateTime orderdatetime { get; set; }

        public string device { get; set; }

        public OrderState orderstate { get; set; }

        public DTOOrderDetails[] ordersDetails { get; set; }
    }

    public class DTOOrderDetails
    {
        public int product_id { get; set; }

        public int quantity { get; set; }

        public decimal price { get; set; }
    }
}
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WMBLogic.Models.EFModels
{
    public class Order
    {
        [Key]
        public int order_id { get; set; }

        public string fio { get; set; }

        public string phoneNumber { get; set; }

        public int payment_id { get; set; }

        public string deliveryAddress { get; set; }
        
        public CitiesServed citiesServed { get; set; }

        public DeliveryMethods deliveryMethods { get; set; }
        
        public OrderStates orderStates { get; set; }

        public PaymentType paymentType { get; set; }
        
        public PaymentMethods paymentMethods { get; set; }

        public string comment { get; set; }

        public DateTime orderdatetime { get; set; }

        public string device { get; set; }
    }
    public class CitiesServed
    {
        [Key]
        public int city_id { get; set; }

        public string city_title { get; set; }
    }
    public class DeliveryMethods
    {
        [Key]
        public int delivery_id { get; set; }

        public string delivery_title { get; set; }
    }
    public class OrderStates
    {
        [Key]
        public int orderstate_id { get; set; }

        public string orderstate_title { get; set; }

    }
    public class PaymentType
    {
        [Key]
        public int paymenttype_id { get; set; }

        public string paymenttype_title { get; set; }
    }
    public class PaymentMethods
    {
        [Key]
        public int payment_id { get; set; }

        public string payment_title { get; set; }
    }

}
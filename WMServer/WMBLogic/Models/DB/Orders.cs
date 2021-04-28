using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WMBLogic.Models.DB
{
    public class Orders
    {
        [Key]
        [Column]
        public int order_id { get; set; }

        [Column]
        public string fio { get; set; }

        [Column]
        public string phoneNumber { get; set; }

        [Column]
        public int payment_id { get; set; }

        [Column]
        public int city_id { get; set; }

        [Column]
        public string deliveryAddress { get; set; }

        [Column]
        public int delivery_id { get; set; }

        [Column]
        public string comment { get; set; }

        [Column]
        public DateTime orderdatetime { get; set; }
        
        [Column]
        public  int orderstate { get; set; }

        [Column]
        public string device { get; set; }
    }
}
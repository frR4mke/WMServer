using System;
using System.Collections.Generic;
using System.Text;

namespace WMBLogic.Models.DTO
{
	public class DTOOrder
	{
		public string fio { get; set; }

		public string phoneNumber { get; set; }

		public int payment { get; set; }

		public string city { get; set; }

		public string deliveryAddress { get; set; }

		public int delivery { get; set; }

		public string comment { get; set; }

		public DTOOrderDetails[] ordersDetails { get; set; }
	}
	public class DTOOrderDetails
	{
		public int product_id { get; set; }

		public int quantity { get; set; }
	
		public int price { get; set; }
	}
}

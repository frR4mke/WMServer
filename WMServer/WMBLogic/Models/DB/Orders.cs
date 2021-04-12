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
		public int payment { get; set; }
		[Column]
		public string city { get; set; }
		[Column]
		public string deliveryAddress { get; set; }
		[Column]
		public int delivery { get; set; }
		[Column]
		public string comment { get; set; }

	}
}

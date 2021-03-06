using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace WMBLogic.Models.DTO
{
	public class DTOProducts
	{

		public int product_id { get; set; }

		public string product_title { get; set; }

		public int quantity { get; set; }

		public int manufacturer_id { get; set; }

		public string description { get; set; }

		public string full_product_title { get; set; }

		public int sort_order { get; set; }

		public int productType_id { get; set; }

		public int image_id { get; set; }

		public string image_title { get; set; }

		public string country { get; set; }
	
		public int subProductType_id { get; set; }

		public string short_description { get => this.description.Substring(0, 100); }
	}
}

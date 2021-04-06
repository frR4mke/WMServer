using Extensions;
using System;
using System.Collections.Generic;
using System.Text;
using WMBLogic.Models.INTERFACES;

namespace WMBLogic.Models.FILTRES
{
	public class BaseFilter 
	{
		public decimal? price_min { get; set; }
		public decimal? price_max { get; set; }
		

	}
	public class HeatingFloorFilter : BaseFilter
	{
		public decimal? layingArea_min { get; set; }
		public decimal? layingArea_max { get; set; }
		public decimal? power_min { get; set; }
		public decimal? power_max { get; set; }
		public Manufacturers[] manufacturer { get; set; }
	}
	public class Manufacturers
	{
		public int manufacturer_id { get; set; }
		public string manufacturer_name { get; set; }
	}



}

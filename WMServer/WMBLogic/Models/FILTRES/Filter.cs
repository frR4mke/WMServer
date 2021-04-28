using Extensions;
using NDapper;
using System;
using System.Collections.Generic;
using System.Text;
using WMBLogic.Models.INTERFACES;

namespace WMBLogic.Models.FILTRES
{

	public class Filter
	{
		public List<FilterRange> rangeFilter { get; set; } 
		public List<Manufacturers> manufacturer { get; set; }

		public void FixFields()
		{
			foreach (var filter in rangeFilter)
			{
				filter.field_max = filter.field_max.Replace(',', '.');
				filter.field_min = filter.field_min.Replace(',', '.');

			}
		}
	}
	public class Manufacturers
	{
		public int manufacturer_id { get; set; }
		public string manufacturer_name { get; set; }
	}

}

using System;
using System.Collections.Generic;
using System.Text;
using WMBLogic.Models.INTERFACES;

namespace WMBLogic.Models.DTO
{
	public class DTOProductOptions 
	{
        
        public int productOptions_id { get; set; }
       
        public int product_id { get; set; }
     
        public decimal? power { get; set; }
      
        public decimal? layingArea { get; set; }
       
        public decimal? wireLength { get; set; }
       
        public decimal price { get; set; }

        public int productType_id { get; set; }

    }
}

﻿using NDapper;
using System;
using System.Collections.Generic;
using System.Text;
using WMBLogic.Models.INTERFACES;

namespace WMBLogic.Models.DTO
{
    [Table("Embedded.DTO.DTOProductOptions.sql")]
    public class DTOProductOptions
    {
        public string full_product_title { get; set; }

        public string image_title { get; set; }

        public int productOptions_id { get; set; }

        public int product_id { get; set; }

        public decimal? power { get; set; }

        public decimal? layingArea { get; set; }

        public decimal? wireLength { get; set; }

        public decimal? matLength { get; set; }

        public decimal price { get; set; }
        
        public decimal? discountprice { get; set; }

        public int productType_id { get; set; }
        
        public string size { get; set; }
    }
}
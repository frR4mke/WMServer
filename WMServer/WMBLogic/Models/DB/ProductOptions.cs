using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace WMBLogic.Models.DB
{
    public class ProductOptions
    {
        [Key]
        [Column]
        public int productOptions_id { get; set; }

        [Column]
        public int product_id { get; set; }

        [Column]
        public decimal power { get; set; }

        [Column]
        public decimal? layingArea { get; set; }

        [Column]
        public decimal? wireLength { get; set; }

        [Column]
        public decimal? matLength { get; set; }

        [Column]
        public decimal price { get; set; }
    }

    public class ProductOptionsSelectList
    {
        public int product_id { get; set; }
        public int productOptions_id { get; set; }
        public string productOptions_title { get; set; }
        public decimal price { get; set; }
    }
}
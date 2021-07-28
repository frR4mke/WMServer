using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace WMBLogic.Models.DB
{
    public class ProductAttributes
    {
        [Key]
        [Column]
        public int productAttributes_id { get; set; }

        [Column]
        public int product_id { get; set; }

        [Column]
        public string attribute_group { get; set; }

        [Column]
        public string attribute { get; set; }

        [Column]
        public string text { get; set; }
        
        [Column]
        public int sort { get; set; }
    }
}
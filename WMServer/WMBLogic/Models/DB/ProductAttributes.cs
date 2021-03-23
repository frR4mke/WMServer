using System;
using System.Collections.Generic;
using System.Text;

namespace WMBLogic.Models.DB
{
    public class ProductAttributes
    {
        public int productAttributes_id { get; set; }

        public int product_id { get; set; }

        public string attribute_group { get; set; }

        public string attribute { get; set; }

        public string text { get; set; }

    }
}

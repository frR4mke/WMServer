using System;
using System.Collections.Generic;
using System.Text;

namespace WMBLogic.Models.DB
{
    public class ProductOptions
    {
        public int productOptions_id { get; set; }

        public int product_id { get; set; }

        public string power { get; set; }

        public string layingArea { get; set; }

        public string wireLength { get; set; }

        public double price { get; set; }

    }
}

using System;
using System.Collections.Generic;
using System.Text;

namespace WMBLogic.Models.DB
{
    public class Images
    {
        public int image_id { get; set; }

        public int product_id { get; set; }

        public string image_title { get; set; }

        public int sort { get; set; }
    }
}
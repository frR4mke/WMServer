using System;

namespace WMBLogic.Services
{
    public class QueryService
    {
        public Func<string, string> GetDTOProductsQuery = query =>
            $"select p.*,i.image_id,i.image_title from Products p left join Images i on p.product_id = i.product_id {query}";

        public Func<string, string> GetDTOProductOptions = query => $"select po.*,p.productType_id from ProductOptions po " +
        $"join Products p on p.product_id = po.product_id {query}";
    }
}
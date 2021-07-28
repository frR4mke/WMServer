select
    p.*,
    i.image_id,
    i.image_title,
    pd.percentage,
    gp.product_title as gift_title
from Products p
         left join Images i on p.product_id = i.product_id
         left join PercentageDiscount pd on p.product_id = pd.product_id
         left join GiftGoods gg on p.product_id = gg.product_id
         left join Products gp on gg.giftproduct_id = gp.product_idфывфбвлф
-- group by p.product_id, p.product_title, p.quantity,
--          p.manufacturer_id, p.description, p.full_product_title,
--          p.sort_order, p.productType_id, p.country,p.subProductType_id,
--          i.image_id,i.image_title,pd.percentage,p.product_price, gp.product_title


		




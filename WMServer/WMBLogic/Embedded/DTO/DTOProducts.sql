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
         left join Products gp on gg.giftproduct_id = gp.product_id

		




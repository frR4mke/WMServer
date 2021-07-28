select g.*, p.product_title, gf.product_title as giftproduct_title
from GiftGoods g
         join Products p on g.product_id = p.product_id
         join Products gf on g.giftproduct_id = gf.product_id



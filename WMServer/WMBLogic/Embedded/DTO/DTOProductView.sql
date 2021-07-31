select p.product_id,
       p.product_title,
       p.full_product_title,
       p.description,
       p.country,
       p.productType_id,
       p.subProductType_id,
       i.image_title,
       m.manufacturer_title,
       MIN(o.price) as price,
       pd.percentage,
       gp.product_title as gift_title
from Products p
         join ProductOptions o on p.product_id = o.product_id
         join Images i on p.product_id = i.product_id
         join Manufacturers m on p.manufacturer_id = m.manufacturer_id
         left join PercentageDiscount pd on p.product_id = pd.product_id
         left join GiftGoods gg on p.product_id = gg.product_id
         left join Products gp on gg.giftproduct_id = gp.product_id
where p.product_id = @product_id
group by p.product_id,p.product_title, p.full_product_title,p.description,p.country, p.productType_id,p.subProductType_id,i.image_title,m.manufacturer_title,pd.percentage,gp.product_title


select * from ProductAttributes where product_id = @product_id
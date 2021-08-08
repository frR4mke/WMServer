select
    po.*,
    CAST(ROUND( po.price - (po.price * (CAST(d.percentage as decimal) / 100)), 0) AS decimal(7,0)) as discountprice,
    p.productType_id,
    i.image_title,
    p.full_product_title
from ProductOptions po
         join Products p on p.product_id = po.product_id
         join Images i on p.product_id = i.product_id
         left join PercentageDiscount d on p.product_id = d.product_id
where po.product_id = @product_id
group by po.product_id, po.productOptions_id, po.power, po.layingArea, po.matLength, po.wireLength, po.price, po.size, p.productType_id, i.image_title, p.full_product_title, d.percentage
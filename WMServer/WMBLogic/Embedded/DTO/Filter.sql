select
    MIN(po.power) as power_min,
    MAX(po.power) as power_max,
    MIN(po.price) as price_min,
    MAX(po.price) as price_max,
    MIN(po.layingArea) as layingArea_min,
    MAX(po.layingArea) as layingArea_max,
    MIN(po.wireLength) as wireLength_min,
    MAX(po.wireLength) as wireLength_max,
    MIN(po.matLength) as matLength_min,
    MAX(po.matLength) as matLength_max
from Products p
         join ProductOptions po on p.product_id = po.product_id
where productType_id = @productType_id


select m.manufacturer_title, m.manufacturer_id
from Products p  
	join Manufacturers m on p.manufacturer_id = m.manufacturer_id  
where p.productType_id = @productType_id  
group by m.manufacturer_title, m.manufacturer_id
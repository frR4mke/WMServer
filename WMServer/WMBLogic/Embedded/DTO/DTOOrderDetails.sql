select 
p.product_title,
od.quantity,
od.price,
case when po.power is not null then CONVERT(varchar, power) + N' ВТ/ ' else '' end  +
			case when po.layingArea is not null then CONVERT(varchar, po.layingArea) + N' м2 /' else '' end  +
			case when po.wireLength is not null then CONVERT(varchar, po.wireLength) + N' м /' else '' end  +
			case when po.matLength is not null then CONVERT(varchar, po.matLength) + N' м ' else '' end  + 
			case when po.size is not null then CONVERT(varchar, po.size) + N' мм ' else '' end as productOptions_title
from OrdersDetails od
join Products p on od.product_id = p.product_id
join ProductOptions po on od.productOptions_id = po.productOptions_id
where od.order_id = @order_id



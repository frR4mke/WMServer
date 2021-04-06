select 
p.*,
i.image_id,
i.image_title 
from Products p 
	left join Images i on p.product_id = i.product_id
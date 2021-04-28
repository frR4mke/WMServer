 select 
 po.*,
 p.productType_id,
 i.image_title,
 p.full_product_title
 from ProductOptions po  
        join Products p on p.product_id = po.product_id
		join Images i on p.product_id = i.product_id
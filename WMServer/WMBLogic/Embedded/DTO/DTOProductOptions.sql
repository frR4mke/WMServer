 select 
 po.*,
 p.productType_id 
 from ProductOptions po  
        join Products p on p.product_id = po.product_id
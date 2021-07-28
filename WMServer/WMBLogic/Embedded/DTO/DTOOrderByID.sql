--#include Embedded.DTO.DTOOrder.sql
where o.order_id = @order_id
group by o.fio, o.phonenumber, p.payment_title, c.city_title, d.delivery_title, o.deliveryAddress, o.order_id,
         os.orderstate_title,o.orderdatetime,pt.paymenttype_title


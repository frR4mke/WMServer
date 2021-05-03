select o.order_id,
       o.fio,
       o.phonenumber,
       p.payment_title,
       c.city_title,
       d.delivery_title,
       o.deliveryAddress,
       o.orderstate,
       o.orderdatetime,
       SUM(od.price * od.quantity) as sum_price
from Orders o
         join PaymentMethods p on o.payment_id = p.payment_id
         join CitiesServed c on o.city_id = c.city_id
         join DeliveryMethods d on o.delivery_id = d.delivery_id
         join OrdersDetails od on od.order_id = o.order_id 
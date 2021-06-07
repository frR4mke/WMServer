using NDapper.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Dapper;
using Extensions;
using Mail;
using WMBLogic.Embedded;
using WMBLogic.Models.DB;
using WMBLogic.Models.DTO;
using WMBLogic.Models.ENUMS;

namespace WMBLogic.Services
{
    public class OrderService
    {
        readonly MailHandler mailHandler;
        readonly IDataBase database;
        readonly IDbConnection dbConnection;

        public OrderService(IDataBase database, MailHandler mailHandler, IDbConnection dbConnection)
        {
            this.database = database;
            this.mailHandler = mailHandler;
            this.dbConnection = dbConnection;
        }

        // public void UpdateOrder(Orders order)
        // {
        //     database.Repository<Orders>().EditEntity(order);
        // }

        public void UpdateOrder(DTOOrderEdit formOrder)
        {
            database.Repository<Orders>().EditEntity(formOrder.order);

            string sql = @"select * from OrdersDetails where order_id = @order_id";

            IEnumerable<OrdersDetails> currentDetails = database.ExucuteQuery<OrdersDetails>(sql, new {@order_id = formOrder.order.order_id});

            IEnumerable<OrdersDetails> detailsTodelete = currentDetails.Where(x => !formOrder.ordersDetails.Where(x => x.orderDetails_id != 0).Select(x => x.orderDetails_id).Contains(x.orderDetails_id));

            IEnumerable<OrdersDetails> detailsToCrete = formOrder.ordersDetails.Where(x => x.orderDetails_id == 0);


            foreach (var ordersDetail in detailsTodelete)
            {
                database.Repository<OrdersDetails>().DeleteEntity(ordersDetail.orderDetails_id);
            }
            
            foreach (OrdersDetails ordersDetail in detailsToCrete)
            {
                database.Repository<OrdersDetails>().CreateEntity(ordersDetail);
            }

            foreach (OrdersDetails ordersDetail in formOrder.ordersDetails)
            {
                if (detailsTodelete.Contains(ordersDetail) || detailsToCrete.Contains(ordersDetail))
                    continue;
                
                database.Repository<OrdersDetails>().EditEntity(ordersDetail);
            }
        }

        public DTOOrderEdit GetOrder(int order_id)
        {
            string sql = EmbeddedResourceManager.GetString(typeof(OrderService), SQLPath.DTOOrderEdit);

            SqlMapper.GridReader result = dbConnection.QueryMultiple(sql, new {@order_id = order_id});

            DTOOrderEdit fullOrder = new DTOOrderEdit
            {
                order = result.Read<Orders>().FirstOrDefault(),
                ordersDetails = result.Read<OrdersDetails>().ToArray()
            };

            return fullOrder;
        }


        /// <summary>
        /// Оформление заказа
        /// </summary>
        /// <param name="formOrder"></param>
        /// <returns></returns>
        public int SaveOrder(DTOOrderEdit formOrder, string url)
        {
            var repOrders = database.Repository<Orders>();
            var repOrdersDetails = database.Repository<OrdersDetails>();

            repOrders.CreateEntity(formOrder.order);

            foreach (var item in formOrder.ordersDetails)
            {
                item.order_id = formOrder.order.order_id;
                repOrdersDetails.CreateEntity(item);
            }

            SendEmailToAdmin(formOrder.order.order_id, url);

            return formOrder.order.order_id;
        }

        /// <summary>
        /// Для формы с оформлением заказа
        /// </summary>
        /// <returns></returns>
        public SelectLists GetSelectLists()
        {
            string sql = EmbeddedResourceManager.GetString(typeof(OrderService), SQLPath.DTOCustomerForm);

            SqlMapper.GridReader result = dbConnection.QueryMultiple(sql);

            return new SelectLists
            {
                paymentMethods = result.Read<PaymentMethods>().ToArray(),
                deliveryMethods = result.Read<DeliveryMethods>().ToArray(),
                citiesServed = result.Read<CitiesServed>().ToArray(),
            };
        }

        /// <summary>
        /// Для страницы с заказми
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DTOOrder> GetDTOOrder()
        {
            string sql = EmbeddedResourceManager.GetString(typeof(OrderService), SQLPath.DTOOrderList);

            var orders = database.ExucuteQuery<DTOOrder>(sql);

            return orders;
        }

        private void SendEmailToAdmin(int order_id, string url)
        {
            string sql = EmbeddedResourceManager.GetString(typeof(OrderService), SQLPath.DTOOrderByID);

            DTOOrder order = database.ExucuteQuery<DTOOrder>(sql, new {@order_id = order_id}).FirstOrDefault();

            string messageBody = $"Статус заказа {order.orderstate_title}." +
                                 Environment.NewLine +
                                 $"Способ оплаты: {order.payment_title}" +
                                 Environment.NewLine +
                                 $"Способ доставки: {order.delivery_title}" +
                                 Environment.NewLine +
                                 $"Адресс доставки: {order.deliveryAddress}" +
                                 Environment.NewLine +
                                 $"Город: {order.city_title}" +
                                 Environment.NewLine +
                                 $"Номер телефона: {order.phoneNumber}" +
                                 Environment.NewLine +
                                 $"Сумма: {order.sum_price}" +
                                 Environment.NewLine +
                                 $"Редактирование заказа {url}#/Orders/Edit/{order_id}";

            string messageSubject = $"Создан заказ. №: {order_id}.";

            mailHandler.SendToYourSelf(messageSubject, messageBody);
        }

        private Orders CreateOrder(DTOFormOrder formOrder)
        {
            return new Orders
            {
                fio = formOrder.fio,
                phoneNumber = formOrder.phoneNumber,
                payment_id = formOrder.payment_id,
                city_id = formOrder.city_id,
                delivery_id = formOrder.delivery_id,
                deliveryAddress = formOrder.deliveryAddress,
                comment = formOrder.comment,
                device = formOrder.device,
                orderdatetime = DateTime.Now,
                orderstate = (int) OrderState.InProcessing
            };
        }

        private OrdersDetails[] GetOrdersDetails(DTOFormOrder formOrder, int order_id)
        {
            OrdersDetails[] result = new OrdersDetails[formOrder.ordersDetails.Length];

            for (int i = 0; i < formOrder.ordersDetails.Length; i++)
            {
                result[i] = new OrdersDetails
                {
                    product_id = formOrder.ordersDetails[i].product_id,
                    price = formOrder.ordersDetails[i].price,
                    quantity = formOrder.ordersDetails[i].quantity,
                    order_id = order_id
                };
            }

            return result;
        }
    }
}
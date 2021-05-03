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
        private readonly MailHandler mailHandler;
        private readonly IDataBase database;
        readonly IDbConnection dbConnection;
        public OrderService(IDataBase database, MailHandler mailHandler, IDbConnection dbConnection)
        {
            this.database = database;
            this.mailHandler = mailHandler;
            this.dbConnection = dbConnection;
        }

        public int SaveOrder(DTOFormOrder formOrder)
        {
            var repOrders = database.Repository<Orders>();
            var repOrdersDetails = database.Repository<OrdersDetails>();

            Orders order = CreateOrder(formOrder);

            repOrders.CreateEntity(order);

            OrdersDetails[] ordersDetails = GetOrdersDetails(formOrder, order.order_id);

            for (int i = 0; i < ordersDetails.Length; i++)
            {
                repOrdersDetails.CreateEntity(ordersDetails[i]);
            }

            SendEmailToAdmin(order.order_id);

            return order.order_id;
        }

        public CustomerForm GetCustomerForm()
        {
            string sql = EmbeddedResourceManager.GetString(typeof(OrderService), SQLPath.DTOCustomerForm);
            
            SqlMapper.GridReader result = dbConnection.QueryMultiple(sql);

            var test = new  CustomerForm
            {
                paymentMethods = result.Read<PaymentMethods>().ToArray(),
                deliveryMethods = result.Read<DeliveryMethods>().ToArray(),
                citiesServed = result.Read<CitiesServed>().ToArray(),
                
            };

            return test;
        }

        public IEnumerable<DTOOrder> GetDTOOrder()
        {
            string sql = EmbeddedResourceManager.GetString(typeof(OrderService), SQLPath.DTOOrderList);

            var orders = database.ExucuteQuery<DTOOrder>(sql);

            return orders;
        }
        private void SendEmailToAdmin(int order_id)
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
                                 $"Сумма: {order.sum_price}";

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
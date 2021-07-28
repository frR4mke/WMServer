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

        public void UpdateOrder(DTOOrderEdit formOrder)
        {
            database.Repository<Orders>().EditEntity(formOrder.order);

            string sql = @"select * from OrdersDetails where order_id = @order_id";

            IEnumerable<OrdersDetails> currentDetails = dbConnection.Query<OrdersDetails>(sql, new {@order_id = formOrder.order.order_id});

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
                orderStates = result.Read<OrderStates>().ToArray(),
                paymentType = result.Read<PaymentType>().ToArray()  
            };
        }

        /// <summary>
        /// Для страницы с заказми
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DTOOrder> GetDTOOrder()
        {
            string sql = EmbeddedResourceManager.GetString(typeof(OrderService), SQLPath.DTOOrderList);

            var orders = dbConnection.Query<DTOOrder>(sql);

            return orders;
        }

        private void SendEmailToAdmin(int order_id, string url)
        {
            string sql = EmbeddedResourceManager.GetString(typeof(OrderService), SQLPath.DTOMAIL);

            SqlMapper.GridReader result = dbConnection.QueryMultiple(sql, new {@order_id = order_id});

            DTOOrder order = result.Read<DTOOrder>().FirstOrDefault();

            DTOOrderDetails[] orderDetails = result.Read<DTOOrderDetails>().ToArray();

            StringBuilder sb = new StringBuilder();

            sb.AppendLine($"Статус заказа {order.orderstate_title}. ");
            sb.AppendLine($"Способ оплаты: {order.payment_title}. ");
            sb.AppendLine($"Способ доставки: {order.delivery_title}. ");
            sb.AppendLine($"Адресс доставки: {order.deliveryAddress}. ");
            sb.AppendLine($"Город: {order.city_title}. ");
            sb.AppendLine($"Номер телефона: {order.phoneNumber}. ");
            sb.AppendLine($"Имя: {order.fio}. ");
            sb.AppendLine($"Сумма: {order.sum_price}.");
            sb.AppendLine($"Редактирование заказа {url}#/Orders/Edit/{order_id}");
            sb.AppendLine($"Детализация: ");

            for (int i = 0; i < orderDetails.Length; i++)
            {
                sb.AppendLine($"{i+1}) " +
                              $"Наименование: {orderDetails[i].product_title}, " +
                              $"Опция: {orderDetails[i].productOptions_title}, " +
                              $"Кол-во: {orderDetails[i].quantity}, " +
                              $"Цена/шт: {orderDetails[i].price}," +
                              $"Итого: {orderDetails[i].quantity * orderDetails[i].price} ");
            }

            string messageSubject = $"Создан заказ. №: {order_id}.";

            mailHandler.SendToYourSelf(messageSubject, sb.ToString());
        }
    }
}
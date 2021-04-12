using NDapper.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using WMBLogic.Models.DB;
using WMBLogic.Models.DTO;
using WMBLogic.Repositories;
using WMBLogic.Repositories._Products;

namespace WMBLogic.Services
{
	public class OrderService
	{
		readonly IDapperRepository<Orders> orderRepository;
		readonly IDapperRepository<OrdersDetails> ordersDetailsRepository;

		public OrderService(IDapperRepository<Orders> orderRepository, IDapperRepository<OrdersDetails> ordersDetailsRepository)
		{
			this.orderRepository = orderRepository;
			this.ordersDetailsRepository = ordersDetailsRepository;
		}

		public void SaveOrder(DTOOrder _order)
		{
			Orders order = GetOrder(_order);

			orderRepository.CreateEntity(order);

			OrdersDetails[] ordersDetails = GetOrdersDetails(_order, order.order_id);

			for (int i = 0; i < ordersDetails.Length; i++)
			{
				ordersDetailsRepository.CreateEntity(ordersDetails[i]);
			}

		}
		private Orders GetOrder(DTOOrder order)
		{
			return new Orders {
				fio = order.fio,
				phoneNumber = order.phoneNumber,
				payment = order.payment,
				city = order.city,
				delivery = order.delivery,
				deliveryAddress = order.deliveryAddress,
				comment = order.comment
			};
		}
		private OrdersDetails[] GetOrdersDetails(DTOOrder order, int order_id)
		{
			OrdersDetails[] result = new OrdersDetails[order.ordersDetails.Length];

			for (int i = 0; i < order.ordersDetails.Length; i++)
			{
				result[i] = new OrdersDetails {
					product_id = order.ordersDetails[i].product_id,
					price = order.ordersDetails[i].price,
					quantity = order.ordersDetails[i].quantity,
					order_id = order_id

				};
			}

			return result;
		}
	}
}

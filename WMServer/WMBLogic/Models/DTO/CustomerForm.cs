﻿using WMBLogic.Models.DB;

namespace WMBLogic.Models.DTO
{
    public class CustomerForm
    {
        public PaymentMethods[] paymentMethods { get; set; }

        public DeliveryMethods[] deliveryMethods { get; set; }

        public CitiesServed[] citiesServed { get; set; }
    }
}
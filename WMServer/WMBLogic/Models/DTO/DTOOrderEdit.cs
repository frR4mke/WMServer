using WMBLogic.Models.DB;

namespace WMBLogic.Models.DTO
{
    public class DTOOrderEdit
    {
        public Orders order { get; set; }

        public OrdersDetails[] ordersDetails { get; set; }
    }
}
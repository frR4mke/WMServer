// using System;
// using System.Collections.Generic;
// using System.Text;
// using WMBLogic.Models.INTERFACES;
// using System.Linq;
//
// namespace WMBLogic.Filter
// {
//     public class FilterHandler
//     {
//         IBaseFilter[] filtres;
//
//         public FilterHandler(params IBaseFilter[] filtres)
//         {
//             this.filtres = new IBaseFilter[filtres.Length];
//
//             for (int i = 0; i < filtres.Length; i++)
//             {
//                 this.filtres[i] = filtres[i];
//             }
//         }
//
//         public void ApplyFiltres(IEnumerable<IBaseProduct> product)
//         {
//             foreach (var filter in filtres)
//             {
//                 var _filter = filter as IHeatingFloorFilter;
//                 var _product = product as IEnumerable<IHeatingFloorProduct>;
//
//                 if (_filter != null && _product != null)
//                 {
//                     product = _product.Where(x =>
//                         x.power >= (_filter.power_min ?? decimal.MinValue) &&
//                         x.power <= (_filter.power_max ?? decimal.MaxValue) &&
//                         x.price >= (_filter.price_max ?? decimal.MinValue) &&
//                         x.price <= (_filter.power_max ?? decimal.MaxValue) &&
//                         x.layingArea >= (_filter.layingArea_min ?? decimal.MinValue) &&
//                         x.layingArea <= (_filter.layingArea_max ?? decimal.MaxValue));
//                 }
//             }
//         }
//     }
// }


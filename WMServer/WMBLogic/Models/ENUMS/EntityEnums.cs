using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace WMBLogic.Models.ENUMS
{
    public enum ProductType
    {
        [Description("Теплный пол")]
        HeatingFloor = 1,

        [Description("Терморегуляторы")]
        Thermostats = 2,

        [Description("Обогрев кровли и водостоков")]
        HeatingRoofs = 3,

        [Description("Обогрев открытых площадок ")]
        HeatingAreas = 4,

        [Description("Обогрев труб и канализаций ")]
        HeatingPipes = 5
    }

    public enum SubProductType
    {
        [Description("Теплый пол под плитку в плиточный клей")]
        HeatedFloorUnderTiles = 1,

        [Description("Теплый пол в бетонную стяжку")]
        HeatedFloorScreed = 2,

        [Description("Теплый пол под ламинат и паркетную")]
        HeatedFloorUnderLaminate = 3
    }

    public enum OrderState
    {
        [Description("В обработке")]
        InProcessing = 1,

        [Description("Подтвержден")]
        Confirmed = 2,

        [Description("Доставлен и оплачен")]
        DeliveredAndPaid = 3
    }
}
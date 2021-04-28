using NDapper.Interfaces;
using System.Collections.Generic;
using System.Linq;
using WMBLogic.Models.DB;
using WMBLogic.Models.DTO;
using System;
using System.Data;
using WMBLogic.Models.ENUMS;
using Extensions;
using WMBLogic.Embedded;
using WMBLogic.Models.FILTRES;
using WMBLogic.Models.INTERFACES;
using DapperQueryBuilder;
using NDapper;
using Filter = WMBLogic.Models.FILTRES.Filter;

namespace WMBLogic.Services
{
    public class HeatingFloorService
    {
        readonly FilterService filterService;
        readonly IDataBase database;
        private readonly IDbConnection dbConnection;

        public HeatingFloorService(FilterService filterService, IDataBase database, IDbConnection dbConnection)
        {
            this.filterService = filterService;
            this.database = database;
            this.dbConnection = dbConnection;
        }

        

       
    }
}
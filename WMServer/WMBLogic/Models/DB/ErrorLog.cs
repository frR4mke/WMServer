using System;
using System.ComponentModel.DataAnnotations;

namespace WMBLogic.Models.DB
{
    public class ErrorLog
    {
        [Key]
        public int error_id { get; set; }

        public DateTime eventdatetime { get; set; }

        public string stacktrace { get; set; }

        public string message { get; set; }

        public string source { get; set; }

        public string errordescription { get; set; }

    }
}
using System;
using System.Data;
using Dapper;

namespace ErrorLogger
{
    public class ErrorLogger
    {
        readonly IDbConnection dbConnection;

        public ErrorLogger(IDbConnection dbConnection)
        {
            this.dbConnection = dbConnection;
        }

        public int LogError(Exception exception, string errorDescription)
        {
            ErrorLog error = new ErrorLog
            {
                eventdatetime = DateTime.Now, 
                stacktrace = exception.StackTrace, 
                message = exception.Message, 
                errordescription = errorDescription, 
                source = exception.Source
            };

            string sql = @"insert into ErrorLog values(@eventdatetime,@stacktrace,@message,@errordescription,@source) SELECT CAST(SCOPE_IDENTITY() as int)";

            int insertedId = dbConnection.QuerySingle<int>(sql,
                new {eventdatetime = error.eventdatetime, stacktrace = error.stacktrace, message = error.message, errordescription = error.errordescription, source = error.source});

            error.error_id = insertedId;

            return insertedId;
        }
    }

    public class ErrorLog
    {
        public int error_id { get; set; }

        public DateTime eventdatetime { get; set; }

        public string stacktrace { get; set; }

        public string message { get; set; }

        public string source { get; set; }

        public string errordescription { get; set; }

    }
}
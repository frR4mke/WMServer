using System;
using WMBLogic.Models.DB;

namespace WMBLogic.Services
{
    public class ErrorLogger
    {
        private readonly DBContext _dbContext;

        public ErrorLogger(DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public void LogError(Exception exception, string errorDescription)
        {
            ErrorLog error = new ErrorLog
            {
                eventdatetime = DateTime.Now,
                stacktrace = exception.StackTrace,
                message = exception.Message,
                errordescription = errorDescription,
                source = exception.Source
            };

            _dbContext.ErrorLog.Add(error);
            _dbContext.SaveChanges();
        }
    }
}
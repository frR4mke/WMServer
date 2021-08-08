using System;
using Mail;
using WMBLogic.Models.DB;

namespace WMBLogic.Services
{
    public class ErrorLogger
    {
        private readonly DBContext _dbContext;
        private readonly MailHandler _mailHandler;

        public ErrorLogger(DBContext dbContext, MailHandler mailHandler)
        {
            _dbContext = dbContext;
            _mailHandler = mailHandler;
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

            SendErrorMessage(errorDescription, error.error_id);
        }

        private void SendErrorMessage(string errorDescription, int errorId)
        {
            _mailHandler.SendToYourSelf(subject: "Зафиксирована ошибка", text: $"{errorDescription} (ID = {errorId})");
        }
    }
}
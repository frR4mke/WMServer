using Microsoft.Extensions.Options;
using System;
using System.Net.Mail;

namespace Mail
{
	public class MailHandler
	{
		private readonly IMailHandler handler;
		private readonly IOptions<MailCredentials> credentials;
		private readonly ErrorLogger.ErrorLogger errorLogger;
		public MailHandler(IMailHandler handler, IOptions<MailCredentials> credentials, ErrorLogger.ErrorLogger errorLogger)
		{
			this.handler = handler;
			this.credentials = credentials;
			this.errorLogger = errorLogger;
		}

		public void SendToYourSelf(string subject, string text)
		{
			MailCredentials _cre = credentials.Value;
			
			try
			{
				handler.SendFromTo("Система оповещения",_cre.Address, _cre.Address, subject, text,_cre.Password);
			}
			catch (Exception e)
			{
				errorLogger.LogError(e, "Ошибка отправления письма, при регистрации заказа");
				throw e;
			}
		}
		public void SendFromTo(string toAdress, string subject, string text)
		{
			MailCredentials _cre = credentials.Value;
			
			try
			{
				handler.SendFromTo("Система оповещения",_cre.Address, toAdress, subject, text,_cre.Password);
			}
			catch (Exception e)
			{
				errorLogger.LogError(e, "Ошибка отправления письма, при регистрации заказа");
				throw e;
			}
		}
		
	}	
}

using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Mail
{
    public class NetMail : IMailHandler
    {
        public void SendFromTo(string senderName, string fromAdress, string toAdress, string subject, string text, string credentials)
        {
            MailAddress from = new MailAddress(fromAdress, senderName);

            MailAddress to = new MailAddress(toAdress);

            MailMessage m = new MailMessage(from, to)
            {
                Subject = subject,
                Body = text
            };
            
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            
            smtp.Credentials = new NetworkCredential(fromAdress, credentials);
            smtp.EnableSsl = true;
            smtp.Send(m);
        }
    }
}
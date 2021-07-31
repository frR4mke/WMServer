﻿using Microsoft.Extensions.Options;
using System;
using System.Net.Mail;

namespace Mail
{
    public class MailHandler
    {
        private readonly IMailHandler handler;
        private readonly IOptions<MailCredentials> credentials;

        public MailHandler(IMailHandler handler, IOptions<MailCredentials> credentials)
        {
            this.handler = handler;
            this.credentials = credentials;
        }

        public void SendToYourSelf(string subject, string text)
        {
            MailCredentials _cre = credentials.Value;


            handler.SendFromTo("Система оповещения", _cre.Address, _cre.Address, subject, text, _cre.Password);
        }

        public void SendFromTo(string toAdress, string subject, string text)
        {
            MailCredentials _cre = credentials.Value;

            handler.SendFromTo("Система оповещения", _cre.Address, toAdress, subject, text, _cre.Password);
        }
    }
}
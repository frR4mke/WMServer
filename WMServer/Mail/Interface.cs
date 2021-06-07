using System;
using System.Collections.Generic;
using System.Text;

namespace Mail
{
    public interface IMailHandler
    {
        void SendFromTo(string senderName, string fromAdress, string toAdress, string subject, string text, string credentials);
    }
}
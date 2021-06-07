using System;
using System.Collections.Generic;
using System.Text;
using WMBLogic.Models.DB;

namespace WMBLogic.Models.INTERFACES
{
    public interface IUserService
    {
        User Login(User oUser);

        string GenerateToken(User oUser);
    }
}
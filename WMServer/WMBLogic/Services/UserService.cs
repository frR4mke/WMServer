using System;
using System.Collections.Generic;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using Dapper;
using Microsoft.IdentityModel.Tokens;
using NDapper.Interfaces;
using WMBLogic.Models.DB;
using WMBLogic.Models.INTERFACES;

namespace WMBLogic.Services
{
    public class UserService : IUserService
    {
        readonly IDbConnection dbConnection;
        readonly IDataBase database;

        public UserService(IDataBase database, IDbConnection dbConnection)
        {
            this.database = database;
            this.dbConnection = dbConnection;
        }

        public User Login(User oUser)
        {
            User user = GetUser(oUser.username);

            bool isValidPassword = BCrypt.Net.BCrypt.Verify(oUser.password, user.password);

            return isValidPassword ? user : null;
        }

        public string GenerateToken(User oUser)
        {
            AuthOption authOpt = database.Repository<AuthOption>().GetTable().FirstOrDefault();

            var securityKey = authOpt.GetSymmetricSecurityKey();

            var cre = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>()
            {
                new Claim(JwtRegisteredClaimNames.NameId, oUser.username),
                new Claim(JwtRegisteredClaimNames.Sub, Guid.NewGuid().ToString())
            };
            var token = new JwtSecurityToken(authOpt.issuer,
                authOpt.audience,
                claims,
                expires: DateTime.Now.AddSeconds(authOpt.tokenLifetime),
                signingCredentials: cre);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private User GetUser(string username)
        {
            return dbConnection.Query<User>("select * from Users where username = @username", new {@username = username}).FirstOrDefault();
        }
    }
}
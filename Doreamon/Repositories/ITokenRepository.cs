using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Doreamon.Data;
using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface ITokenRepository
    {
        public Task<string> CreateToken(UserModel user);
    }
}
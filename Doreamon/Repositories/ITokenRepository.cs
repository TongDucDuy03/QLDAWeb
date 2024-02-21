using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Doreamon.Data;

namespace Doreamon.Repositories
{
    public interface ITokenRepository
    {
        public Task<string> CreateToken(User user);

    }
}
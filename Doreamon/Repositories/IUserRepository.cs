using Doreamon.Data;
using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface IUserRepository
    {
        public Task<UserModel> GetUserByUserNameAsync(string username);
        public Task<bool> UserExistAsync(string username);
        public Task<UserModel> AddUserAsync(RegisterModel registerModel);
    }
}

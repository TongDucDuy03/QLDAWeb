using Doreamon.Data;
using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface IUserRepository
    {
        public Task<User> GetUserByUserNameAsync(string username);
        public Task<bool> UserExistAsync(string username);
        public Task<UserModel> AddUserAsync(User user);
    }
}

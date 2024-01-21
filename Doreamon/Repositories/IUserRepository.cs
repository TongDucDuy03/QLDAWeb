using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface IUserRepository
    {
        public Task<UserModel> GetUserByUserNameAsync(LoginModel model);
    }
}

using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.DotNet.Scaffolding.Shared.Messaging;
using Microsoft.EntityFrameworkCore;

namespace Doreamon.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly DoreamonWebContext _context;
        private readonly IMapper _mapper;

        public UserRepository(DoreamonWebContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<User> GetUserByUserNameAsync(string username)
        {
            var user = await _context.User.SingleOrDefaultAsync(m => m.UserName == username);
            return user;
        }

        public async Task<bool> UserExistAsync(string username)
        {
            return await _context.User.AnyAsync(x => x.UserName == username.ToLower()); 
        }

        public async Task<UserModel> AddUserAsync(User user)
        {
            _context.User.Add(user);
            await _context.SaveChangesAsync();
            return _mapper.Map<UserModel>(user);
        }
    }
}

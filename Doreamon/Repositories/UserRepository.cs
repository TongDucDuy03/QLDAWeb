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
        public async Task<UserModel> GetUserByUserNameAsync(string username)
        {
            var user = await _context.User.SingleOrDefaultAsync(m => m.UserName == username);
            return _mapper.Map<UserModel>(user);
        }
        public async Task<UserModel> GetUserByUserIdAsync(int userId)
        {
            var user = await _context.User.SingleOrDefaultAsync(m => m.UserId == userId);
            return _mapper.Map<UserModel>(user);
        }

        public async Task<bool> UserExistAsync(string username)
        {
            return await _context.User.AnyAsync(x => x.UserName == username.ToLower()); 
        }

        public async Task<UserModel> AddUserAsync(RegisterModel registerModel)
        {
            var user = new User{
                    UserName = registerModel.UserName.ToLower(),
                    Password = registerModel.Password
            };

            _context.User.Add(user);
            await _context.SaveChangesAsync();
            
            return _mapper.Map<UserModel>(user);
        }
    }
}

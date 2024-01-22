﻿using AutoMapper;
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

        public async Task<UserModel> GetUserByUserNameAsync(LoginModel model)
        {
            var user = await _context.User.FirstOrDefaultAsync(m => m.UserName == model.UserName && m.Password == model.Password);
            return _mapper.Map<UserModel>(user); 
        }
    }
}
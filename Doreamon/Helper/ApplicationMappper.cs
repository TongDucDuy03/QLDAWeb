using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;

namespace Doreamon.Helper
{
    public class ApplicationMappper:Profile
    {
        public ApplicationMappper() 
        { 
            CreateMap<Products,ProductsModel>().ReverseMap();
        }
    }
}

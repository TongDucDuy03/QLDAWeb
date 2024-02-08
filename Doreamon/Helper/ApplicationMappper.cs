using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;

namespace Doreamon.Helper
{
    public class ApplicationMappper:Profile
    {
        public ApplicationMappper() 
        { 
            CreateMap<Products,ProductsModel>().PreserveReferences().ReverseMap();
            CreateMap<Cart, CartModel>().PreserveReferences().ReverseMap();
            CreateMap<User, UserModel>().ReverseMap();
            CreateMap<Series, SeriesModel>().ReverseMap();
        }
    }
}

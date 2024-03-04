﻿using AutoMapper;
using Doreamon.Models;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Doreamon.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        private ICartRepository _cartRepo;

        public CartController(ICartRepository repo)
        {
            _cartRepo = repo;
        }

        [HttpPost]
        public async Task<IActionResult> AddToCart(int id, int userId, bool increaseQuantity)
        {
            var cart = await _cartRepo.AddToCart(userId, id, increaseQuantity);
            return Ok(cart);
        }

        [HttpDelete("DeleteCartProduct")]
        public async Task<IActionResult> DeleteCartProduct(int UserId, int ProductId){
            var cart = await _cartRepo.DeleteCartProduct(UserId, ProductId);
            return Ok(cart);
        }

        [HttpDelete("DeleteAllCartProduct")]
        public async Task<IActionResult> DeleteAllCartProduct(int UserId){
            var cart = await _cartRepo.DeleteAllCartProduct(UserId);
            return Ok(cart);
        }

        [HttpGet("cart/{userId}")]
        public async Task<IActionResult> GetCartProducts(int userId)
        {
            var cartProducts = await _cartRepo.GetCartProducts(userId);
            double cartTotal = 0;

            foreach (CartModel cartProduct in cartProducts)
            {
                cartTotal += cartProduct.Products.Price;
            }

            return cartProducts == null ? NotFound() : Ok(new {
                CartTotal = cartTotal,
                CartProductList = cartProducts
            });
        }
    }
}

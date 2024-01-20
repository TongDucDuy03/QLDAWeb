﻿using AutoMapper;
using Doreamon.Models;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Doreamon.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private IProductRepository _productRepo;
        private IMapper _mapper;

        public ProductController(IProductRepository repo, IMapper mapper) 
        {
            _productRepo = repo;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetAllProducts()
        {
            try
            {
                return Ok(await _productRepo.getAllProductsAsync());
            }
            catch 
            {
                return BadRequest();
            }
        }
        [HttpGet("series/{seriesId}")]
        public async Task<IActionResult> GetProductsBySeriesId(int seriesId)
        {
            var products = await _productRepo.getProductsBySeriesIdAsync(seriesId);
            return products == null ? NotFound() : Ok(products);
        }

        [HttpGet("{productId}")]
        public async Task<IActionResult> GetProductById(int productId)
        {
            var product = await _productRepo.getProductByIdAsync(productId);

            if (product == null)
            {
                return NotFound();
            }

            var productModel = _mapper.Map<ProductsModel>(product);

            return Ok(productModel);
        }


        [HttpPost]
        public async Task<IActionResult> addToCart(int Id, int UserId)
        {

            var check = await _productRepo.addToCart(UserId, Id);
            return Ok(check);
        }
            
    }
}

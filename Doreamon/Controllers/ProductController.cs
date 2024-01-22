using AutoMapper;
using Doreamon.Data;
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

        public ProductController(IProductRepository repo) 
        {
            _productRepo = repo;
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

        [HttpGet("{productId}", Name = "GetProductsById")]
        public async Task<IActionResult> GetProductsById(int productId)
        {
            var product = await _productRepo.getProductsById(productId);

            if (product == null)
            {
                return NotFound();
            }
            return product == null ? NotFound() : Ok(product);
        }
        [HttpGet("search/{productName}", Name = "searchProductsByName")]
        public async Task<IActionResult> searchProductsByName(string productName)
        {
            var productList = await _productRepo.searchProductsByNameAsync(productName);

            if (productList == null)
            {
                return NotFound();
            }

            return Ok(productList);
        }



    }
}

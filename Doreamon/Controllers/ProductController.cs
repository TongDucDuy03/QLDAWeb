using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Doreamon.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private IProductRepository _productRepo;
        private ISeriesRepository _seriesRepo;

        public ProductController(IProductRepository repo, ISeriesRepository seriesRepo) 
        {
            _productRepo = repo;
            _seriesRepo = seriesRepo;
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
            
            var products =  
                (from item in _productRepo.getProductsBySeriesIdAsync(seriesId).Result
                select new
                {
                    Id = item.Id,
                    Name = item.Name,
                    Description = item.Description,
                    Quantity = item.Quantity,
                    Price = item.Price,
                    DiscountPrice = item.DiscountPrice,
                    ImagesUrl = item.ImagesUrl,
                    Status = item.Status,
                    CreatedAt = item.CreatedAt,
                    UpdatedAt = item.UpdatedAt,
                    SeriesId = item.Series_Id,
                    SeriesName = _seriesRepo.GetSeriesBySeriesIdAsync(item.Series_Id).Result.Series_Name,
                });
            
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

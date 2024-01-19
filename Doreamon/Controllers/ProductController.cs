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
        [HttpGet("{seriesId}")]
        public async Task<IActionResult> GetProductsBySeriesId(int seriesId)
        {
            var products = await _productRepo.getProductsBySeriesIdAsync(seriesId);
            return products == null ? NotFound() : Ok(products);
        }
        [HttpPost]
        public async Task<IActionResult> addToCart(int Id, int UserId)
        {

            var check = await _productRepo.addToCart(UserId, Id);
            return Ok(check);
        }
            
    }
}

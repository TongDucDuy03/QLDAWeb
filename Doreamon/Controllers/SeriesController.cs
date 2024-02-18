using Doreamon.Data;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Doreamon.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SeriesController : ControllerBase
    {
        private ISeriesRepository _seriesRepo;

        public SeriesController(ISeriesRepository repo)
        {
            _seriesRepo = repo;
        }
        [HttpGet]
        public async Task<IActionResult> GetAllSeries()
        {
            try
            {
                return Ok(await _seriesRepo.GetAllSeriesAsync());
            }
            catch
            {
                return BadRequest();
            }
        }

        [HttpGet("{seriesId}")]
        public async Task<IActionResult> GetSeriesBySeriesId(int seriesId)
        {
            try
            {
                var series = await _seriesRepo.GetSeriesBySeriesIdAsync(seriesId);

                return series == null ? NotFound() : Ok(series);
            }
            catch
            {
                return BadRequest();
            }
        }
    }
}

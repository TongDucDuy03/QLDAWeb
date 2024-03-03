using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Doreamon.Models;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Doreamon.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MomoController : ControllerBase
    {
        private IMomoRepository _momoRepo;

        public MomoController(IMomoRepository momoRepo)
        {
            _momoRepo = momoRepo;
        }

        [HttpPost("CreatePaymentUrl")]
        public async Task<IActionResult> CreatePaymentUrl(OrderInfoModel model)
        {
            try
            {
                var response = await _momoRepo.CreatePaymentAsync(model);
                return Ok(response);
            }
            catch
            {
                return BadRequest();
            }
        }

        [HttpGet("PaymentCallBack")]
        public async Task<IActionResult> PaymentCallBack()
        {
            var response = _momoRepo.PaymentExecuteAsync(HttpContext.Request.Query);
            return Ok(response);
        }
    }
}
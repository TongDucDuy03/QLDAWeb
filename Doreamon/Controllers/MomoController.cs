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
                return Ok(response.PayUrl);
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

/*
SO THE: 9704 0000 0000 0018
TEN CHU THE: NGUYEN VAN A
NGAY PHAT HANH: 03/07
OTP: OTP
*/
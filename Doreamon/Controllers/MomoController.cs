using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Doreamon.Models;
using Doreamon.Models.Momo;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Doreamon.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MomoController : ControllerBase
    {
        private IMomoRepository _momoRepo;
        private IOrderRepository _orderRepo;
        public MomoController(IMomoRepository momoRepo, IOrderRepository orderRepo)
        {
            _momoRepo = momoRepo;
            _orderRepo = orderRepo;
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

        [HttpPost("MomoIpn")]
        public async Task<IActionResult> MomoIpn([FromBody]MomoReturnModel momoReturnModel)
        {
            try
            {
                var checkSignature = _momoRepo.IsValidateSignature(momoReturnModel);

                if (checkSignature)
                {
                    var checkResult = await _orderRepo.UpdateOrderStatusAsync(Convert.ToInt32(momoReturnModel.orderId));

                    if (checkResult) return Ok(new
                    {
                        message = "Successful"
                    });
                    else return Ok(new
                    {
                        checkSignature = checkSignature,
                        signature = momoReturnModel.signature,
                        message = "Update status failed"
                    });
                }
                else return Ok(new
                {
                    checkSignature = checkSignature,
                    signature = momoReturnModel.signature,
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}

/*
SO THE: 9704 0000 0000 0018
TEN CHU THE: NGUYEN VAN A
NGAY PHAT HANH: 03/07
OTP: OTP
*/




//response result
/*
partnerCode=MOMO
&orderId=638452394664998760
&requestId=638452394664998760
&amount=44000
&orderInfo=Khách+hàng%3A+2.+Nội+dung%3A+Thanh+toán+cho+đơn+hàng+
&orderType=momo_wallet
&transId=3996343841
&resultCode=0
&message=Successful.
&payType=napas
&responseTime=1709642729336
&extraData=
&signature=4fe639c5f810f56094a943a8934b9e44a443608166718433e5ac87f30a556d61
*/
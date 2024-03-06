using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;
using Doreamon.Helper;
using Doreamon.Models;
using Doreamon.Models.Momo;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using RestSharp;

namespace Doreamon.Repositories
{
    public class MomoRepository : IMomoRepository
    {
        private readonly IOptions<MomoOptionModel> _options;

        public MomoRepository(IOptions<MomoOptionModel> options)
        {
            _options = options;
        }

        public async Task<MomoCreatePaymentResponseModel> CreatePaymentAsync(OrderInfoModel model)
        {
            model.OrderInfo = "Khách hàng: " + model.FullName + ". Nội dung: " + model.OrderInfo;
            var rawData =
                $"accessKey={_options.Value.AccessKey}&amount={model.Amount}&extraData=&ipnUrl={_options.Value.IpnUrl}&orderId={model.OrderId}&orderInfo={model.OrderInfo}&partnerCode={_options.Value.PartnerCode}&redirectUrl={_options.Value.RedirectUrl}&requestId={model.OrderId}&requestType={_options.Value.RequestType}";

            var signature = HashHelper.HmacSHA256(rawData, _options.Value.SecretKey);

            var client = new RestClient(_options.Value.MomoApiUrl);
            var request = new RestRequest() { Method = Method.Post };
            request.AddHeader("Content-Type", "application/json; charset=UTF-8");

            // Create an object representing the request data
            var requestData = new
            {
                accessKey = _options.Value.AccessKey,
                partnerCode = _options.Value.PartnerCode,
                requestType = _options.Value.RequestType,
                ipnUrl = _options.Value.IpnUrl,
                redirectUrl = _options.Value.RedirectUrl,
                orderId = model.OrderId,
                amount = model.Amount.ToString(),
                orderInfo = model.OrderInfo,
                requestId = model.OrderId,
                extraData = "",
                lang = "vi",
                signature = signature
            };

            request.AddParameter("application/json", JsonConvert.SerializeObject(requestData), ParameterType.RequestBody);

            var response = await client.ExecuteAsync(request);

            return JsonConvert.DeserializeObject<MomoCreatePaymentResponseModel>(response.Content);
        }

        public MomoExecuteResponseModel PaymentExecuteAsync(IQueryCollection collection)
        {
            var amount = collection.First(s => s.Key == "amount").Value;
            var orderInfo = collection.First(s => s.Key == "orderInfo").Value;
            var orderId = collection.First(s => s.Key == "orderId").Value;
            return new MomoExecuteResponseModel()
            {
                Amount = amount,
                OrderId = orderId,
                OrderInfo = orderInfo
            };
        }

        public bool IsValidateSignature(MomoReturnModel momoReturnModel)
        {
            var rawData =
                $"accessKey={_options.Value.AccessKey}&amount={momoReturnModel.amount}&extraData={momoReturnModel.extraData}&message={momoReturnModel.message}&orderId={momoReturnModel.orderId}&orderInfo={momoReturnModel.orderInfo}&orderType={momoReturnModel.orderType}&partnerCode={momoReturnModel.partnerCode}&payType={momoReturnModel.payType}&requestId={momoReturnModel.requestId}&responseTime={momoReturnModel.responseTime}&resultCode={momoReturnModel.resultCode}&transId={momoReturnModel.transId}";
            
            var createSignature = HashHelper.HmacSHA256(rawData, _options.Value.SecretKey);

            if(momoReturnModel.signature == createSignature) return true;
            else return false;
        }
    }
}


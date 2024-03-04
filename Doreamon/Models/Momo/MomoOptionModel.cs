using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Doreamon.Models.Momo
{
    public class MomoOptionModel
    {
        public string MomoApiUrl { get; set; }
        public string SecretKey { get; set; }
        public string AccessKey { get; set; }
        public string RedirectUrl { get; set; }
        public string IpnUrl { get; set; }
        public string PartnerCode { get; set; }
        public string RequestType { get; set; }
    }
}
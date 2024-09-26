using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn_Demo
{
    public partial class QuenMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
        {
            //string originalData = e.Message.Body;

            //// Thực hiện mã hóa lại dữ liệu ở đây, ví dụ mã hóa bằng Base64
            //byte[] dataBytes = Encoding.UTF8.GetBytes(originalData);
            //string encodedData = Convert.ToBase64String(dataBytes);

            //// Gán dữ liệu đã mã hóa lại cho email body
            //e.Message.Body = encodedData;
        }
    }
}
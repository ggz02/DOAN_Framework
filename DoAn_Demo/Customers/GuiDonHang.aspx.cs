using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DoAn_Demo
{
    public partial class GuiDonHang : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox txtHoTen = (TextBox)Session["txtHoTen"];
                string maDH = (string)Session["maDH"];
                string ptttoan = (string)Session["PaymentMethod"];

                lblThongBao.Text = $"<br />Xin chào (anh/chị) <strong>{txtHoTen.Text}</strong>,<br />" +
                    $"Anh/chị đã đặt hàng thành công. <br />" +
                    $"Mã đơn hàng của quý khách là: <strong>{maDH}</strong>.<br />" +
                    $"Phương thức thanh toán: <strong>{ptttoan}</strong>.<br />"+
                    $"Mọi thông tin về đơn hàng đã được gửi tới email của quý khách.<br/> " +
                    $"Vui lòng kiểm tra email để biết thêm chi tiết.<br />" +
                    $"Cảm ơn quý khách đã tin tưởng và đặt hàng tại KFC Lê Văn Việt.<br />" +
                    $"Mọi thắc mắc vui lòng liên hệ: <strong>(84-28) 3848 9828</strong>.<br />";
        }
    }
}
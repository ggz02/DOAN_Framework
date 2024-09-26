using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn_Demo.Admin
{
    public partial class QuanLyDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdDH_SelectedIndexChanged(object sender, EventArgs e)
        {
            lb.Text = "Thông tin chi tiết đơn đặt hàng đã chọn:";
            grdCTDDH.Visible = true;
        }
    }
}
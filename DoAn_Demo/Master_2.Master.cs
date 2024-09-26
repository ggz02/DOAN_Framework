using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn_Demo
{
    public partial class Master_2 : System.Web.UI.MasterPage
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string userName = HttpContext.Current.User.Identity.Name;
            //if (userName.Equals("admin", StringComparison.OrdinalIgnoreCase))
            //{
            //    Response.Redirect("~/Admin/ThemSanPham.aspx", true);
            //}
            //else if (!userName.Equals("admin", StringComparison.OrdinalIgnoreCase))
            //{
            //    if (Session["GioHang"] != null)
            //    {
            //        dt = (DataTable)Session["GioHang"];
            //        lblnumgiohang.Text = dt.Rows.Count.ToString();
            //    }
            //}
            if (Session["GioHang"] != null)
            {
                dt = (DataTable)Session["GioHang"];
                lblnumgiohang.Text = dt.Rows.Count.ToString();
            }
        }
    }
}
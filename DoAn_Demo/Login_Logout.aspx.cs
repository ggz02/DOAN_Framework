using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn_Demo
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = HttpContext.Current.User.Identity.Name;
            if (userName.Equals("admin", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("~/Admin/DanhSachSanPham.aspx", true);
            }
        }
    }
}
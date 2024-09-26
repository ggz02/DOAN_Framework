using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn_Demo
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void imgbtn_chplay_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string installAppChplay = "https://play.google.com/store/apps/details?id=kfc.vietnam&hl=vi&gl=US&pli=1";
                Response.Redirect(installAppChplay);
            }
            catch (Exception)
            {
                string thongbao = "<script>alert('Lỗi lấy link tải')</script>";
                Response.Write(thongbao);
            }
        }

        protected void imgbtn_AppStore_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string installAppStore = "https://apps.apple.com/vn/app/kfc-vietnam/id562164615?l=vi";
                Response.Redirect(installAppStore);
            }
            catch (Exception)
            {
                string thongbao = "<script>alert('Lỗi lấy link tải')</script>";
                Response.Write(thongbao);
            }
        }
    }
}
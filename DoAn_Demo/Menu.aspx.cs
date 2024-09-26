
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn_Demo
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //int status = 1;

            //sqlsp.SelectParameters["maloai"].DefaultValue = status.ToString();

            if (!IsPostBack)
            {
                if (Request.QueryString["MALOAI"] != null)
                {
                    Session["MALOAI"] = Request.QueryString["MALOAI"];
                    string maloai = Session["MALOAI"].ToString();

                    sqlsp.SelectParameters["maloai"].DefaultValue = maloai;

                    // Tải lại dữ liệu
                    lstsp.DataBind();
                }
                else
                {
                    int status = 1;

                    sqlsp.SelectParameters["maloai"].DefaultValue = status.ToString();
                }
            }
        }

        protected void Menu_Show_MenuItemClick(object sender, MenuEventArgs e)
        {
            int maloai = Convert.ToInt32(Menu_Show.SelectedItem.Value);

            sqlsp.SelectParameters["maloai"].DefaultValue = maloai.ToString();
        }
    }
}
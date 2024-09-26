using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn_Demo.Admin
{
    public partial class ThemSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAlert();
            }
        }
        protected void LoadAlert()
        {
            if (Session["AlertMessage"] != null && Session["AlertType"] != null)
            {
                string alertMessage = Session["AlertMessage"].ToString();
                string alertType = Session["AlertType"].ToString();

                ClientScript.RegisterStartupScript(this.GetType(), "alertType", $"showAlert('{alertMessage}');", true);

                Session.Remove("AlertMessage");
                Session.Remove("AlertType");
            }
        }
        protected void butAdd_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["ConnectionStringKFC"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            adapt.SelectCommand = new SqlCommand("SELECT * FROM SANPHAM", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            string strFileUpload = "";
            try
            {
                if (upHinh.HasFile)
                {
                    strFileUpload = "~/img/" + upHinh.FileName;
                    string path = MapPath("/img/") + upHinh.FileName;
                    upHinh.PostedFile.SaveAs(path);
                }
                adapt.InsertCommand = new SqlCommand("INSERT INTO SANPHAM VALUES (@MaSP, " +
                    "@TenSP, @DonViTinh, @DonGia, @MaLoai, @HinhSP)", con);
                adapt.InsertCommand.Parameters.AddWithValue("@MaSP", txtMaSP.Text);
                adapt.InsertCommand.Parameters.AddWithValue("@TenSP", txtTenSP.Text);
                adapt.InsertCommand.Parameters.AddWithValue("@DonViTinh", drpDVT.SelectedValue);
                adapt.InsertCommand.Parameters.AddWithValue("@DonGia", Convert.ToDouble(txtDonGia.Text));
                adapt.InsertCommand.Parameters.AddWithValue("@MaLoai", Convert.ToInt32(drpLoai.SelectedValue));
                adapt.InsertCommand.Parameters.AddWithValue("@HinhSP", strFileUpload);
                DataRow row = dt.NewRow();
                row["MASP"] = "@MaSP";
                row["TENSP"] = "@TenSP";
                row["DONVITINH"] = "@DonViTinh";
                row["DONGIA"] = Convert.ToDouble(txtDonGia.Text);
                row["MALOAI"] = Convert.ToInt32(drpLoai.SelectedValue);
                row["HINHSP"] = "@HinhSP";
                dt.Rows.Add(row);
                adapt.Update(dt);

                lblStatus.Text = "Thêm thành công!";


            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.Message;
            }
            Session["AlertMessage"] = "Thêm thành công";
            Session["AlertType"] = "showAlert";
            UpdatePage();
        }
        protected void UpdatePage()
        {
            Response.Redirect("~/Admin/ThemSanPham.aspx");
        }
        protected void butCancel_Click(object sender, EventArgs e)
        {
            txtTenSP.Text=txtMaSP.Text=txtDonGia.Text=" ";
            lblStatus.Text = "";
        }
    }
}
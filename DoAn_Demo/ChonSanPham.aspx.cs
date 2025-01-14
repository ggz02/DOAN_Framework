﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn_Demo
{
    public partial class ChonSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Reponse khi nhấn vào dalist item 
            string masp = "";
            if (Request.QueryString["MASP"] != null)
                masp = Request.QueryString["MaSP"];
            Session["MaSP"] = masp;
            LoadSP(masp);
        }

        protected void LoadSP(string masp)
        {
            //Lấy chuỗi kết nối
            string conStr = WebConfigurationManager.ConnectionStrings["ConnectionStringKFC"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            //Thực hiện đổ dữ liệu vào bảng dt
            SqlDataAdapter adapt = new SqlDataAdapter("SELECT MASP, TENSP, DONVITINH, DONGIA, MALOAI, HINHSP FROM SANPHAM WHERE MASP=" + "'" + masp + "'", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);

            //Kiểm tra nếu giá trị dòng của bảng nó không có sẽ out
            if (dt.Rows.Count == 0)
                return;

            //Gán giá trị dữ liệu từ bảng vào các toolbox 
            lblTenSP.Text = dt.Rows[0]["TENSP"].ToString();
            lblMaSP.Text = "Mã hàng: " + dt.Rows[0]["MASP"].ToString();
            lblDonVi.Text = dt.Rows[0]["DONVITINH"].ToString();
            lblDonGia.Text = "Giá: " + String.Format("{0:0,000} VNĐ",dt.Rows[0]["DONGIA"]);
            imgHinh.ImageUrl = dt.Rows[0]["HINHSP"].ToString();
            ViewState["SANPHAM"] = dt;
        }

        protected void butInsert_Click(object sender, EventArgs e)
        {
            DataTable dtSP = (DataTable)ViewState["SANPHAM"];
            DataTable dtGH;     //Bảng giỏ hàng
            int Soluong = 0;

            //Kiểm tra và tạo giỏ hàng
            if (Session["GioHang"] == null)
            {
                dtGH = new DataTable();
                dtGH.Columns.Add("MASP");
                dtGH.Columns.Add("TENSP");
                dtGH.Columns.Add("GIA");
                dtGH.Columns.Add("SOLUONG");
                dtGH.Columns.Add("TONGTIEN");
            }
            else // lay gio hang tu Session
                dtGH = (DataTable)Session["GioHang"];

            string masp = (string)Session["MASP"];
            int pos = TimSP(masp, dtGH);        // tim vi tri san pham trong gio hang
            if (pos != -1)  // neu tim thay tai vi tri pos
            {
                //cap nhat lai cot so luong, tong tien
                Soluong = Convert.ToInt32(dtGH.Rows[pos]["SOLUONG"]) + int.Parse(txtSoluong.Text);
                dtGH.Rows[pos]["SOLUONG"] = Soluong;
                dtGH.Rows[pos]["TONGTIEN"] = Convert.ToDouble(dtSP.Rows[0]["DONGIA"]) * Soluong;
            }
            else    //san pham chua co trong gio hang: Them vao gio hang
            {
                Soluong = int.Parse(txtSoluong.Text);
                DataRow dr = dtGH.NewRow();//tạo một dòng mới
                                            // gán dữ liệu cho từng cột trong dòng mới
                dr["MASP"] = dtSP.Rows[0]["MASP"];
                dr["TENSP"] = dtSP.Rows[0]["TENSP"];
                dr["GIA"] = String.Format("{0:0,000} VNĐ", dtSP.Rows[0]["DONGIA"]);
                dr["SOLUONG"] = int.Parse(txtSoluong.Text);
                dr["TONGTIEN"] = String.Format("{0:0,000} VNĐ", Convert.ToDouble(dtSP.Rows[0]["DONGIA"]) * Soluong);

                //thêm dòng mới vào giỏ hàng
                dtGH.Rows.Add(dr);
            }

            //lưu gio hang vao session
            Session["GioHang"] = dtGH;

            //Chuyển đến trang GioHang
            Response.Redirect("~/Customers/GioHang.aspx");
        }

        //Hàm tìm sản phẩm
        public static int TimSP(string masp, DataTable dt)
        {
            int pos = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["MASP"].ToString().ToLower() == masp.ToLower())
                {
                    pos = i;
                    break;
                }
            }
            return pos;
        }

        //Hàm thêm số lượng sản phẩm
        protected void btnsub_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtSoluong.Text, out int a))
            {
                a++; 
                txtSoluong.Text = a.ToString(); 
                UpdateTotalPrice(a); 
            }
        }

        //Hàm giảm số lượng sản phẩm
        protected void Plus_Sub_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtSoluong.Text, out int a))
            {
                a--;
                if (a < 1)
                {
                    txtSoluong.Text = 1.ToString();
                    UpdateTotalPrice(1);
                }
                else
                {
                    txtSoluong.Text = a.ToString();
                    UpdateTotalPrice(a);
                }
            }
        }

        //Hàm thay đổi giá trị textbox sẽ load lại giá tiền sản phẩm
        protected void txtSoluong_TextChanged(object sender, EventArgs e)
        {
            if (int.TryParse(txtSoluong.Text, out int a))
            {
                UpdateTotalPrice(a);
                
            }
        }

        //Handle tăng giảm số lượng
        private void UpdateTotalPrice(int quantity)
        {
            // Lấy giá tiền từ ViewState
            if (ViewState["SANPHAM"] is DataTable dt && dt.Rows.Count > 0)
            {
                double dongia = Convert.ToDouble(dt.Rows[0]["DONGIA"]);
                double totalPrice = dongia * quantity;
                lblDonGia.Text = "Đơn Giá: " + String.Format("{0:0,000} VNĐ", totalPrice);
            }
        }
    }
}
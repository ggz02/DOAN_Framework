<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="ThemSanPham.aspx.cs" Inherits="DoAn_Demo.Admin.ThemSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
        function showAlert(message) {
            Swal.fire({
                title: 'Thông báo!',
                text: message,
                icon: 'success',
                confirmButtonText: 'Đóng'
            });
        }
    </script>
    <link href="../assets/ThemSanPham.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 52px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top wrapper_themsanpham">
        <h2 class="page_title">THÊM SẢN PHẨM</h2>
        <div style="display: grid; justify-content: space-around; grid-template-columns: auto auto;">
            <div>
                <asp:Image CssClass="img_add" ID="Image1" runat="server" ImageUrl="https://i.pinimg.com/564x/5a/a6/0c/5aa60c10c7deaaedee87743bbee1f580.jpg" />
            </div>
            <table style="width: 100%; font-size: 16px; font-weight: bold; color: crimson;">
                <tr>
                    <td style="width: 40%">Mã sản phẩm</td>
                    <td>
                        <asp:TextBox ID="txtMaSP" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMaSP" ErrorMessage="Nhập mã sản phẩm!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 40%">Tên sản phẩm</td>
                    <td>
                        <asp:TextBox ID="txtTenSP" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTenSP" ErrorMessage="Nhập tên sản phẩm!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Đơn vị tính</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="drpDVT" runat="server"
                            DataSourceID="srcMatHang" DataTextField="DONVITINH" DataValueField="DONVITINH">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="srcMatHang" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringKFC %>"
                            SelectCommand="SELECT distinct DONVITINH FROM SANPHAM "></asp:SqlDataSource>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td>Đơn giá</td>
                    <td>
                        <asp:TextBox ID="txtDonGia" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDonGia" ErrorMessage="Nhập đơn giá!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Loại sản phẩm</td>
                    <td>
                        <asp:DropDownList ID="drpLoai" runat="server"
                            DataSourceID="srcLoaiHang"
                            DataTextField="TENLOAI"
                            DataValueField="MALOAI">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="srcLoaiHang" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringKFC %>"
                            SelectCommand="SELECT MALOAI, TENLOAI FROM LOAISP ORDER BY TENLOAI"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp; </td>
                </tr>
                <tr>
                    <td>Hình sản phẩm</td>
                    <td>
                        <asp:FileUpload ID="upHinh" runat="server" ForeColor="#000099" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="uphinh" ErrorMessage="Chọn hình ảnh!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="display: flex; justify-content: space-around; align-items: center">
                        <asp:Button ID="butAdd" runat="server" Text="Thêm" OnClick="butAdd_Click" ForeColor="#ffffff" />
                        <asp:Button ID="butCancel" runat="server" Text="Hủy Bỏ" ForeColor="#ffffff" OnClick="butCancel_Click" CausesValidation="False" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp; </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Style="font-size: 14px; color: #0033CC"></asp:Label>
                    </td>
                    <td>&nbsp; </td>
                </tr>
            </table>

        </div>
    </div>
</asp:Content>

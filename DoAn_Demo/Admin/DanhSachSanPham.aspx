<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="DanhSachSanPham.aspx.cs" Inherits="DoAn_Demo.Admin.ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/ChiTietSanPham.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top wrapper_chitietsanpham">
        <%-- Phần title của trang --%>
        <h2 class="page_title">DANH SÁCH SẢN PHẨM</h2>
        <br />

        <%-- Phần combobox --%>
        <span style="color: crimson; margin-left: 10px"><span style="font-size: 16px; font-weight: bold">Loại sản phẩm:</span>&nbsp;</span>
        <asp:DropDownList ID="drpLoai" runat="server" AutoPostBack="True"
            DataSourceID="srcLoai" DataTextField="TENLOAI" DataValueField="MALOAI">
        </asp:DropDownList>
        <br />

        <%-- Phần DataSource --%>
        <asp:SqlDataSource ID="srcLoai" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionStringKFC %>"
            SelectCommand="SELECT * FROM LOAISP"></asp:SqlDataSource>
        <br />
        <%-- Phần GridView Chi tiết hàng hóa --%>
        <asp:GridView ID="grdMatHang" runat="server" AllowPaging="True" CssClass="GridView"
            AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="MASP"
            DataSourceID="srcMatHang" GridLines="Horizontal"
            PageSize="5" Width="100%" BackColor="Crimson" BorderColor="Crimson" BorderWidth="1px" BorderStyle="Solid" HorizontalAlign="Center">
            <RowStyle BackColor="White" ForeColor="#333333" VerticalAlign="Middle" />
            <Columns>
                <%-- Phần Sửa xóa --%>
                <asp:CommandField ControlStyle-CssClass="btn_thaotac"
                    DeleteText="Xóa"
                    EditText="Sửa"
                    ShowDeleteButton="True"
                    ShowEditButton="True"
                    CancelText="Huỷ Bỏ"
                    UpdateText="Cập Nhật" >

                    <ControlStyle CssClass="test"></ControlStyle>

                    <HeaderStyle Width="100px" />

                </asp:CommandField>

                <%-- Phần Mã Hàng --%>
                <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP">
                    <HeaderStyle Width="80px" HorizontalAlign="Left" />
                </asp:BoundField>

                <%-- Phần Tên Hàng --%>
                <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm">
                    <HeaderStyle Width="120px" HorizontalAlign="Left" />
                </asp:BoundField>

                <%-- Phần Load Data --%>
                <asp:TemplateField>

                    <%-- Hình SP --%>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server"
                            NavigateUrl='<%# Eval("MASP", "~/ChonSanPham.aspx?MASP={0}") %>'>
                            <asp:Image ID="Image1" runat="server" Height="80px" Width="80px"
                                ImageUrl='<%# Eval("HINHSP")%>' />
                        </asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle Width="50px" HorizontalAlign="Center" />
                </asp:TemplateField>

                <%-- Phần đơn vị tính --%>
                <asp:BoundField DataField="DONVITINH" HeaderText="Đơn vị tính" SortExpression="DonViTinh">
                    <HeaderStyle Width="80px" HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>

                <%-- Phần đơn giá --%>
                <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" SortExpression="Dongia" DataFormatString="{0:0,000 VNĐ}">
                    <HeaderStyle Width="80px" HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <PagerStyle CssClass="Page_detailProduct" BackColor="crimson" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="crimson" Font-Bold="True" ForeColor="White" Height="45px" />
            <FooterStyle BackColor="Crimson" Font-Bold="true" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>

        <%-- Phần DataSource cho GridView --%>
        <asp:SqlDataSource ID="srcMatHang" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionStringKFC %>"
            DeleteCommand="DELETE FROM SANPHAM WHERE MASP = @MaSP"
            SelectCommand="SELECT MASP, TENSP, DONVITINH, DONGIA, MALOAI, HINHSP FROM SANPHAM WHERE MALOAI = @MaLoai"
            UpdateCommand="UPDATE SANPHAM SET TENSP = @TenSP, DONVITINH = @DonViTinh, DONGIA = @DonGia WHERE MASP = @MaSP">
            <DeleteParameters>
                <asp:Parameter Name="MaSP" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="drpLoai" Name="MaLoai"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="TenSP" Type="String" />
                <asp:Parameter Name="DonViTinh" />
                <asp:Parameter Name="DonGia" Type="Double" />
                <asp:Parameter Name="MaSP" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>
</asp:Content>

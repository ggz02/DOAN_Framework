<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyDonHang.aspx.cs" Inherits="DoAn_Demo.Admin.QuanLyDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="page_top wrapper_chitietsanpham">
         <%-- Phần Mã Hàng --%>
     <h2 class="page_title">QUẢN LÝ ĐƠN HÀNG</h2>
         <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" Text="Các đơn đặt hàng:"></asp:Label>
     <br />
         <asp:GridView ID="grdDH" runat="server" AllowPaging="True" CssClass="GridView"
    AutoGenerateColumns="False" CellPadding="4"
    DataSourceID="srcDDH" Width="100%" BackColor="Crimson" BorderColor="Crimson" BorderWidth="1px" BorderStyle="Solid" OnSelectedIndexChanged="grdDH_SelectedIndexChanged" DataKeyNames="MaDH" PageSize="7">
    <RowStyle BackColor="White" ForeColor="#333333" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
    <PagerStyle CssClass="Page_detailProduct" BackColor="crimson" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#FFFFCC" Font-Bold="True" ForeColor="Black" />
    <HeaderStyle BackColor="crimson" Font-Bold="True" ForeColor="White" Height="45px" />
             <Columns>
                 <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                 <asp:BoundField DataField="MaDH" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="MaDH" />
                 <asp:BoundField DataField="TriGia" DataFormatString="{0:0,000 VNĐ}" HeaderText="Tổng tiền" SortExpression="TriGia" />
                 <asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" Visible="False" />
                 <asp:BoundField DataField="NgayDH" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Ngày đặt hàng" SortExpression="NgayDH" />
                 <asp:BoundField DataField="TenNguoiNhan" HeaderText="Tên người nhận" SortExpression="TenNguoiNhan" />
                 <asp:BoundField DataField="DiaChiNhan" HeaderText="Địa chỉ nhận" SortExpression="DiaChiNhan" />
                 <asp:BoundField DataField="SoDT" HeaderText="Số điện thoại" SortExpression="SoDT" />
                 <asp:BoundField DataField="HThanhToan" HeaderText="Hình thức thanh toán" SortExpression="HThanhToan" />
             </Columns>
    <FooterStyle BackColor="Crimson" Font-Bold="true" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
         <asp:SqlDataSource ID="srcDDH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringKFC %>" SelectCommand="SELECT * FROM [DDH]"></asp:SqlDataSource>
     <br />
         <asp:Label ID="lb" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
     <br />
         <%-- Phần Tên Hàng --%>
     <asp:GridView ID="grdCTDDH" runat="server" AllowPaging="True" CssClass="GridView"
         AutoGenerateColumns="False" CellPadding="4"
         DataKeyNames="MaDH,MASP"
         DataSourceID="srcCTDDH"
         PageSize="5" Width="100%" BackColor="Crimson" BorderColor="Crimson" BorderWidth="1px" BorderStyle="Solid" Visible="False" HorizontalAlign="Center">
         <RowStyle BackColor="White" ForeColor="#333333" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
         <Columns>
             <%-- Phần Sửa xóa --%>

             <%-- Phần Mã Hàng --%>
             <asp:BoundField DataField="MaDH" HeaderText="MaDH" ReadOnly="True" SortExpression="MaDH" Visible="False">
             </asp:BoundField>

             <%-- Phần Tên Hàng --%>
             <asp:BoundField DataField="MASP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MASP">
             </asp:BoundField>

             <%-- Phần Load Data --%>

             <%-- Phần đơn vị tính --%>
             <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" SortExpression="DonGia" DataFormatString="{0:0,000 VNĐ}">
             </asp:BoundField>

             <%-- Phần đơn giá --%>
             <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" SortExpression="SoLuong">
             </asp:BoundField>
             <asp:BoundField DataField="ThanhTien" DataFormatString="{0:0,000 VNĐ}" HeaderText="Thành tiền" SortExpression="ThanhTien" />
         </Columns>
         <PagerStyle CssClass="Page_detailProduct" BackColor="crimson" ForeColor="White" HorizontalAlign="Center" />
         <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="crimson" Font-Bold="True" ForeColor="White" Height="45px" HorizontalAlign="Center" VerticalAlign="Middle" />
         <EditRowStyle Height="0px" HorizontalAlign="Center" VerticalAlign="Middle" />
         <FooterStyle BackColor="Crimson" Font-Bold="true" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#F7F7F7" />
         <SortedAscendingHeaderStyle BackColor="#487575" />
         <SortedDescendingCellStyle BackColor="#E5E5E5" />
         <SortedDescendingHeaderStyle BackColor="#275353" />
     </asp:GridView>

         <asp:SqlDataSource ID="srcCTDDH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringKFC %>" SelectCommand="SELECT * FROM [CTDDH] WHERE ([MaDH] = @MaDH2)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="grdDH" Name="MaDH2" PropertyName="SelectedValue" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>

     <%-- Phần Load Data --%>
     <br />
 </div>
</asp:Content>

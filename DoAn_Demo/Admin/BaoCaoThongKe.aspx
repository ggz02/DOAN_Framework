<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" CodeBehind="BaoCaoThongKe.aspx.cs" Inherits="DoAn_Demo.Admin.BaoCao" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 42px;
        }
        .auto-style3 {
            height: 42px;
            width: 574px;
        }
        .auto-style4 {
            height: 42px;
            width: 616px;
        }
        .auto-style5 {
            width: 616px;
        }
    </style>
    <link href="../assets/ChiTietSanPham.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="page_top wrapper_chitietsanpham">
         <%-- Phần Tên Hàng --%>
     <h2 class="page_title">BÁO CÁO, THỐNG KÊ DOANH THU </h2>
         <table class="auto-style1">
             <tr>
                 <td class="auto-style4">
                     <asp:Label ID="lblTuNgay" runat="server" Text="Từ ngày:" Font-Size="Large"></asp:Label>
                     <asp:TextBox ID="tbTuNgay" runat="server" Font-Size="Large"></asp:TextBox>
                     <asp:ImageButton ID="imgTuNgay" runat="server" Height="17px" ImageUrl="~/img/1111.png" OnClick="imgTuNgay_Click" Width="20px" />
                 </td>
                 <td class="auto-style3">
                     <asp:Label ID="lblDenNgay" runat="server" Text="Đến ngày:" Font-Size="Large"></asp:Label>
                     <asp:TextBox ID="tbDenNgay" runat="server" Font-Size="Large"></asp:TextBox>
                     <asp:ImageButton ID="imgDenNgay" runat="server" Height="17px" ImageUrl="~/img/1111.png" OnClick="imgDenNgay_Click" Width="20px" />
                 </td>
                 <td class="auto-style2">
                    <asp:Button ID="btnXuatBC" runat="server"
                        Text="Xuất báo cáo"
                        ForeColor="#ffffff" Font-Size="Large"
                        Width="220px"
                        OnClick="btnXuatBC_Click" Height="40px" BackColor="Crimson" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Visible="False" />
                 </td>
             </tr>
             <tr>
                 <td class="auto-style5">
                     <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="250px" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Visible="False" Width="250px">
                         <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                         <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                         <OtherMonthDayStyle ForeColor="#CC9966" />
                         <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                         <SelectorStyle BackColor="#FFCC66" />
                         <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                         <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                     </asp:Calendar>
                 </td>
                 <td colspan="2">
                     <asp:Calendar ID="Calendar2" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="250px" OnSelectionChanged="Calendar2_SelectionChanged" ShowGridLines="True" Visible="False" Width="250px">
                         <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                         <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                         <OtherMonthDayStyle ForeColor="#CC9966" />
                         <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                         <SelectorStyle BackColor="#FFCC66" />
                         <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                         <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                     </asp:Calendar>
                 </td>
             </tr>
         </table>
     <br />
         <asp:GridView ID="grdDH" runat="server" AllowPaging="True" CssClass="GridView"
    AutoGenerateColumns="False" CellPadding="4"
    DataKeyNames="MaDH"
    DataSourceID="srcDH" Width="100%" BackColor="Crimson" BorderColor="Crimson" BorderWidth="1px" BorderStyle="Solid">
    <RowStyle BackColor="White" ForeColor="#333333" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
    <Columns>
        <%-- Phần Sửa xóa --%>

        <%-- Phần Mã Hàng --%>
        <asp:BoundField DataField="MaDH" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="MaDH">
        </asp:BoundField>

        <%-- Phần Tên Hàng --%>
        <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" SortExpression="MaKH" Visible="False">
        </asp:BoundField>

        <%-- Phần Load Data --%>

        <%-- Phần đơn vị tính --%>
        <asp:BoundField DataField="NgayDH" HeaderText="Ngày đặt hàng" SortExpression="NgayDH" DataFormatString="{0:dd-MM-yyyy}">
        </asp:BoundField>

        <%-- Phần đơn giá --%>
        <asp:BoundField DataField="TriGia" HeaderText="Tổng tiền" SortExpression="TriGia" DataFormatString="{0:0,000 VNĐ}">
        </asp:BoundField>
        <asp:BoundField DataField="TenNguoiNhan" HeaderText="Tên người nhận" SortExpression="TenNguoiNhan" />
        <asp:BoundField DataField="DiaChiNhan" HeaderText="Địa chỉ nhận" SortExpression="DiaChiNhan" />
        <asp:BoundField DataField="SoDT" HeaderText="Số điện thoại" SortExpression="SoDT" />
        <asp:BoundField DataField="HThanhToan" HeaderText="Hình thức thanh toán" SortExpression="HThanhToan" />
    </Columns>
    <PagerStyle CssClass="Page_detailProduct" BackColor="crimson" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="crimson" Font-Bold="True" ForeColor="White" Height="45px" Font-Size="Large" />
    <FooterStyle BackColor="Crimson" Font-Bold="true" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
         <asp:SqlDataSource ID="srcDH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringKFC %>" SelectCommand="GtDDHByDateRange" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="TuNgay" PropertyName="SelectedDate" />
                 <asp:ControlParameter ControlID="Calendar2" DbType="Date" Name="DenNgay" PropertyName="SelectedDate" />
             </SelectParameters>
         </asp:SqlDataSource>
     </div>
</asp:Content>

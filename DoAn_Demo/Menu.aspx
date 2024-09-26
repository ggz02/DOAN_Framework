<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="DoAn_Demo.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/Menu.css" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content_menu_show">
        <asp:Menu ID="Menu_Show" CssClass="Menu_Show" runat="server" Orientation="Horizontal" OnMenuItemClick="Menu_Show_MenuItemClick">
            <Items>
                <asp:MenuItem Text="ƯU ĐÃI" Value="1"></asp:MenuItem>
                <asp:MenuItem Text="MÓN MỚI" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="COMBO 1 NGƯỜI" Value="3"></asp:MenuItem>
                <asp:MenuItem Text="COMBO NHÓM" Value="4"></asp:MenuItem>
                <asp:MenuItem Text="GÀ RÁN - GÀ QUAY" Value="5"></asp:MenuItem>
                <asp:MenuItem Text="BURGER - CƠM - MÌ Ý" Value="6"></asp:MenuItem>
                <asp:MenuItem Text="THỨC ĂN NHẸ" Value="7"></asp:MenuItem>
                <asp:MenuItem Text="THỨC UỐNG &amp; TRÁNG MIỆNG" Value="8"></asp:MenuItem>
            </Items>
        </asp:Menu>

        <asp:DataList runat="server" CssClass="datalistMenu" DataKeyField="MASP" DataSourceID="sqlsp" style="text-align: center" Width="100%" RepeatColumns="4" ID="lstsp">
            <ItemTemplate>
                <div class="wrapper_datalist">
                    <div class="wrapper_menu_img">
                        <asp:ImageButton ID="ImageButton2" CssClass="menu_img" runat="server" Height="218px" ImageUrl='<%# Eval("HINHSP") %>' Width="260px" PostBackUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>' />
                    </div>
                    <br />
                    <asp:HyperLink ID="lnkSp" style="font-size: 18px;
color: #000 !important;
font-weight:600;" CssClass="menu_link" runat="server" Text='<%# Eval("TENSP") %>' NavigateUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>'></asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="dongia" CssClass="menu_lblgia" runat="server" NavigateUrl='<%# "~/ChonSanPham.aspx?MASP=" + Eval("MASP") %>' Text='<%# Eval("DONGIA","{0:0,000 vnđ}") %>'></asp:HyperLink>
                    <br />
                    <asp:HyperLink CssClass="menu_chonsp" ID="HyperLink1" runat="server" NavigateUrl='<%# "/ChonSanPham.aspx?MASP=" + Eval("MASP") %>'>Chọn</asp:HyperLink>
                    <br />
                </div>
            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="sqlsp" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringKFC %>" ProviderName="<%$ ConnectionStrings:ConnectionStringKFC.ProviderName %>" 
            SelectCommand="SELECT MASP, TENSP, DONVITINH, DONGIA, MALOAI, HINHSP FROM SANPHAM WHERE MALOAI = @maloai "> <%--WHERE MALOAI = @maloai--%>
            <SelectParameters>
                <asp:Parameter Name="maloai" Type="Int32" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</asp:Content>

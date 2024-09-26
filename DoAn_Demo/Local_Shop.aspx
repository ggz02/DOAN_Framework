<%@ Page Title="" Language="C#" MasterPageFile="~/Master_1.Master" AutoEventWireup="true" CodeBehind="Local_Shop.aspx.cs" Inherits="DoAn_Demo.Local_Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/localShop.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper_localtion">
        <%--Phần url của hàng--%>
        <iframe id="shop_map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62701.43526853981!2d106.73289312298564!3d10.823576306444478!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752711fdbde247%3A0xecc4f7fb3e1b9fbd!2zS0ZDIEzDqiBWxINuIFZp4buHdA!5e0!3m2!1svi!2s!4v1697700331766!5m2!1svi!2s" width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        <h1 class="title_thanks">CẢM ƠN QUÝ KHÁCH ĐÃ QUAN TÂM</h1>
    </div>
</asp:Content>

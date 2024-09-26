<%@ Page Title="" Language="C#" MasterPageFile="~/Master_2.Master" AutoEventWireup="true" CodeBehind="Login_Logout.aspx.cs" Inherits="DoAn_Demo.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/loginLogout.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .wrapper_loginlogout {
            opacity: 0;
            animation: fadeInAnimation 1s ease-in-out forwards;
        }

        @keyframes fadeInAnimation {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
    </style>
    <div class="page_top center wrapper_loginlogout">
        <strong>
            <asp:LoginName ID="LoginName1" runat="server" FormatString="{0} / " />
            <asp:LoginStatus ID="LoginStatus1" runat="server" ForeColor="Crimson" />
            <br />
        </strong>
        <asp:HyperLink CssClass="changepass" ID="HyperLink1" runat="server" NavigateUrl="~/ThayDoiMatKhau.aspx">Thay đổi mật khẩu</asp:HyperLink>
        <hr />
        <strong>Bạn cần đăng nhập vào để có thể thực hiện được một số thao tác.
        <asp:Label ID="userid" runat="server"></asp:Label>
        </strong>
    </div>
</asp:Content>

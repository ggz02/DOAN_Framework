<%@ Page Title="" Language="C#" MasterPageFile="~/Master_2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoAn_Demo.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
        .wrapper_login {
            position: relative;
            top: 100px;
            left: 0;
            display: grid;
            grid-template-columns: 2fr 2fr;
            place-items: center;
            gap: 10px;
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

        .img_login_shop {
            min-height: 50px;
            height: 556px;
            width: 100%;
        }

        .login_form {
            justify-self: self-start;
            align-self: center;
            border-radius: 40px;
            border: 1px solid #ddd;
            padding: 35px;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

        .loginStyle {
            font-family: Helvetica Neue,Helvetica,Arial,sans-serif;
            font-size: 16px;
            color: #202124;
            margin: 20px auto;
            text-align: left;
            width: 100%;
        }

            .loginStyle .login_button {
                border: none;
                background-color: crimson;
                padding: 26px 0;
                border-radius: 10px;
                width: 100%;
                height: 20px;
                color: #fff;
                font-size: 20px;
                font-weight: bold;
                margin: 16px 0;
                cursor: pointer;
                padding-top: 16px;
                line-height: 12px;
            }

                .loginStyle .login_button:hover {
                    background-color: #e4002b;
                    box-shadow: 0 2px 4px 2px rgba(0,0,0,0.5);
                }

            .loginStyle .login_title {
                text-transform: uppercase;
                font-size: 32px;
                padding-bottom: 36px;
                font-weight: bold;
            }

            .loginStyle .login_label, #login .login_textbox {
                display: block;
                margin-bottom: 30px;
            }

            .loginStyle .login_label {
                padding: 4px;
            }

            .loginStyle .login_textbox {
                border: 1px solid #ccc;
                width: 100%;
                margin: 0 0 10px 6px;
                outline-color: crimson;
                border-radius: 4px;
                padding: 6px 10px;
                transform: translateY(-15px);
            }

            .loginStyle .login_hyperlink {
                font-style: italic;
                text-decoration: underline;
            }

                .loginStyle .login_hyperlink:hover {
                    color: purple
                }

        .auto-style2 {
            width: inherit;
            margin-right: 0;
        }


        /*# sourceMappingURL=style.css.map */
        .auto-style3 {
            width: 516px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper_login container">
        <div class="login_img">
            <asp:ImageButton ID="img_login_shop" CssClass="img_login_shop" runat="server" ImageUrl="~/img/signin.jpg" PostBackUrl="~/Menu.aspx" />
        </div>
        <div class="login_form">
            <%-- Phần cài login  --%>
            <asp:Login ID="lgnDangNhap" runat="server"
                CreateUserUrl="~/DangKy.aspx"
                DestinationPageUrl="~/Home.aspx"
                PasswordRecoveryText="Quên Mật Khẩu"
                PasswordRecoveryUrl="~/QuenMatKhau.aspx"
                CssClass="loginStyle"
                CreateUserText="Đăng Ký"
                LoginButtonText="Đăng Nhập"
                PasswordLabelText="Mật Khẩu"
                RememberMeText="Ghi nhớ lần đăng nhập sau"
                UserNameLabelText="Tài Khoản:"
                Width="339px">
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse; " class="auto-style3">
                        <tr>
                            <td>
                                <table cellpadding="0" class="auto-style2">
                                    <tr>
                                        <td align="center" class="login_title" colspan="2">Đăng Nhập</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%; width: 150px; font-size: 24px;" align="right" class="login_label">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Tài Khoản</asp:Label>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" Style="color: red;" ErrorMessage="Nhập UserName!" ToolTip="User Name is required." ValidationGroup="lgnDangNhap">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" CssClass="login_textbox"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="login_label" style="width: 150px; font-size: 24px;">

                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Mật Khẩu </asp:Label>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" Style="color: red;" ErrorMessage="Nhập Password!" ToolTip="Password is required." ValidationGroup="lgnDangNhap">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td style="width: 100%;">
                                            <asp:TextBox ID="Password" runat="server" CssClass="login_textbox" TextMode="Password"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="RememberMe" runat="server" Style="margin-left: 20px; margin-right: 4px;" />
                                            Ghi nhớ mật khẩu lần sau
                                            

                                        </td>

                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="login_button" Text="Đăng Nhập" ValidationGroup="lgnDangNhap" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="login_hyperlink" colspan="2">
                                            <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/DangKy.aspx">Đăng Ký</asp:HyperLink>
                                            <asp:HyperLink ID="HyperLink1" runat="server" Style="float: right; text-decoration: underline;" NavigateUrl="~/QuenMatKhau.aspx">Quên Mật Khẩu</asp:HyperLink>

                                        </td>

                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <LoginButtonStyle CssClass="login_button" />
                <TitleTextStyle CssClass="login_title" />
                <TextBoxStyle CssClass="login_textbox" />
                <LabelStyle CssClass="login_label" />
                <HyperLinkStyle CssClass="login_hyperlink" />

            </asp:Login>
        </div>
    </div>
</asp:Content>

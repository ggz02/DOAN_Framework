<%@ Page Title="" Language="C#" MasterPageFile="~/Master_2.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="DoAn_Demo.DangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/registerAccount.css" rel="stylesheet" type="text/css" />
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

        .img_login_shop {
            min-height: 50px;
            height: 556px;
            width: 100%;
        }

        .formdangky {
            padding: 50px 15px;
            margin: 0 40px;
            font-family: Helvetica Neue,Helvetica,Arial,sans-serif;
            font-size: 16px;
            color: #202124;
            margin: 20px auto;
            text-align: left;
        }

            .formdangky .login_button {
                border: none;
                background-color: crimson;
                padding: 26px 0;
                border-radius: 10px;
                width: 100%;
                height: 20px;
                color: #fff;
                font-size: 16px;
                font-weight: bold;
                margin: 16px 0;
                cursor: pointer;
                padding-top: 10px;
            }

                .formdangky .login_button:hover {
                    background-color: #e4002b;
                    box-shadow: 0 2px 4px 2px rgba(0,0,0,0.5);
                }

            .formdangky .login_title {
                text-transform: uppercase;
                font-size: 32px;
                padding-bottom: 36px;
                font-weight: bold;
            }

            .formdangky .login_label, #login .login_textbox {
                display: block;
                margin-bottom: 30px;
            }

            .formdangky .login_label {
                padding: 4px;
            }

            .formdangky .login_textbox {
                border: 1px solid #ccc;
                width: 100%;
                margin: 0 0 10px 6px;
                outline-color: crimson;
                border-radius: 4px;
                padding: 6px 10px;
                transform: translateY(-15px);
            }

        .auto-style1 {
            width: inherit;
        }

        .auto-style3 {
            text-align: center;

        }

        .form-register {
            width:600px;
            border-radius: 40px;
border: 1px solid #ddd;
padding: 35px;
box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper_login container">
        <div class="auto-style3">
            <asp:ImageButton ID="img_login_shop" CssClass="img_login_shop" runat="server" ImageUrl="~/img/signin.jpg" PostBackUrl="~/Menu.aspx" />
        </div>
        <div class="">

            <%-- cài form đăng ký --%>
            <asp:CreateUserWizard ID="formdangky" CssClass="formdangky" runat="server"
                ContinueDestinationPageUrl="~/Login.aspx"
                LoginCreatedUser="False"
                AnswerLabelText="Bảo mật câu trả lời:"
                PasswordLabelText="Mật khẩu:"
                QuestionLabelText="Bảo mật câu hỏi:"
                UserNameLabelText="Tài khoản:"
                Width="484px" InvalidAnswerErrorMessage="" InvalidQuestionErrorMessage="">

                <%-- Phần mail --%>
                <MailDefinition
                    BodyFileName="Register.txt"
                    Subject="Tạo tài khoản KFC thành công!"
                    From="2121001008@sv.ufm.edu.vn">
                </MailDefinition>
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                        <ContentTemplate>
                            <table style="font-size: 100%; width: 516px !important;">
                                <tr>
                                    <td align="center" class="login_title" colspan="2">Đăng Ký</td>
                                </tr>
                                <tr>
                                    <td align="right" class="login_label" style="width: 200px; font-size: 22px; text-align: right;">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Tài khoản</asp:Label>
                                        <asp:RequiredFieldValidator Style="color: red;" ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="formdangky">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="UserName" runat="server" CssClass="login_textbox"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="login_label" style="width: 200px; font-size: 22px; text-align: right;">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Mật khẩu</asp:Label>
                                        <asp:RequiredFieldValidator Style="color: red;" ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="formdangky">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="Password" runat="server" CssClass="login_textbox" TextMode="Password"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="login_label" style="width: 200px; font-size: 22px; text-align: right; display:flex;">
                                        <label>Nhập lại mật khẩu</label>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" style="color:red; margin-left:4px;" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="formdangky">*</asp:RequiredFieldValidator>

                                    </td>
                                    
                                    <td class="auto-style1">
                                        <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="login_textbox" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="login_label" style="width: 200px; font-size: 22px; text-align: right;">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail</asp:Label>
                                        <asp:RequiredFieldValidator Style="color: red;" ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="formdangky">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="Email" runat="server" CssClass="login_textbox"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="login_label" style="width: 200px; font-size: 22px; text-align: right;">
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" Visible="False">Bảo mật câu hỏi:</asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="Question" runat="server" CssClass="login_textbox" Visible="False"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="formdangky">*</asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="login_label" style="width: 200px; font-size: 22px; text-align: right;">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" Visible="False">Bảo mật câu trả lời:</asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="Answer" runat="server" CssClass="login_textbox" Visible="False"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="formdangky">*</asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="formdangky"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: Red;">
                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    </asp:CompleteWizardStep>
                </WizardSteps>
                <TextBoxStyle CssClass="login_textbox" />
                <LabelStyle CssClass="login_label" />
                <CreateUserButtonStyle CssClass="login_button" />
                <TitleTextStyle CssClass="login_title" />
            </asp:CreateUserWizard>



        </div>
    </div>
</asp:Content>

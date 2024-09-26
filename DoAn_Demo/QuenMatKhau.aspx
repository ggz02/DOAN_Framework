<%@ Page Title="" Language="C#" MasterPageFile="~/Master_2.Master" AutoEventWireup="true" CodeBehind="QuenMatKhau.aspx.cs" Inherits="DoAn_Demo.QuenMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/forgotPassword.css" rel="stylesheet" type="text/css" />
    <style>
        .page_title {
            text-transform: uppercase;
            font-size: 32px;
            font-weight: bold;
            color:#000!important;
        }

        .fomrForgotPass {
            width: 800px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .formInput {
            transform: translateY(-4px);
            margin-left: 10px;
            width: 349px;
           border: 1px solid #dd
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top">
        <asp:PasswordRecovery CssClass="wrapperForgotPass"  ID="PasswordRecovery1" runat="server" OnSendingMail="PasswordRecovery1_SendingMail" AnswerLabelText="Câu trả lời:" QuestionFailureText="Câu trả lời của bạn không đúng. Vui lòng thử lại!" QuestionLabelText="Câu hỏi:" SuccessText="Mật khẩu của bạn đã được gửi tới Email" UserNameLabelText="Tài Khoản:">
            <MailDefinition 
                From="2121005143@sv.ufm.edu.vn" 
                Subject="Lấy lại mật khẩu">
            </MailDefinition>
            <UserNameTemplate>
                <div class="fomrForgotPass">
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0">
                                    <tr>
                                        <td align="center" class="page_title" colspan="2">Quên Mật Khẩu<br /> </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="font-size: 26px;" colspan="2">Nhập tải khoản của bạn để lấy lại mật khẩu!</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" style="font-size: 24px;" runat="server" AssociatedControlID="UserName">Tài Khoản</asp:Label>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" style="color:red" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" CssClass="formInput" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Đồng Ý" ValidationGroup="PasswordRecovery1" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </UserNameTemplate>
        </asp:PasswordRecovery>
    </div>
</asp:Content>

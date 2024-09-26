<%@ Page Title="" Language="C#" MasterPageFile="~/Master_2.Master" AutoEventWireup="true" CodeBehind="ThayDoiMatKhau.aspx.cs" Inherits="DoAn_Demo.ThayDoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/changePass.css" rel="stylesheet" type="text/css" />
    <style>
        .page_title {
            text-transform: uppercase;
            font-size: 32px;
            font-weight: bold;
            color:#000!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page_top wrapper_thaydoimatkhau">
        <h2 class="page_title">Thay Đổi Mật Khẩu</h2>
        <asp:ChangePassword runat="server" 
            CssClass="changpass"
            DisplayUserName="True" 
            CancelButtonText="Hủy" 
            ChangePasswordButtonText="Thay đổi" 
            ChangePasswordTitleText="Thay đổi mật khẩu" 
            ConfirmNewPasswordLabelText="Nhập lại mật khẩu:" 
            ConfirmPasswordCompareErrorMessage="Vui lòng nhập lại đúng mật khẩu" 
            ConfirmPasswordRequiredErrorMessage="Vui lòng nhập mật khẩu" 
            ContinueButtonText="Tiếp tục" 
            NewPasswordLabelText="Mật khẩu mới:" 
            NewPasswordRegularExpressionErrorMessage="Vui lòng nhập khác mật khẩu cũ" 
            NewPasswordRequiredErrorMessage="Nhập mật khẩu mới" 
            PasswordLabelText="Mật khẩu:" 
            PasswordRequiredErrorMessage="Nhập mật khẩu" 
            SuccessText="Mật khẩu của bạn đã được thay đổi" 
            SuccessTitleText="Thay đổi mật khẩu thành công" 
            UserNameLabelText="Tài khoản:" 
            UserNameRequiredErrorMessage="Nhập tài khoản" ContinueDestinationPageUrl="~/Login_Logout.aspx">
            <ChangePasswordTemplate>
                <div class="wrapper_table_changepass">
                    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                        <tr>
                            <td>
                                <table cellpadding="0">
                                    <tr>
                                        <td align="right">
                                            <asp:Label CssClass="changpass_label" ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Tài khoản:</asp:Label>
                                        </td>
                                        <td class=>
                                            <asp:TextBox CssClass="changpass_txt" ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Nhập tài khoản" ToolTip="Nhập tài khoản" ValidationGroup="ctl26">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label CssClass="changpass_label" ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Mật khẩu:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="changpass_txt" ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Nhập mật khẩu" ToolTip="Nhập mật khẩu" ValidationGroup="ctl26">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label CssClass="changpass_label" ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">Mật khẩu mới:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="changpass_txt" ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="Nhập mật khẩu mới" ToolTip="Nhập mật khẩu mới" ValidationGroup="ctl26">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label CssClass="changpass_label" ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Nhập lại mật khẩu:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="changpass_txt" ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Vui lòng nhập mật khẩu" ToolTip="Vui lòng nhập mật khẩu" ValidationGroup="ctl26">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center"colspan="2">
                                            <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="Vui lòng nhập lại đúng mật khẩu" ValidationGroup="ctl26"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr class="changpass_btnwrapper">
                                        <td class="changpass_btnxacnhan">
                                            <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Thay đổi mật khẩu" ValidationGroup="ctl26" />
                                        </td>
                                        <td class="changpass_btnhuy">
                                            <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Hủy" PostBackUrl="~/Login_Logout.aspx" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </ChangePasswordTemplate>
            <MailDefinition 
                BodyFileName="~/ThayDoiMatKhau.txt"
                Subject="Thay đổi mật khẩu thành công!"
                 From="2121001008@sv.ufm.edu.vn" > 
            </MailDefinition>
        </asp:ChangePassword>
    </div>
</asp:Content>

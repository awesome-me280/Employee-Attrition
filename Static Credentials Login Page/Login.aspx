<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentPortfolio.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="text-align: center"> Login to the site for full access</p>

    <table align="center" style="width: 60%">
        <tr>
            <td style="text-align: right; width: 170px">User ID:&nbsp;</td>
            <td style="text-align: left; width: 228px">
                <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:RegularExpressionValidator ID="revUserID" runat="server"
                    ControlToValidate="txtUserID" ErrorMessage="*Must be an Email"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]w+)*\.\w+([-.]w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 170px">Password: </td>
            <td style="text-align: left; width: 228px">
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtPass" ErrorMessage="*Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 170px">&nbsp;</td>
            <td style="text-align: left; width: 228px">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </td>
            <td style="text-align: left">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 170px">&nbsp;</td>
            <td style="text-align: left; width: 228px">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td style="text-align: left">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

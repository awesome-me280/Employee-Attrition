<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StudentPortfolio.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p><br /></p>

    <table style="width: 70%" align="center">
        <tr>
            <td style="text-align: right; height: 27px;">Email:</td>
            <td style="text-align: left; height: 27px;">
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td style="text-align: left; height: 27px;">
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail" ErrorMessage="*Must be an Email"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]w+)*\.\w+([-.]w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Confirm Email:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtCEmail" runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:CompareValidator ID="cvEmail" runat="server"
                    ControlToCompare="txtEmail" ControlToValidate="txtCEmail"
                    ErrorMessage="*Emails must match"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Password:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="rfvPass" runat="server"
                    ControlToValidate="txtPass" ErrorMessage="*Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Confirm Password:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtCPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:CompareValidator ID="cvPass" runat="server"
                    ControlToCompare="txtPass" ControlToValidate="txtCPass"
                    ErrorMessage="*Passwords must match"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">First Name:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="rfvFName" runat="server"
                    ControlToValidate="txtFName" ErrorMessage="*Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Last Name:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="rfvLName" runat="server"
                    ControlToValidate="txtLName" ErrorMessage="*Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">Year of Birth:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtYoB" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="rfvYoB" runat="server"
                    ControlToValidate="txtYoB" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revYoB" runat="server"
                    ControlToValidate="txtYoB" ErrorMessage="*Must be a 4 digit year"
                    ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">&nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnsubmit_Click" Text="Submit" />
            </td>
            <td style="text-align: left">&nbsp;</td>
        </tr>
    </table>

    <p>
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </p>

    <p>
        <asp:SqlDataSource ID="dsRegister" runat="server"
            ConnectionString="<%$ ConnectionStrings:5680LabsConnectionString %>"
            DeleteCommand="DELETE FROM [Logins] WHERE [User_Email] = @User_Email"
            InsertCommand="INSERT INTO [Logins] ([User_Email], [User_Pass], [User_FName], [User_LName], [User_YOB]) VALUES (@User_Email, @User_Pass, @User_FName, @User_LName, @User_YOB)"
            SelectCommand="SELECT * FROM [Logins]"
            UpdateCommand="UPDATE [Logins] SET [User_Pass] = @User_Pass, [User_FName] = @User_FName, [User_LName] = @User_LName, [User_YOB] = @User_YOB WHERE [User_Email] = @User_Email">
            <DeleteParameters>
                <asp:Parameter Name="User_Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_Email" Type="String" />
                <asp:Parameter Name="User_Pass" Type="String" />
                <asp:Parameter Name="User_FName" Type="String" />
                <asp:Parameter Name="User_LName" Type="String" />
                <asp:Parameter Name="User_YOB" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Pass" Type="String" />
                <asp:Parameter Name="User_FName" Type="String" />
                <asp:Parameter Name="User_LName" Type="String" />
                <asp:Parameter Name="User_YOB" Type="Int32" />
                <asp:Parameter Name="User_Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

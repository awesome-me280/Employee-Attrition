<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="StudentPortfolio.update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p><br /></p>

    <table style="width: 70%" align="center">
        <tr>
            <td style="text-align: right; height: 27px;">Email:</td>
            <td style="text-align: left; height: 27px;">
                <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </td>
            <td style="text-align: left; height: 27px;">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; height: 36px;">&nbsp;</td>
            <td style="text-align: left; height: 36px;">Member information</td>
            <td style="text-align: left; height: 36px;">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">Password:</td>
            <td style="text-align: left">
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="text-align: left">&nbsp;</td>
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
                <asp:TextBox ID="txtYOB" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="rfvYoB" runat="server"
                    ControlToValidate="txtYOB" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revYoB" runat="server"
                    ControlToValidate="txtYOB" ErrorMessage="*Must be a 4 digit year"
                    ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">&nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="btnUpdate" runat="server" Text="Update my Account" OnClick="btnUpdate_Click" />
            </td>
            <td style="text-align: left">&nbsp;</td>
        </tr>
    </table>

    <p>
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblPass" runat="server" Visible="False"></asp:Label>
        <asp:SqlDataSource ID="dsUpdate" runat="server"
            ConnectionString="<%$ ConnectionStrings:5680LabsConnectionString %>"
            DeleteCommand="DELETE FROM [Logins] WHERE [User_Email] = @User_Email"
            InsertCommand="INSERT INTO [Logins] ([User_Email], [User_Pass], [User_FName], [User_LName], [User_YOB]) VALUES (@User_Email, @User_Pass, @User_FName, @User_LName, @User_YOB)"
            SelectCommand="SELECT * FROM [Logins] WHERE ([User_Email] = @User_Email)"
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
            <SelectParameters>
                <asp:Parameter Name="User_Email" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Pass" Type="String" />
                <asp:Parameter Name="User_FName" Type="String" />
                <asp:Parameter Name="User_LName" Type="String" />
                <asp:Parameter Name="User_YOB" Type="Int32" />
                <asp:Parameter Name="User_Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
</asp:Content>

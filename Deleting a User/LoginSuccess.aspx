<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="LoginSuccess.aspx.cs" Inherits="StudentPortfolio.LoginSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Welcome <asp:Label ID="lblUser" runat="server"></asp:Label>
        &nbsp;You have authenticated to the site
    </p>
    <p>
        <asp:HyperLink ID="hlUpdate" runat="server" NavigateUrl="~/update.aspx">Update my Account</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="hlDelete" runat="server" NavigateUrl="~/Delete.aspx">Delete my Account</asp:HyperLink>
    </p>
    <p>&nbsp;</p>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="RegSuccess.aspx.cs" Inherits="StudentPortfolio.RegSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="text-align: center">You have successfully registered</p>
    <p id="Here" style="text-align: center">
        Click
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login2.aspx">Here</asp:HyperLink>
        to Login
    </p>
    <p style="text-align: center">&nbsp;</p>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NID" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="NID" HeaderText="NID" ReadOnly="True" SortExpression="NID" />
        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
        <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
        <asp:BoundField DataField="contact" HeaderText="contact" SortExpression="contact" />
        <asp:BoundField DataField="date_of_birth" HeaderText="date_of_birth" SortExpression="date_of_birth" />
        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        <asp:BoundField DataField="pic" HeaderText="pic" SortExpression="pic" />
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [registration_info]"></asp:SqlDataSource>
    </asp:Content>

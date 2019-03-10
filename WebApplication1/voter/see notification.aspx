<%@ Page Title="" Language="C#" MasterPageFile="~/voter/votersite.Master" AutoEventWireup="true" CodeBehind="see notification.aspx.cs" Inherits="WebApplication1.voter.see_notification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container"  style=" background-position:center; background-size: contain; width: 608px;">
       <div style="text-align:center; padding:5.4px;height:auto; width:auto;  margin-right: 0px;">
           <div style="background-color:rgba(5, 24, 70, 0.80); padding:inherit">
               <h1  style="text-align:center;color:#ffffff; width: auto;">Notice</h1>
           </div>
           
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource11" GridLines="Horizontal" AllowPaging="True" AllowSorting="True" Width="608px">
               <AlternatingRowStyle BackColor="#F7F7F7" />
               <Columns>
                   <asp:BoundField DataField="Notice" HeaderText="Notice From Election Office" SortExpression="Notice" />
                   <asp:BoundField DataField="Date" HeaderText="Date Of Notification" SortExpression="Date" />
               </Columns>
               <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
               <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
               <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
               <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
               <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
               <SortedAscendingCellStyle BackColor="#F4F4FD" />
               <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
               <SortedDescendingCellStyle BackColor="#D8D8F0" />
               <SortedDescendingHeaderStyle BackColor="#3E3277" />
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Date], [Notice] FROM [notification_info]"></asp:SqlDataSource>
       </div>
     </div>
</asp:Content>

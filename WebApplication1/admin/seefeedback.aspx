<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true" CodeBehind="seefeedback.aspx.cs" Inherits="WebApplication1.admin.seefeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container"  style=" background-position:center; background-size: contain; width: 608px;">
       <div style="text-align:center; padding:5.4px;height:auto; width:auto;  margin-right: 0px;">
           <div style="background-color:rgba(5, 24, 70, 0.80); padding:inherit">
               <h1  style="text-align:center;color:#ffffff; width: auto;">Notice</h1>
           </div>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1w" ForeColor="#333333" GridLines="None" Width="611px">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
                   <asp:BoundField DataField="id" HeaderText="NID" SortExpression="id" />
                   <asp:BoundField DataField="comment" HeaderText="Comment &amp; Feedback" SortExpression="comment" />
                   <asp:BoundField DataField="date" HeaderText="Date of Comment" SortExpression="date" />
               </Columns>
               <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
               <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
               <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
               <SortedAscendingCellStyle BackColor="#FDF5AC" />
               <SortedAscendingHeaderStyle BackColor="#4D0000" />
               <SortedDescendingCellStyle BackColor="#FCF6C0" />
               <SortedDescendingHeaderStyle BackColor="#820000" />
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1w" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [feedback]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

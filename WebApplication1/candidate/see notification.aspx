<%@ Page Title="" Language="C#" MasterPageFile="~/candidate/candidatesite.Master" AutoEventWireup="true" CodeBehind="see notification.aspx.cs" Inherits="WebApplication1.candidate.see_notification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container"  style=" background-position:center; background-size: contain; width: 608px;">
       <div style="text-align:center; padding:5.4px;height:auto; width:auto;  margin-right: 0px;">
           <div style="background-color:rgba(5, 24, 70, 0.80); padding:inherit">
               <h1  style="text-align:center;color:#ffffff; width: auto;">Notice</h1>
           </div>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource11" ForeColor="#333333" GridLines="None" Width="608px" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
                   <asp:TemplateField HeaderText="Notice" SortExpression="Notice">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Notice") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server" Text='<%# Bind("Notice") %>'></asp:Label>
                       </ItemTemplate>
                       <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                   </asp:TemplateField>
                   <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" >
                   <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                   </asp:BoundField>
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
           <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Notice], [Date] FROM [notification_info]"></asp:SqlDataSource>
       </div>
     </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="WebApplication1.admin.Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 319px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container" style="background-position:center; height:auto; width:auto">
        <div style="text-align:center; padding:4px; background-color:rgba(3, 9, 44, 0.90); height:auto;width:auto">
            <h1 style="text-align:center; color:white;width:auto">
                Select The Election to Finish
                
            </h1>
            <div> <asp:Label ID="Label1" runat="server" Cssclass="btn btn-primary" Text=""></asp:Label></div>
        
             <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="800px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="of_id" HeaderText="Of Id" SortExpression="of_id" />
                        <asp:BoundField DataField="vote_name" HeaderText="Election Name" SortExpression="vote_name" />
                        <asp:CommandField ShowSelectButton="True">
                        <ControlStyle CssClass="btn btn-primary" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [of_id], [vote_name] FROM [Creat_vote] WHERE ([status] IS NULL)"></asp:SqlDataSource>
       

       <div>
                         <h1 style="text-align:center;  color:white;width:auto">
                Click Finish Button to Finish 
                
            </h1>
              <table class="nav-justified" style=" color:#ffffff; background-color:rgba(10, 1, 1, 0.30); width:800px " >
             <tr>
                 <td class="auto-style1">Offer ID</td>
                 <td>
                     <asp:TextBox ID="txtofferid" runat="server" Placeholder="Offer ID" CssClass="semail" height="35px"  Width="492px" ReadOnly="True"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Select a Row" ForeColor="White" ControlToValidate="txtofferid"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style1">Elxetion Name</td>
                 <td>

                     <asp:TextBox ID="txtvotename" runat="server" placeholder="Election Name" CssClass="semail"  height="35px" Width="492px" ReadOnly="True"></asp:TextBox> 
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select a Row" ForeColor="White" ControlToValidate="txtvotename"></asp:RequiredFieldValidator>
                 </td>
             </tr>
                    <tr>
                 <td class="auto-style1">Election Status</td>
                 <td>
                     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="semail" InitialValue="0"  height="35px" Width="492px" >
                         <asp:ListItem Value="0">Select a value</asp:ListItem>
                      <asp:ListItem Value="1">Finish</asp:ListItem>
                      
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" InitialText="Select a value" ControlToValidate="DropDownList1" ErrorMessage="Please Select a value"></asp:RequiredFieldValidator>
         
                </td>

             </tr>
         </table>
           
       </div>
      
            </div>  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnsubmit" CssClass="btn btn-warning" runat="server" Text="FINISH" Height="49px" Width="326px" OnClick="btnsubmit_Click" />
         </div>
</asp:Content>

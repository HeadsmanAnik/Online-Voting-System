<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true" CodeBehind="Publish Result.aspx.cs" Inherits="WebApplication1.admin.Publish_Result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
             
   <%-- <style type="text/css">
        .auto-style1 {
            width: 346px;
        }
        .auto-style2 {
            width: 346px;
            height: 22px;
        }
        .auto-style3 {
            height: 22px;
        }
    </style>--%>
    <style type="text/css">
        .auto-style1 {
            width: 247px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container" style=" background-color:rgba(8, 3, 51, 0.85); background-position:center; text-align:center; padding:4px;height:auto;width:auto">
            <div style="background-color:rgba(6, 19, 55, 0.75); text-align:center; padding:inherit">
               <h1  style="text-align:center;color:#ffffff; width: auto;">Publish Result</h1>
                <asp:Label ID="Label1" runat="server" CssClass="btn btn-primary" ForeColor="Red" Text=""></asp:Label>
                </div>
             <strong style="color:#ffffff"  >Election Name</strong> 
              <br />
        
       <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="vote_name" DataValueField="of_id" Height="35px" Width="583px">
        <asp:ListItem Value="0">Select a Value</asp:ListItem>

    </asp:DropDownList>


  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [of_id], [vote_name] FROM [Save_result]"></asp:SqlDataSource>

  <br />
          <strong style="color:#ffffff"  >Select You want to Publish</strong> 
              <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="785px">
        <Columns>
            <asp:BoundField DataField="of_id" HeaderText="Of Id" SortExpression="of_id" />
            <asp:BoundField DataField="vote_name" HeaderText="Election Name" SortExpression="vote_name" />
            <asp:BoundField DataField="candidate_id" HeaderText="Candidate Id" SortExpression="candidate_id" />
            <asp:BoundField DataField="candidate_name" HeaderText="Candidate Name" SortExpression="candidate_name" />
            <asp:BoundField DataField="vote_sign" HeaderText="Candidate sign" SortExpression="vote_sign" />
            <asp:BoundField DataField="amount_balot" HeaderText="Amount Balot" SortExpression="amount_balot" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>"  SelectCommand="SELECT * FROM [Save_result] WHERE ([of_id] = @of_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="of_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</div>
    <div style="background-color: rgba(11, 23, 81, 0.95); text-align:center">
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="txtofr"  ErrorMessage="Please Selcet a row" ForeColor="White"></asp:RequiredFieldValidator>
     </div>
    <div>
    <table class="nav-justified" style="background-color: rgba(11, 23, 81, 0.95); color:white; height: 169px;">
        <tr>
            <td class="auto-style1" >Of ID</td>
            <td>
                <asp:TextBox ID="txtofr" runat="server" ReadOnly="True" Width="583px" Height="29px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" >Election Name</td>
            <td>
                <asp:TextBox ID="txtvotename" runat="server" ReadOnly="True" Width="583px" Height="29px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Candidate ID</td>
            <td>
                <asp:TextBox ID="txtcandidateid" runat="server" ReadOnly="True" Width="583px" Height="29px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Candidate Name</td>
            <td>
                <asp:TextBox ID="txtcandidatename" runat="server" ReadOnly="True" Width="583px" Height="29px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Candidate Sign</td>
            <td>
                <asp:TextBox ID="txtsign" runat="server" ReadOnly="True" Width="583px" Height="29px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Vote Amount</td>
            <td>
                <asp:TextBox ID="txtamountvote" runat="server" ReadOnly="True" Width="583px" Height="29px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" >Status</td>
            <td class="auto-style3">
                     <asp:TextBox ID="txtstatus" runat="server" ReadOnly="True" Width="583px" Height="29px"></asp:TextBox>

                <asp:Button ID="btnstatus" runat="server" CssClass="btn btn-success" OnClick="btnstatus_Click" Text="Get Status" Width="161px" />
            </td>
        </tr>
        
    </table>
        <div style="background-color: rgba(11, 23, 81, 0.95); text-align:center">
        <asp:Button ID="btnpublish" CssClass="btn btn-warning" runat="server" Text="Publish" Width="455px" OnClick="btnpublish_Click" />
          </div>
        </div>
</asp:Content>

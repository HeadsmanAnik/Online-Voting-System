<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true" CodeBehind="Calculateresult.aspx.cs" Inherits="WebApplication1.admin.result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <div class="container" style=" background-color:rgba(8, 3, 51, 0.85); background-position:center; text-align:center; padding:4px;height:auto;width:auto">
            <div style="background-color:rgba(6, 19, 55, 0.75); text-align:center; padding:inherit">
               <h1  style="text-align:center;color:#ffffff; width: auto;">Save Result</h1>
                <asp:Label ID="Label1" runat="server" CssClass="btn btn-primary" ForeColor="Red" Text=""></asp:Label>
                </div>
             <strong style="color:#ffffff"  >Election Name</strong> 
              <br />
            <asp:DropDownList ID="ddloffer" Height="35px" Width="288px"  runat="server" InitialValue="0" AppendDataBoundItems="True" InitialText="Select a value"  AutoPostBack="True" DataSourceID="SqlDataSource1"  DataTextField="vote_name" DataValueField="Of_id">
                 <asp:ListItem Value="0">Select a value</asp:ListItem>
            </asp:DropDownList>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [of_id], [vote_name] FROM [Creat_vote] WHERE ([status] = @status)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="status" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
             <strong style="color:#ffffff"   >Selct The Candidate To Save Result</strong> 
              <br />
           <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2345" Width="864px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
               <Columns>
                   <asp:BoundField DataField="of_id" HeaderText="of Id" SortExpression="of_id" />
                   <asp:BoundField DataField="vote_name" HeaderText="Election Name" SortExpression="vote_name" />
                   <asp:BoundField DataField="candidate_id" HeaderText="Candidate Id" SortExpression="candidate_id" />
                   <asp:BoundField DataField="candidate_name" HeaderText="Candidate Name" SortExpression="candidate_name" />
                   <asp:BoundField DataField="sign_name" HeaderText="Candidate sign" SortExpression="sign_name" />
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
            <asp:SqlDataSource ID="SqlDataSource2345" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [of_id], [vote_name], [candidate_id], [candidate_name], [sign_name] FROM [Creat_vote] WHERE ([of_id] = @of_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddloffer" Name="of_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
           </div>
    <div style="background-color:rgba(8, 3, 51, 0.85); text-align:center">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="White" ErrorMessage="Please Select a Row" ControlToValidate="txtof_id"></asp:RequiredFieldValidator></div>
    <div style="background-color:rgba(8, 3, 51, 0.85); background-position:center;  height:auto; width:auto "> 
       
                  
            <table class="nav-justified;" style="color:rgba(255, 255, 255, 0.90); width:864px; height:auto;" border="1"  >
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)" >Offer ID</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtof_id" CssClass="semail" placeholder="Offer ID" ReadOnly="True" runat="server" Width="643px">

                        </asp:TextBox>  </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)">Election Name</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        
                       <asp:TextBox ID="txtvotename" CssClass="semail" placeholder="Election Name" ReadOnly="True" runat="server" Width="643px">

                        </asp:TextBox>        
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)">Candidate ID</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        <asp:TextBox ID="txtcandidateid" CssClass="semail" placeholder="Candidate ID" ReadOnly="True" runat="server" Height="35px" Width="643px"></asp:TextBox>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)">Candidate Name</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        <asp:TextBox ID="txtcandidatename" CssClass="semail" placeholder="Candidate Name" ReadOnly="True" runat="server" Width="643px"></asp:TextBox>
                              </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)">Sign</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                         <asp:TextBox ID="txtsign" CssClass="semail" placeholder="Candidate Sign" ReadOnly="True" runat="server" Width="643px"></asp:TextBox>
                        
                         </td>
                </tr>
                <tr>
                    
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)">Vote Anount</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                         <asp:TextBox ID="txtcount" CssClass="email" Placeholder="Vote Amount" runat="server" Height="35px" Width="368px" ReadOnly="True"></asp:TextBox> <asp:Button ID="btncount" Cssclass="btn btn-warning" Width="114px" runat="server" Text="Count Vote" OnClick="btncount_Click" />
                      <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" Count Firsty" ControlToValidate="txtcount" ForeColor="White" ></asp:RequiredFieldValidator>
            --%>
                    </td>
                </tr>
            </table>
           <br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="btnsubmit" Cssclass="btn btn-warning" runat="server"  width="430px" Text="Submit" OnClick="btnsubmit_Click"  />
          
    </div>
             
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 249px;
        }
    </style>
</asp:Content>


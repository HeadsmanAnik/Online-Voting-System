<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true" CodeBehind="create vote.aspx.cs" Inherits="WebApplication1.admin.adimg.create_vote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container" style="background-color:rgba(8, 3, 51, 0.85); background-position:center; background-size: contain; height:auto; width:600px" >
        <div style="background-color:rgba(8, 3, 51, 0.85); background-position:center; text-align:center; padding:4px;height:auto;width:auto">
            <div style="background-color:rgba(6, 19, 55, 0.75); text-align:center; padding:inherit">
               <h1  style="text-align:center;color:#ffffff; width: 600px;">Election Creation</h1>
                <asp:Label ID="Label1" runat="server" CssClass="btn btn-primary" ForeColor="Red" Text=""></asp:Label>
                </div>
             <strong style="color:#ffffff"  >Election Name</strong> 
              <br />
            <asp:DropDownList ID="ddloffer" Height="35px" Width="238px"  runat="server" InitialValue="0" AppendDataBoundItems="True" InitialText="Select a value"  AutoPostBack="True" DataSourceID="SqlDataSource1"  DataTextField="vote_Name" DataValueField="Id">
                 <asp:ListItem Value="0">Select a value</asp:ListItem>
            </asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [Id], [vote_Name] FROM [offer_vote] WHERE ([status] IS NOT NULL)"></asp:SqlDataSource>
            <br />
             <strong style="color:#ffffff"  >Selct The Candidate To Assign Sign</strong> 
              <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2222222" Width="600px" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  >
                <Columns>
                    <asp:BoundField DataField="of_id" HeaderText="Of ID" SortExpression="of_id" />
                    <asp:BoundField DataField="candidate_name" HeaderText="Candidate Name" SortExpression="candidate_name" />
                    <asp:BoundField DataField="candidate_id" HeaderText="Candidate ID" SortExpression="candidate_id" />
                    <asp:BoundField DataField="requested_sign" HeaderText="Requested Sign" SortExpression="requested_sign" />
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
              <asp:SqlDataSource ID="SqlDataSource2222222" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [of_id], [candidate_name], [candidate_id], [requested_sign] FROM [join_vote] WHERE ([of_id] = @of_id)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="ddloffer" Name="of_id" PropertyName="SelectedValue" Type="Int32" />
                  </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <div style="background-color:rgba(8, 3, 51, 0.85);text-align:center"> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="White" ErrorMessage="Please Select a Row" ControlToValidate="txtof_id"></asp:RequiredFieldValidator>
               </div>
             
            </div>
            <table class="nav-justified;" style="color:rgba(255, 255, 255, 0.90); width:643px; height:auto;" border="1"  >
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)" >Offer ID</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        <asp:TextBox ID="txtof_id" CssClass="semail" placeholder="Offer ID" ReadOnly="True" runat="server" Width="643px">

                        </asp:TextBox>     </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)">Election Name</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        
                        <asp:DropDownList ID="ddlvotename" runat="server" DataSourceID="SqlDataSource233"  DataTextField="vote_Name" DataValueField="vote_Name" Heignt="35px" Width="643px" Height="38px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource233" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [Id], [vote_Name] FROM [offer_vote] WHERE ([Id] = @Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddloffer" Name="Id" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
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
                    <asp:DropDownList ID="ddlsign" runat="server" Height="35px" Width="643px">
                       
                 <asp:ListItem>Select a Sign</asp:ListItem>
                <asp:ListItem>MUG</asp:ListItem>
                <asp:ListItem>FISH</asp:ListItem>
                <asp:ListItem>BUS</asp:ListItem>
                <asp:ListItem>COMPUTER</asp:ListItem>
                <asp:ListItem>PEACOCK</asp:ListItem>
                <asp:ListItem>FOOTBALL</asp:ListItem>
                <asp:ListItem>FAN</asp:ListItem>
                <asp:ListItem>TRAIN</asp:ListItem>
                <asp:ListItem>ORANGE</asp:ListItem>
                <asp:ListItem>APPLE</asp:ListItem>
                <asp:ListItem>BAT</asp:ListItem>
                <asp:ListItem>BALL</asp:ListItem>
                <asp:ListItem>BIRD</asp:ListItem>
                <asp:ListItem>COW</asp:ListItem>
                <asp:ListItem>ELEPHANT</asp:ListItem>
                </asp:DropDownList>
                         <asp:RequiredFieldValidator runat="server" InitialValue="Select a Sign" ForeColor="White" ControlToValidate="ddlsign" ErrorMessage="Please Select a Sign"></asp:RequiredFieldValidator>
               </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)">Sign Image</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        <asp:FileUpload ID="FileUpload1" runat="server"  Width="643px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  Forecolor="White" ErrorMessage="Insert Image" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnsubmit" Cssclass="btn btn-warning" runat="server"  width="443px" Text="Submit" OnClick="btnsubmit_Click" />
          
                <br />
              <%-- <asp:DropDownList ID="ddlofferid" runat="server"    Height="29px" Width="218px" DataSourceID="SqlDataSource11" DataTextField="Id" DataValueField="Id" AutoPostBack="True">
                  
                    
               </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Id], [vote_Name] FROM [offer_vote]"></asp:SqlDataSource>
           
               <br />
             <strong style="color:#ffffff; text-align:right" > Vote Name</strong>
            <br />
                            

           
          <br />
            <asp:DropDownList ID="ddlvotename"  runat="server"   Height="29px" Width="218px" DataSourceID="SqlDataSource2" DataTextField="vote_Name" DataValueField="vote_Name">
               
            </asp:DropDownList>
               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Id], [vote_Name] FROM [offer_vote] WHERE ([Id] = @Id)">
                   <SelectParameters>
                       <asp:ControlParameter ControlID="ddlofferid" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                   </SelectParameters>
            </asp:SqlDataSource>
               <br />
             <strong style="color:#ffffff"> Candidate Id</strong>
            <br />
             
            <br />
            <asp:DropDownList ID="ddlcandidetid" runat="server"   Height="29px" Width="218px" DataSourceID="SqlDataSource1111" DataTextField="candidate_id" DataValueField="candidate_id" AutoPostBack="True">
          
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1111" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [of_id], [candidate_id] FROM [join_vote] WHERE ([of_id] = @of_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlofferid" Name="of_id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
             <strong style="color:#ffffff">Candidate Name</strong>
            <br />
            <asp:DropDownList ID="ddlcandidatename" runat="server" Height="29px" Width="218px" DataSourceID="SqlDataSource124" DataTextField="candidate_name" DataValueField="candidate_name"   >

            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource124" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT  [candidate_id], [candidate_name] FROM [join_vote] WHERE ([candidate_id] = @candidate_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlcandidetid" Name="candidate_id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
             <strong style="color:#ffffff"> Vote Sign</strong>
            <br />

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="Select a Sign" ErrorMessage="Please Select a Sign" ForeColor="White" ControlToValidate="ddlsignname"></asp:RequiredFieldValidator>           
           <br />
            
            <asp:DropDownList ID="ddlsignname" runat="server" Height="29px" Width="218px">

                <asp:ListItem>Select a Sign</asp:ListItem>
                <asp:ListItem>MUG</asp:ListItem>
                <asp:ListItem>FISH</asp:ListItem>
                <asp:ListItem>BUS</asp:ListItem>
                <asp:ListItem>COMPUTER</asp:ListItem>
                <asp:ListItem>PEACOCK</asp:ListItem>
                <asp:ListItem>FOOTBALL</asp:ListItem>
                <asp:ListItem>FAN</asp:ListItem>
                <asp:ListItem>TRAIN</asp:ListItem>
                <asp:ListItem>ORANGE</asp:ListItem>
                <asp:ListItem>APPLE</asp:ListItem>
                <asp:ListItem>BAT</asp:ListItem>
                <asp:ListItem>BALL</asp:ListItem>
                <asp:ListItem>BIRD</asp:ListItem>
                <asp:ListItem>COW</asp:ListItem>
                <asp:ListItem>ELEPHANT</asp:ListItem>

            </asp:DropDownList>
            <br />
            <strong style="color:#ffffff"> Sign Image</strong>
            <asp:FileUpload ID="FileUpload1" runat="server" Height="29px" Width="218px" />
            <br />
            <asp:Button ID="btnsubmit" Cssclass="btn btn-warning" runat="server"  width="100px" Text="Submit" OnClick="btnsubmit_Click" />--%>
            </div>
       
       
         
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 159px;
        }
    </style>
</asp:Content>


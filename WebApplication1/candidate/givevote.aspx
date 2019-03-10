<%@ Page Title="" Language="C#" MasterPageFile="~/candidate/candidatesite.Master" AutoEventWireup="true" CodeBehind="givevote.aspx.cs" Inherits="WebApplication1.candidate.give_vote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="container" style="background-position:center; height:auto; width:640px;background-color:rgba(7, 31, 61, 0.90)" >
        <div style="text-align:center; padding:4px; background-color:rgba(11, 10, 81, 0.66); height:auto;width:auto">
             <strong style="color:White">Select  Election Name From the Below List</strong>
                <br />
            <asp:DropDownList ID="DropDownList1" InitialValue="0" AppendDataBoundItems="True" InitialText="Select a value" runat="server" DataSourceID="SqlDataSource1" DataTextField="vote_name" DataValueField="of_id" Height="38px" Width="239px" AutoPostBack="True">
                <asp:ListItem Value="0">Select a value</asp:ListItem>
            </asp:DropDownList>
                 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [of_id], [vote_name] FROM [Creat_vote] WHERE ([status] IS NULL)"></asp:SqlDataSource>
            <div><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" InitialText="Select a value" ControlToValidate="DropDownList1" ErrorMessage="Please Select a value"></asp:RequiredFieldValidator>
          </div>
            <br />
            <strong style="color:White">
                Select your Candidate  From the Below List</strong>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" Width="642px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="of_id" HeaderText="Of Id" SortExpression="of_id" />
                    <asp:BoundField DataField="vote_name" HeaderText="Election Name" SortExpression="vote_name" />
                    <asp:BoundField DataField="candidate_id" HeaderText="Candidate Id" SortExpression="candidate_id" />
                    <asp:BoundField DataField="candidate_name" HeaderText="Candidate Name" SortExpression="candidate_name" />
                    <asp:BoundField DataField="sign_name" HeaderText="Candidate Sign" SortExpression="sign_name" />
                    <asp:TemplateField HeaderText="Image Sign" SortExpression="sign_pic">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sign_pic") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server"  Height="45px" Width="45px" ImageUrl='<%# Eval("sign_pic") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [of_id], [vote_name], [candidate_id], [candidate_name], [sign_name], [sign_pic] FROM [Creat_vote] WHERE ([of_id] = @of_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="of_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="Label1" runat="server" CssClass="btn btn-info" ForeColor="Red" Text=""></asp:Label>
            <br />
            <strong style="color:White">
                Fill Up the Ballot</strong>
                <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Select a Row" ForeColor="white" ControlToValidate="txtof_id" ></asp:RequiredFieldValidator>
             
            <div>
            <table class="nav-justified;" style="color:rgba(255, 255, 255, 0.90); width:643px; height:auto;" border="1"  >
                <tr>
                    <td class="auto-style1 " style="color:rgba(255, 255, 255, 0.90)" >Offer ID</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        <asp:TextBox ID="txtof_id" CssClass="semail" placeholder="Offer ID" ReadOnly="True" runat="server" Width="643px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)">Election Name</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        <asp:TextBox ID="txtvotename" CssClass="semail" placeholder="Election Name" ReadOnly="True" runat="server" Width="643px"></asp:TextBox> 
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="color:rgba(255, 255, 255, 0.90)">Candidate ID</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        <asp:TextBox ID="txtcandidateid" CssClass="semail" placeholder="Candidate ID" ReadOnly="True" runat="server" Width="643px"></asp:TextBox>
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
                        <asp:TextBox ID="txtsign" CssClass="semail" placeholder="Sign Name" runat="server" ReadOnly="True" Width="643px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="" style="color:rgba(255, 255, 255, 0.90)">Voter ID</td>
                    <td class="auto-style2" style="color:rgba(255, 255, 255, 0.90)">
                        <asp:TextBox ID="txtvoterid"  CssClass="semail"  runat="server" Width="643px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
            </table>
                <br />
                <asp:Button ID="btnsubmit" CssClass="btn btn-warning" runat="server" Text="SUBMIT" Height="49px" Width="326px" OnClick="btnsubmit_Click" />
                </div>
            <div>  </div>
        </div>
     </div>
</asp:Content>
<%--<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 169px;
        }
        .auto-style2 {
            width: 486px;
        }
    </style>
</asp:Content>--%>


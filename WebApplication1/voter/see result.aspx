<%@ Page Title="" Language="C#" MasterPageFile="~/voter/votersite.Master" AutoEventWireup="true" CodeBehind="see result.aspx.cs" Inherits="WebApplication1.voter.see_result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container"  style=" background-position:center; background-size: contain; width: auto;">
       <div style="text-align:center; padding:5.4px;height:auto; width:auto;  margin-right: 0px;">
           <div style="background-color:rgba(5, 24, 70, 0.80); padding:inherit">
               <h1  style="text-align:center;color:#ffffff; width: auto;">Election Name</h1>
               <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" AppendDataBoundItems="true" DataSourceID="SqlDataSource1" DataTextField="vote_name" DataValueField="of_id" Height="30px" Width="369px">
                    <asp:ListItem Value="0">Select a Value</asp:ListItem>
               </asp:DropDownList>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT [of_id], [vote_name] FROM [publish_result]"></asp:SqlDataSource>
           </div>
            <div style="background-color:rgba(5, 24, 70, 0.80); padding:inherit">
               <h1  style="text-align:center;color:#ffffff; width: auto;">Result</h1>
            
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" Width="809px" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="of_id" HeaderText="OF ID" SortExpression="of_id" />
                        <asp:BoundField DataField="vote_name" HeaderText="Election Name" SortExpression="vote_name" />
                        <asp:BoundField DataField="candidate_id" HeaderText="Candidate ID" SortExpression="candidate_id" />
                        <asp:BoundField DataField="candidate_name" HeaderText="Candidate Name" SortExpression="candidate_name" />
                        <asp:BoundField DataField="vote_sign" HeaderText="Vote Sign" SortExpression="vote_sign" />
                        <asp:BoundField DataField="amount_balot" HeaderText="Total Balot" SortExpression="amount_balot" />
                        <asp:BoundField DataField="Stataus" HeaderText="Status" SortExpression="Stataus" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT DISTINCT * FROM [publish_result] WHERE ([of_id] = @of_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="of_id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </div>
           </div>
         </div>
</asp:Content>

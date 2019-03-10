<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true" CodeBehind="Candidate list.aspx.cs" Inherits="WebApplication1.admin.Candidatelist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container"  style=" background-position:center; background-size: contain; width: 888px;">
       <div style="text-align:center; padding:5.4px;height:auto; width:859px;background-color:rgba(21, 98, 235, 0.85)">
            <asp:TextBox ID="txtnid"   placeholder="Search here..." MaxLength="13" onkeypress="return isNumber(event)" runat="server" Height="30px" Width="202px"></asp:TextBox>
           <asp:Button ID="btnsubmit" CssClass="btn btn-primary" runat="server" Text="Search" Width="153px" OnClick="btnsubmit_Click" />
       </div>
         
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="NID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Height="216px" Width="888px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="None" OnRowDataBound="GridView1_RowDataBound1">
         <Columns>
             <asp:BoundField DataField="NID" HeaderText="NID" ReadOnly="True" SortExpression="NID" />
             <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
             <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
             <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
             <asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact" />
             <asp:BoundField DataField="date_of_birth" HeaderText="Date of Birth" SortExpression="date_of_birth" />
             <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
             <asp:TemplateField HeaderText="Image" SortExpression="pic">
                 <EditItemTemplate>
                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pic") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Image ID="Image1" runat="server" height="30px" Width="35px" ImageUrl='<%# Eval("pic") %>' />
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:CommandField ShowDeleteButton="True">
             <ControlStyle CssClass="btn btn-primary" />
             </asp:CommandField>
         </Columns>
         <FooterStyle BackColor="White" ForeColor="#000066" />
         <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
         <RowStyle ForeColor="#000066" />
         <SelectedRowStyle BackColor="#669999" ForeColor="White" Font-Bold="True" />
         <SortedAscendingCellStyle BackColor="#F1F1F1" />
         <SortedAscendingHeaderStyle BackColor="#007DBB" />
         <SortedDescendingCellStyle BackColor="#CAC9C9" />
         <SortedDescendingHeaderStyle BackColor="#00547E" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [registration_info] WHERE [NID] = @NID" InsertCommand="INSERT INTO [registration_info] ([NID], [name], [gender], [address], [contact], [date_of_birth], [Type], [pic]) VALUES (@NID, @name, @gender, @address, @contact, @date_of_birth, @Type, @pic)" SelectCommand="SELECT [NID], [name], [gender], [address], [contact], [date_of_birth], [Type], [pic] FROM [registration_info]" UpdateCommand="UPDATE [registration_info] SET [name] = @name, [gender] = @gender, [address] = @address, [contact] = @contact, [date_of_birth] = @date_of_birth, [Type] = @Type, [pic] = @pic WHERE [NID] = @NID">
             <DeleteParameters>
                 <asp:Parameter Name="NID" Type="Int64" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="NID" Type="Int64" />
                 <asp:Parameter Name="name" Type="String" />
                 <asp:Parameter Name="gender" Type="String" />
                 <asp:Parameter Name="address" Type="String" />
                 <asp:Parameter Name="contact" Type="String" />
                 <asp:Parameter Name="date_of_birth" DbType="Date" />
                 <asp:Parameter Name="Type" Type="String" />
                 <asp:Parameter Name="pic" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="name" Type="String" />
                 <asp:Parameter Name="gender" Type="String" />
                 <asp:Parameter Name="address" Type="String" />
                 <asp:Parameter Name="contact" Type="String" />
                 <asp:Parameter Name="date_of_birth" DbType="Date" />
                 <asp:Parameter Name="Type" Type="String" />
                 <asp:Parameter Name="pic" Type="String" />
                 <asp:Parameter Name="NID" Type="Int64" />
             </UpdateParameters>
         </asp:SqlDataSource>
        <br />
        
        <%--<asp:Image ID="Image2" Height="30px" Width="30px" runat="server" />--%>
        <div>
            
            <div>
                <asp:table id="Table1" OnEmptyDataBinding="No record" runat="server" 
        CellPadding="3" CellSpacing="3"
        Gridlines="both" Height="104px" Width="206px" ForeColor="#000000" backcolor="YellowGreen" HorizontalAlign="Center">
        <asp:TableRow  runat="server">
            <asp:TableCell runat="server" Text="NID"></asp:TableCell>
             <asp:TableCell runat="server" > <asp:Label ID="ldlnid" runat="server" Text=""></asp:Label></asp:TableCell>
            
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server" Text="Name"></asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Label ID="lblname" runat="server" Text=""></asp:Label></asp:TableCell>
        </asp:TableRow>
                     <asp:TableRow runat="server">
            <asp:TableCell runat="server" Text="Gender"></asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Label ID="lblgender" runat="server" Text=""></asp:Label></asp:TableCell>
        </asp:TableRow>
                     <asp:TableRow runat="server">
            <asp:TableCell runat="server" Text="Address"></asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Label ID="lbladdress" runat="server" Text=""></asp:Label></asp:TableCell>
        </asp:TableRow>
                     <asp:TableRow runat="server">
            <asp:TableCell runat="server" Text="Contact"></asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Label ID="lblcontact" runat="server" Text=""></asp:Label></asp:TableCell>
        </asp:TableRow>
                     <asp:TableRow runat="server">
            <asp:TableCell runat="server" Text="Birth Date"></asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Label ID="lblage" runat="server" Text=""></asp:Label></asp:TableCell>
        </asp:TableRow>
                     <asp:TableRow runat="server">
            <asp:TableCell runat="server" Text="User Type"></asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Label ID="lbltype" runat="server" Text=""></asp:Label></asp:TableCell>
        </asp:TableRow>
                     <asp:TableRow runat="server">
            <asp:TableCell runat="server" Text="Image"></asp:TableCell>
            <asp:TableCell runat="server">
                <asp:Image ID="Image2" Height="100px" width="100px" runat="server" /></asp:TableCell>
        </asp:TableRow>
    </asp:table>
                <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
            </div>
        </div>
     </div>
 <%--</div>--%>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
   <script>
        function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
       }
   </script>
</asp:Content>


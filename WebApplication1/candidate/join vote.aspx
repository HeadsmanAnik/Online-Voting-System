<%@ Page Title="" Language="C#" MasterPageFile="~/candidate/candidatesite.Master" AutoEventWireup="true" CodeBehind="join vote.aspx.cs" Inherits="WebApplication1.candidate.join_vote" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <script>
     function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
       }

       function MinLength(sender, args) {
         args.IsValid = (args.Value.length >= 8);
       }
        function phoneMinLength(sender, args) {
         args.IsValid = (args.Value.length >= 11);
       }
      
     
   </script>
   
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="background-color:rgba(6, 19, 55, 0.75); background-position:center; background-size: contain; height:auto; width:600px" >
        <div style="background-color:rgba(6, 19, 55, 0.75); padding:4px;height:auto;width:600px">
            <div style="background-color:rgba(6, 19, 55, 0.75); padding:inherit">
               <h1  style="text-align:center;color:#ffffff; width: 600px;">Election Registration</h1>
                <asp:Label ID="Label1" runat="server" CssClass="btn btn-primary" ForeColor="Red" Text=""></asp:Label>
           </div>
           
            <div><asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="MinLength" ControlToValidate="txtnid" ErrorMessage="Please Insert 8 character" ForeColor="White"></asp:CustomValidator></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Nid Can not be null" ControlToValidate="txtnid" ForeColor="White"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtnid" CssClass="date" placeholder="Your NID" onkeypress="return isNumber(event)" MaxLength="8" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name Can not be null" ControlToValidate="txtname" ForeColor="White"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a valid Name" ValidationExpression="^[a-zA-Z'.\s]{1,50}" Font-Italic="False" ControlToValidate="txtname" ForeColor="White"></asp:RegularExpressionValidator>
             <asp:TextBox ID="txtname" CssClass="date" placeholder="Your Name" runat="server"></asp:TextBox>
           
            <div><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ForeColor="White" InitialValue="0" InitialText="Select a value" ControlToValidate="ddlelectionname" ErrorMessage="Please Select a value"></asp:RequiredFieldValidator>
          </div>
            <asp:DropDownList ID="ddlelectionname" runat="server" InitialValue="0" AppendDataBoundItems="True" InitialText="Select a value" DataSourceID="SqlDataSource13" DataTextField="vote_Name" DataValueField="Id" Height="29px" Width="218px">
                <asp:ListItem Value="0">Select a value</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT [Id], [vote_Name], [status] FROM [offer_vote] WHERE ([status] IS NULL)" >
            </asp:SqlDataSource>
           
            <br />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please request a sign" ControlToValidate="txtreqsign" ForeColor="White"></asp:RequiredFieldValidator>
             <asp:TextBox ID="txtreqsign" CssClass="date" placeholder="Your Asking Sign" runat="server"></asp:TextBox>
           
           
            <asp:Button ID="btnsubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnsubmit_Click" Width="233px" />
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>
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
         args.IsValid = (args.Value.length >= 13);
       }
        function phoneMinLength(sender, args) {
         args.IsValid = (args.Value.length >= 11);
       }
        function passMinLength(sender, args) {
         args.IsValid = (args.Value.length >= 8);
       }
      
     
   </script>
   
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container"  style="background-image:url(img/login1.jpg); background-position:center; background-size: contain; height:auto">
         <div id="login-box"style="background-color:rgba(63, 122, 228, 0.29);height:400px ">
                <h1 class="log" style="color:white">Sign In</h1>
             <h2> <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2>
             <div>
                 <asp:Label ID="Label2" runat="server" CssClass="btn btn-danger" forecolor="white" Text=""></asp:Label>
                 <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="MinLength" ErrorMessage="Please Insert 8 character" ForeColor="White" ControlToValidate="txtnid"></asp:CustomValidator>

                   </div> <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter a valid NID" ValidationExpression="^([]?[0-9]\d*|0)" Font-Italic="False" ControlToValidate="txtnid" ForeColor="#CCFFFF"></asp:RegularExpressionValidator>
             
             
                
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Insert NID" ControlToValidate="txtnid" ForeColor="White"></asp:RequiredFieldValidator>
                 <asp:TextBox ID="txtnid" CssClass="lusername" placeholder="Your NID" MaxLength="13" onkeypress="return isNumber(event)" runat="server"></asp:TextBox>
              <div>
                 <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="passMinLength" ErrorMessage="Password Contain at least 8 character" ForeColor="White" ControlToValidate="txtpass"></asp:CustomValidator>
                 
                  
             </div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Insert Password" ControlToValidate="txtpass" ForeColor="White"></asp:RequiredFieldValidator>
                  <asp:TextBox ID="txtpass" CssClass="lpassword" placeholder="your Password" Type="password" runat="server"></asp:TextBox>
                  <asp:Button ID="btnlogin" CssClass="btn btn-primary" type="submit" name="signin_submit" runat="server" Text="Login" OnClick="btnlogin_Click" />
                 <%-----  <asp:Button ID="Button1" CssClass="btn btn-primary" type="register" name="signin_submit" runat="server" Text="Register" OnClick="Button1_Click" />-----%>
                

             <asp:HyperLink ID="HyperLink1" CssClass="btn btn-primary" href="/registration.aspx" runat="server">New Register</asp:HyperLink>
           
             
    </div>
        
         
        </div>
</asp:Content>

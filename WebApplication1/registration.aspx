<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="WebApplication1.registration" %>
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
       function nidMinLength(sender, args) {
         args.IsValid = (args.Value.length >= 13);
       }
        function phoneMinLength(sender, args) {
         args.IsValid = (args.Value.length >= 11);
       }
      
     
   </script>
   
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container"  style="background-image:url(img/login1.jpg); background-position:center; background-size: contain;height:auto;">

     <div id="signup-box" style="background-color:rgba(63, 122, 228, 0.29);">
              <div class="left">
                <h1 class="sign" style="color:aliceblue">Sign up</h1>
                  <asp:Label ID="Label1" runat="server" Class="btn btn-primary" Text="" ForeColor="Red"></asp:Label>
                    <div><asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="nidMinLength" ErrorMessage="please insert  8 characters" ControlToValidate="txtnid" ForeColor="#CCFFFF"></asp:CustomValidator></div>
                  <div><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please insert your NID" ControlToValidate="txtnid" ForeColor="#CCFFFF"></asp:RequiredFieldValidator></div>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter a valid NID" ValidationExpression="^([]?[0-9]\d*|0)" Font-Italic="False" ControlToValidate="txtnid" ForeColor="#CCFFFF"></asp:RegularExpressionValidator>
                  <asp:TextBox ID="txtnid" CssClass="susername" placeholder="NID" runat="server" MaxLength="13"  onkeypress="return isNumber(event)"></asp:TextBox>  
                  <div> <div><asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="MinLength" ErrorMessage="please insert at least 8 characters" ControlToValidate="txtpass" ForeColor="#CCFFFF"></asp:CustomValidator></div> </div>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="please insert your password" ControlToValidate="txtpass" ForeColor="#CCFFFF"></asp:RequiredFieldValidator>
                  <asp:TextBox ID="txtpass" CssClass="spassword" placeholder="Password" Type="password" runat="server" MaxLength="16" TextMode="Password"></asp:TextBox>

                 <div> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="please insert your name"  ControlToValidate="txtname" ForeColor="#CCFFFF"></asp:RequiredFieldValidator></div>
                <%-- <div> <asp:RegularExpressionValidator ID="regName" runat="server" 
                         ControlToValidate="txtName" 
                          ValidationExpression="^[a-zA-Z'.\s]{1,50}"
       Text="Enter a valid name" />   </div>--%>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a valid Name" ValidationExpression="^[a-zA-Z'.\s]{1,50}" Font-Italic="False" ControlToValidate="txtname" ForeColor="#CCFFFF"></asp:RegularExpressionValidator>
                  <asp:TextBox ID="txtname" CssClass="semail" placeholder="Your Name" Type="checkname" runat="server" ></asp:TextBox>
                <h1 class="tign" style="color:aliceblue">Gender</h1>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  InitialValue="Select a value" runat="server" ErrorMessage="Please Select a value" ControlToValidate="txtgender" ForeColor="White"></asp:RequiredFieldValidator>                 
                  <asp:DropDownList ID="txtgender" CssClass="sgender" runat="server">
                       <asp:ListItem>Select a value</asp:ListItem>
                      <asp:ListItem>Male</asp:ListItem>
                      <asp:ListItem>Female</asp:ListItem>
                      <asp:ListItem>Others</asp:ListItem>
                  </asp:DropDownList> 
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="please inser your address" ControlToValidate="address" ForeColor="#CCFFFF"></asp:RequiredFieldValidator>
                  <asp:TextBox ID="address" Cssclass="scontact" placeholder="Your Address" runat="server"></asp:TextBox>

               <%--- <input type="submit" class="ssignup" name="signup_submit" value="Sign me up" />----%> 
                 
                  <div><asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="phoneMinLength" ErrorMessage="please insert  11 characters" ControlToValidate="txtcontact" ForeColor="#CCFFFF"></asp:CustomValidator></div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="please inser your contact" ControlToValidate="txtcontact" ForeColor="#CCFFFF"></asp:RequiredFieldValidator>
                
                  <asp:TextBox ID="txtcontact" CssClass="scontact" onkeypress="return isNumber(event)" placeholder="Your Phone no." Type="tel" runat="server" MaxLength="11"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Date of Birth Can not Be Null" ControlToValidate="txtage" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtage" CssClass="sage" placeholder="Date Of Birth" runat="server"  EnableViewState="False" MaxLength="100" OnTextChanged="txtage_TextChanged"></asp:TextBox>
                 
                  <h1 class="tign" style="color:aliceblue">Sign up as</h1> 
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" InitialValue="Select a value" runat="server" ErrorMessage="Please Select a value" ControlToValidate="txtusertype" ForeColor="White"></asp:RequiredFieldValidator>
                  <asp:DropDownList ID="txtusertype" CssClass="sgender" runat="server">
                      <asp:ListItem>Select a value</asp:ListItem>
                      <asp:ListItem>Candidate</asp:ListItem>
                      <asp:ListItem>Voter</asp:ListItem>
                  </asp:DropDownList>
                  <asp:FileUpload ID="FileUpload1" runat="server" />
                  <asp:Button ID="btnsubmit" CssClass="ssignup" type="submit"   name="signup_submit" runat="server"  Text="Sign up" onclick="btnsubmit_Click"/>  &nbsp;</div>
        
             </div>
            </div>
</asp:Content>

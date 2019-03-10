<%@ Page Title="" Language="C#" MasterPageFile="~/candidate/candidatesite.Master" AutoEventWireup="true" CodeBehind="add feedback.aspx.cs" Inherits="WebApplication1.candidate.add_feedback" %>
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
       </script>
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container" style="background-position:center; height:550px; width:400px">
        <div style="text-align:center; padding:4px; background-color:rgba(11, 10, 81, 0.66); height:auto;width:auto">
            <h1 style="text-align:center; color:white;width:auto">
                Feedback
                
            </h1>
            <br />
                 <asp:Label ID="Label1" CssClass="btn btn-primary" ForeColor="Red" runat="server" Text=""></asp:Label>
        </div>
        <div style="background-color:rgba(11, 10, 81, 0.66);height:auto;width:auto "> 
             <div> <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="MinLength"  ErrorMessage="please insert  8 characters" ControlToValidate="txtID" ForeColor="#FFFF66"></asp:CustomValidator>

             </div>
        <asp:TextBox ID="txtID"  Cssclasss="date" placeholder="NID" MaxLength="8" onkeypress="return isNumber(event)" runat="server" Width="190px" ReadOnly="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="NID can Not Be Null" ForeColor="#FFFF66" ControlToValidate="txtID"> </asp:RequiredFieldValidator>   
            <br />
           
            <br />
        <asp:TextBox ID="txtcomment" Cssclasss="date" placeholder="Comment/Feedback" runat="server" Height="52px" Width="190px"></asp:TextBox>    
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please insert comment" ForeColor="#FFFF66" ControlToValidate="txtcomment"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:TextBox ID="txtdate" Cssclasss="date" placeholder="Date" runat="server" Width="190px"></asp:TextBox>    
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please insert Date" ForeColor="#FF3300" ControlToValidate="txtdate"></asp:RequiredFieldValidator>
            <br />
            <br />
        <asp:Button ID="btnsubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnsubmit_Click" />

            
        </div>
       
    </div>
</asp:Content>

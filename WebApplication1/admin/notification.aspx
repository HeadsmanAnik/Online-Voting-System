<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true" CodeBehind="notification.aspx.cs" Inherits="WebApplication1.admin.notification" %>
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
       </script>
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="background-position:center; height:650px; width:400px">
        <div style="text-align:center; padding:4px; background-color:rgba(12, 233, 219, 0.86); height:auto;width:auto">
            <h1 style="text-align:center; color:white;width:auto">
                Notification<br />
                 <asp:Label ID="Label1" runat="server" CssClass="btn btn-primary" ForeColor="OrangeRed" Text=""></asp:Label>
            </h1>
        </div>
        <div style="background-color:rgba(12, 233, 219, 0.86);height:auto;width:auto "> 
             <div> <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="MinLength"  ErrorMessage="please insert  8 characters" ControlToValidate="txtNID" ForeColor="#FF3300"></asp:CustomValidator>

             </div>
        <asp:TextBox ID="txtNID"  Cssclasss="date" placeholder="Admin NID" MaxLength="13" onkeypress="return isNumber(event)" runat="server" Text='<%=Session["NID"]%>' Width="190px" ReadOnly="True" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="NID can Not Be Null" ForeColor="#FF3300" ControlToValidate="txtNID"> </asp:RequiredFieldValidator>   
            <br />
           
            <br />
        <asp:TextBox ID="txtnotification" Cssclasss="date" placeholder="Notification" runat="server" Height="52px" Width="190px" ></asp:TextBox>    
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please insert notice" ForeColor="#FF3300" ControlToValidate="txtnotification"></asp:RequiredFieldValidator>
            <br />
            <br />
             <asp:TextBox ID="txtdate" Cssclasss="date" placeholder="Date" runat="server" Width="190px" ReadOnly="True"></asp:TextBox>    
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please insert Date" ForeColor="#FF3300" ControlToValidate="txtdate"></asp:RequiredFieldValidator>
            <br />
            <br />
        <asp:Button ID="btnsubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnsubmit_Click" />

            
        </div>
       
    </div>
</asp:Content>

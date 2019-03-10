<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true" CodeBehind="offer vote.aspx.cs" Inherits="WebApplication1.admin.offer_vote" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">

    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container"  style="background-image:url(adimg/img1.jpg); background-position:center; background-size: contain; height:auto">

     <div id="offer_vote-box" style="background-color:rgba(63, 122, 228, 0.29); height:auto">
        
                    
                     <asp:Label ID="Label1" runat="server"  Text="" Class="btn btn-primary" ForeColor="Red"></asp:Label>

         <h1 class="log" style="color:white">Offer Election</h1>
               
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please insert Vote Name" ControlToValidate="txtname" ForeColor="#FF3300"> </asp:RequiredFieldValidator>
             <asp:TextBox ID="txtname" CssClass="date" placeholder="Vote Name" runat="server"></asp:TextBox>
            <br />
         <strong style=" color:white">Date of Election</strong> 
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Date can not be null" ControlToValidate="txtdate" ForeColor="#FF3300"></asp:RequiredFieldValidator>
         <asp:TextBox ID="txtdate" CssClass="date" placeholder="Date" runat="server"></asp:TextBox>
         <br />
        <strong style=" color:white"> Deadline of Registration</strong> 
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Date can not be null" ControlToValidate="txtregdate" ForeColor="#FF3300"></asp:RequiredFieldValidator>
         <asp:TextBox ID="txtregdate" CssClass="date" placeholder="Date" runat="server"></asp:TextBox>
         <asp:Button ID="btnlogin" CssClass="lsignin" type="submit" name="signin_submit" runat="server" Text="Submit" OnClick="btnlogin_Click" />
         <asp:Button ID="Button1" CssClass="lsignin" runat="server" Text="Reset" OnClick="Button1_Click" />
         </div>
       
        </div>
</asp:Content>

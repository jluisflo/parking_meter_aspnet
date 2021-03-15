<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container">
	        <div class="login-container">
                <div id="output"></div>
                    <div class="avatar"><i class="glyphicon glyphicon-user"></i></div>
                    <div class="form-box">
                     
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="req1" runat="server" ErrorMessage="Requerido" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                       
                         <asp:TextBox ID="TextBox2" TextMode="Password" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="req2" runat="server" ErrorMessage="Requerido" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
<br />
                        <div class="text-center">
            <asp:Label ID="lblError" runat="server" CssClass="alert alert-danger" Text="credenciales incorrectas." Visible="False"></asp:Label>
          </div>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Iniciar Sesión" OnClick="Button1_Click" />
                    </div>
                     
            </div>    
        </div>

</asp:Content>


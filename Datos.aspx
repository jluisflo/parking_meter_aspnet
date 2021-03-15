<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Datos.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row section">
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">Opciones</div>
                <div class="panel-body">
                    <div class="list-group">
                        <a href="Control.aspx" class="list-group-item">Control</a>
                        <a href="Clientes.aspx" class="list-group-item">Clientes en parqueo</a>
                        <a href="RegistroSalidas.aspx" class="list-group-item">Salidas</a>
                        <a href="Operarios.aspx" class="list-group-item">Operarios</a>
                        <a href="Datos.aspx" class="list-group-item">Datos de Parqueo</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Capacidad de estacionamientos
                </div>
                <div class="panel-body">
                    <asp:TextBox ID="txtCapacidad" CssClass="form-control" style="width:300px" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="re1" runat="server" ErrorMessage="Requerido" ControlToValidate="txtCapacidad" ValidationGroup="Capacidad"></asp:RequiredFieldValidator>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnCapacidad" runat="server" Text="Guardar" OnClick="btnCapacidad_Click"  ValidationGroup="Capacidad" />
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Tarifa por minuto
                </div>
                <div class="panel-body">
                    <asp:TextBox ID="txtTarifa" CssClass="form-control" style="width:300px" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="re2" runat="server" ErrorMessage="Requerido" ControlToValidate="txtTarifa" ValidationGroup="tarifa"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="tarifa" ID="Reg1" runat="server" ErrorMessage="Error, verifique" ControlToValidate="txtTarifa" ValidationExpression="^(?!0\.00)\d{1,3}(,\d{3})*(\.\d\d)?$">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnTarifa" runat="server" Text="Guardar" OnClick="btnTarifa_Click" ValidationGroup="tarifa" />
                </div>
            </div>
        </div>
        </div>
</asp:Content>


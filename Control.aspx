<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Control.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container section">
        <div class="row">
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
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                Status
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6 text-center">
                                        <span class="animated infinite flash">
                                            <asp:Label ID="lblDis" runat="server" ForeColor="Green" class="status-lbl" Text="n"></asp:Label>
                                        </span>
                                        <h4>Disponibles</h4>
                                    </div>
                                    <div class="col-md-6 text-center">
                                        <asp:Label ID="lblOcu" runat="server" ForeColor="Red" CssClass="status-lbl" Text="n"></asp:Label>
                                        <h4>Ocupados</h4>
                                    </div>
                                    <h5 class="text-center">Total <asp:Label ID="Label3" runat="server"></asp:Label></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />

                <div class="row">
                    <div class="col-md-6">
                        <asp:Button ID="Button2" data-toggle="modal" data-target="#myModal" runat="server" CssClass="btn btn-success btn-lg btn-block" Text="Registrar Entrada" />
                    </div>
                    <div class="col-md-6">
                        <a href="Salida.aspx" class="btn btn-danger btn-lg btn-block">Registrar Salida</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Registrar Ingreso</h4>
          </div>
          <div class="modal-body">
              <div class="forom-group">
                  <label>N° Placa:</label>
                  <asp:TextBox ID="txtplaca" CssClass="form-control" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="reqplac" runat="server" ErrorMessage="Requerido" ControlToValidate="txtplaca"></asp:RequiredFieldValidator>
              </div>
             
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              <asp:Button ID="btnIngreso" runat="server" cssClass="btn btn-primary" Text="Registrar" OnClick="btnIngreso_Click" />
          </div>
        </div>
      </div>
    </div>
</asp:Content>


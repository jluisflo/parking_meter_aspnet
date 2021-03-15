<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Operarios.aspx.cs" Inherits="_Default" %>

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

            <div class="panel panel-default">
                <div class="panel-heading">
                    Usuarios Existentes
                </div>
                <div class="panel-body">

                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" >
                            <ControlStyle CssClass="btn btn-info btn-xs" ForeColor="White" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#FFECB3" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>

                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnModalNuevo" OnClick="btnModalAgregar_Click" runat="server" cssClass="btn btn-primary" Text="Nuevo" />
                    <asp:Button ID="btnModalModificar" OnClick="btnModalModificar_Click" runat="server" cssClass="btn btn-warning pull-right" Text="Modificar" Enabled="False" />
                    <asp:Button ID="btnModalEliminar" OnClick="btnModalEliminar_Click" runat="server" cssClass="btn btn-danger pull-right" Text="Eliminar" Enabled="False" />
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Operacion para operador</h4>
          </div>
          <div class="modal-body">
               <div class="form-group">
                   <label>Codigo:</label>
                   <asp:TextBox ID="txtId" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
               </div>
               <div class="form-group">
                   <label>Nombre:</label>
                   <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="re1" runat="server" ErrorMessage="Requerido" ControlToValidate="txtNombre" ValidationGroup="modal"></asp:RequiredFieldValidator>
               </div>
              <div class="form-group">   
                   <label>Apellidos:</label>
                   <asp:TextBox ID="txtApellidos" CssClass="form-control" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="re2" runat="server" ErrorMessage="Requerido" ControlToValidate="txtApellidos" ValidationGroup="modal"></asp:RequiredFieldValidator>
              </div>
              <div class="form-group"> 
                   <label>Usuario:</label>
                   <asp:TextBox ID="txtUsu" CssClass="form-control" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="re3" runat="server" ErrorMessage="Requerido" ControlToValidate="txtUsu" ValidationGroup="modal"></asp:RequiredFieldValidator>
              </div>
              <div class="form-group"> 
                   <label>Contraseña:</label>
                   <asp:TextBox ID="txtPass" CssClass="form-control" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="re4" runat="server" ErrorMessage="Requerido" ControlToValidate="txtPass" ValidationGroup="modal"></asp:RequiredFieldValidator>
               </div>
          </div>
         
          <div class="modal-footer">
              <asp:Button ID="btnOpe" runat="server" CssClass="btn btn-primary" Text="Realizar operacion" OnClick="btnOpe_Click" ValidationGroup="modal" />
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
          </div>
      </div>
      </div>
    
 
     <script type="text/javascript">
         function openModal() {
             
             $('#modal').modal('show');
         }
    </script>

</asp:Content>


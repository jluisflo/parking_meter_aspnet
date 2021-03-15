<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Salida.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <br />
    <br />
    <br />
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">Buscar</div>
                    <div class="panel-body"> 
                        <div class="form-group">
                            <label>Placa</label>
                            <asp:TextBox ID="search" onkeyup="doSearch()" CssClass="form-control form-lg" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="req" runat="server" ErrorMessage="requerido" ControlToValidate="search"></asp:RequiredFieldValidator>
                             </div>
                    </div>
                    <div class="panel-footer">
                        <asp:Button ID="btntarifa" runat="server" CssClass="btn btn-primary btn-lg" Text="Calcular Tarifa" OnClick="btntarifa_Click" />
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="panel panel-primary">
                    <div class="panel-heading">Clientes en Parqueo</div>
                    <div class="panel-body"> 
                        <asp:GridView ID="GridView1" CssClass="resultados" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
     <div class="modal fade" id="modalPagar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Registrar Ingreso</h4>
          </div>
          <div class="modal-body text-center">
              <asp:Label ID="lblTarifa" ForeColor="Green" Font-Size="60px" CssClass="text-center" runat="server" Text=""></asp:Label>
              <br />
              <h4>Minutos: 
              <asp:Label ID="lblMinutos" CssClass="text-center" runat="server" Text=""></asp:Label>
              </h4>
              <asp:Button ID="btnIngreso" runat="server" cssClass="btn btn-primary btn-block" Text="Registrar salida" OnClick="btnIngreso_Click" />
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>

<script type="text/javascript">
    function openModalPagar() {
        $('#modalPagar').modal('show');
    }
    function doSearch() {
        var tableReg = document.getElementById('MainContent_GridView1');
        var searchText = document.getElementById('MainContent_search').value.toLowerCase();
        var cellsOfRow = "";
        var found = false;
        var compareWith = "";

        // Recorremos todas las filas con contenido de la tabla
        for (var i = 1; i < tableReg.rows.length; i++) {
            cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
            found = false;
            // Recorremos todas las celdas
            for (var j = 0; j < cellsOfRow.length && !found; j++) {
                compareWith = cellsOfRow[j].innerHTML.toLowerCase();
                // Buscamos el texto en el contenido de la celda
                if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1)) {
                    found = true;
                }
            }
            if (found) {
                tableReg.rows[i].style.display = '';
            } else {
                // si no ha encontrado ninguna coincidencia, esconde la
                // fila de la tabla
                tableReg.rows[i].style.display = 'none';
            }
        }
    }
</script>

</asp:Content>


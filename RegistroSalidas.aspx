<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RegistroSalidas.aspx.cs" Inherits="_Default" %>

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
                        registro de salidas
                    </div>
                    <div class="panel-body">
                        <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
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
                    <div class="panel-footer">
                        <div class="form-inline">
                            <label>Buscar:</label>
                            <input type="search" id="search" onkeyup="doSearch()" style="width:300px" class="form-control" />
                        </div>
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
        var searchText = document.getElementById('search').value.toLowerCase();
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


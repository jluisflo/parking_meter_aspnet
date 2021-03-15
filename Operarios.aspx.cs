using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string operacion;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["operador"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            cargarDatos();
        }
    }

    void cargarDatos()
    {
        using (DBDataContext db = new DBDataContext())
        {
            GridView1.DataSource = db.Operadores;
            GridView1.DataBind();
        }
    }

    protected void btnOpe_Click(object sender, EventArgs e)
    {

        switch (ViewState["operacion"].ToString())
        {
            case "A":
                using (DBDataContext db = new DBDataContext())
                {
                    Operadore ope = new Operadore
                    {
                        nombre = txtNombre.Text,
                        apellidos = txtApellidos.Text,
                        usuario = txtUsu.Text,
                        contraseña = txtPass.Text
                    };
                    db.Operadores.InsertOnSubmit(ope);
                    db.SubmitChanges();
                }
                break;
            case "D":
                using (DBDataContext db = new DBDataContext())
                {
                    Operadore ope = db.Operadores.Single(p => p.idOperador == int.Parse(txtId.Text));
                    db.Operadores.DeleteOnSubmit(ope);
                    db.SubmitChanges();
                }
                break;
            case "U":
                using (DBDataContext db = new DBDataContext())
                {
                    Operadore ope = db.Operadores.Single(p => p.idOperador == int.Parse(txtId.Text));
                    ope.nombre = txtNombre.Text;
                    ope.apellidos = txtApellidos.Text;
                    ope.usuario = txtUsu.Text;
                    ope.contraseña = txtPass.Text;
                    db.SubmitChanges();
                }
                break;
        }
            Response.Redirect(Request.Url.AbsoluteUri);//Para evitar doble insercion al refrescar navegador
        
    }

    protected void btnModalAgregar_Click(object sender, EventArgs e)
    {
        ViewState["operacion"] = "A";
        limpiar();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
         
    }

    protected void btnModalEliminar_Click(object sender, EventArgs e)
    {
        ViewState["operacion"] = "D";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
    }

    protected void btnModalModificar_Click(object sender, EventArgs e)
    {
        ViewState["operacion"] = "U";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
    }

    void limpiar()
    {
        txtId.Text = "";
        txtNombre.Text = "";
        txtApellidos.Text = "";
        txtUsu.Text = "";
        txtPass.Text = "";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnModalModificar.Enabled=true;
        btnModalEliminar.Enabled = true;
        GridViewRow row = GridView1.SelectedRow;
        txtId.Text = row.Cells[1].Text;
        txtNombre.Text = row.Cells[2].Text;
        txtApellidos.Text = row.Cells[3].Text;
        txtUsu.Text = row.Cells[4].Text;
        txtPass.Text = row.Cells[5].Text;
    }
}
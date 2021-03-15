using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["operador"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        using (DBDataContext db = new DBDataContext())
        {
            var enparqueo = from reg in db.Registros
                            join par in db.EnParqueos on reg.idRegistro equals par.idRegistro
                            select new { reg.idRegistro, reg.placa, reg.fechaEntrada };

            GridView1.DataSource = enparqueo;
            GridView1.DataBind();
        }
    }
}
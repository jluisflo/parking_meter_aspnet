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

            GridView1.DataSource = db.Registros.OrderByDescending(x => x.idRegistro).Where(x => x.fechaSalida!=null);
            GridView1.DataBind();
        }
    }
}
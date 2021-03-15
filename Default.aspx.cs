using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["operador"] != null)
            {
                Response.Redirect("~/Control.aspx");
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        using (DBDataContext context = new DBDataContext())
        {
            var query = from o in context.Operadores
                        where o.usuario == TextBox1.Text
                        && o.contraseña == TextBox2.Text
                        select o;
            if (query.Any())
            {
                var result = query.First();
                Session["operador"] = result.nombre;
                Response.Redirect("Control.aspx");
            }
            else
            {
                lblError.Visible = true;
            }
        }
    }
}
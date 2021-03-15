using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Default2 : System.Web.UI.Page
{
    int cantidad;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["operador"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        XmlDocument doc = new XmlDocument();
        string path = Server.MapPath("~/informacion.xml");
        doc.Load(path);

        cantidad = Convert.ToInt32(doc.SelectSingleNode("configuracion/parqueo/cantidad").InnerText);
        Label3.Text = cantidad.ToString();
        using (DBDataContext db = new DBDataContext())
        {
            int count = db.EnParqueos.Count();
            lblOcu.Text = Convert.ToString(count);
            lblDis.Text = Convert.ToString(cantidad - count);
        };
    }

    protected void btnIngreso_Click(object sender, EventArgs e)
    {
        if (cantidad == int.Parse(lblOcu.Text))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Ya se completo todo el espacio vehicular');", true);
        }
        else
        {

            int id;
            string DateFormat = "ddMMyyyyHHmmss";
            string date = DateTime.Now.ToString(DateFormat);

            using (DBDataContext db = new DBDataContext())
            {
                Registro reg = new Registro
                {
                    placa = txtplaca.Text,
                    fechaEntrada = DateTime.Now
                };
                db.Registros.InsertOnSubmit(reg);
                db.SubmitChanges();

                id = reg.idRegistro;
                EnParqueo enp = new EnParqueo
                {
                    idRegistro = id
                };
                db.EnParqueos.InsertOnSubmit(enp);
                db.SubmitChanges();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}
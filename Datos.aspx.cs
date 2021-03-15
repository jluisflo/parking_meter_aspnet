using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

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
        
        XmlDocument doc = new XmlDocument();
            string path = Server.MapPath("~/informacion.xml");
            doc.Load(path);
            txtCapacidad.Text = Convert.ToString(doc.SelectSingleNode("configuracion/parqueo/cantidad").InnerText);
            txtTarifa.Text = Convert.ToString(doc.SelectSingleNode("configuracion/tarifa/cantidad").InnerText);
        }
    }

    protected void btnCapacidad_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        string path = Server.MapPath("~/informacion.xml");
        doc.Load(path);
        doc.SelectSingleNode("configuracion/parqueo/cantidad").InnerText = txtCapacidad.Text;
        doc.Save(path);
        Response.Redirect(Request.Url.AbsoluteUri);

    }

    protected void btnTarifa_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        string path = Server.MapPath("~/informacion.xml");
        doc.Load(path);
        doc.SelectSingleNode("configuracion/tarifa/cantidad").InnerText = txtTarifa.Text;
        doc.Save(path);
        Response.Redirect(Request.Url.AbsoluteUri);

    }
}
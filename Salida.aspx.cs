using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Default2 : System.Web.UI.Page
{
    decimal precio;
    int acumuladoEnMinutos;
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
        precio= Convert.ToDecimal(doc.SelectSingleNode("configuracion/tarifa/cantidad").InnerText);

        using (DBDataContext db = new DBDataContext())
        {
            var enparqueo = from reg in db.Registros
                                 join par in db.EnParqueos on reg.idRegistro equals par.idRegistro
                                 select new { reg.idRegistro, reg.placa, reg.fechaEntrada };
            GridView1.DataSource = enparqueo;
            GridView1.DataBind();
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        search.Text = row.Cells[2].Text;
    }

    protected void btntarifa_Click(object sender, EventArgs e)
    {
        using (DBDataContext db = new DBDataContext())
        {
            var enparqueo = from reg in db.Registros
                            join par in db.EnParqueos on reg.idRegistro equals par.idRegistro
                            where reg.placa == search.Text
                            select new { reg.idRegistro, reg.placa, reg.fechaEntrada };

            var result = enparqueo.First();

            DateTime oldDate = Convert.ToDateTime(result.fechaEntrada);
            DateTime newDate = DateTime.Now;

            int differenceInMinutes = calcularInstancia(oldDate, newDate);
            lblMinutos.Text = differenceInMinutes.ToString();
            lblTarifa.Text = string.Format("{0:C2}", differenceInMinutes * precio);
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalPagar();", true);
    }

    protected void btnIngreso_Click(object sender, EventArgs e)
    {
        using (DBDataContext db = new DBDataContext())
        {
            var enparqueo = from rgs in db.Registros
                            join par in db.EnParqueos on rgs.idRegistro equals par.idRegistro
                            where rgs.placa == search.Text
                            select new { rgs.idRegistro};

            var result = enparqueo.First();

            Registro reg = db.Registros.Single(r => r.idRegistro == result.idRegistro);


            reg.fechaSalida= DateTime.Now;
            reg.tarifa = Convert.ToDecimal((lblTarifa.Text).Replace("$",""));
            db.SubmitChanges();

            int id = reg.idRegistro;
            EnParqueo enp = db.EnParqueos.Single(p => p.idRegistro == id);
            db.EnParqueos.DeleteOnSubmit(enp);
            db.SubmitChanges();
        }
        Response.Redirect("~/Control.aspx");

    }

    public int calcularInstancia(DateTime oldT, DateTime newT)
    {
        acumuladoEnMinutos = 0;
        // Difference in days, hours, and minutes.
        TimeSpan span = newT.Subtract(oldT);

 
        int minutosendia = span.Days * 1440;

        int minutosenhora = span.Hours * 60;

        int minutos =span.Minutes;

        acumuladoEnMinutos = minutosendia+ minutosenhora + minutos;

        return acumuladoEnMinutos;
    }
}
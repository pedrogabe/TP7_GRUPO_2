using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GRUPO_2
{
    public partial class ListadoSucursalesSeleccionadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gvSucursalesSeleccionadas.DataSource = Session["tabla"];
            gvSucursalesSeleccionadas.DataBind();
        }
    }
}
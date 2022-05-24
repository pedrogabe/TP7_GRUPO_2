using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Business;
using System.Data;
namespace TP7_GRUPO_2
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "eventoSeleccionar")
            {
                string info = e.CommandArgument.ToString();
                string[] arg = new string[3];
                char[] splitter = { ';' };
                arg = info.Split(splitter);
                if (Session["tabla"] == null)
                {
                    Session["list"] = new List<int>();
                    Session["tabla"] = Tabla.CrearTabla();
                }
                if (((List<int>)Session["list"]).Contains(Int32.Parse(arg[0])))
                {
                    lblMensaje.Text = "Producto ya seleccionado!";
                }
                else
                {
                    ((List<int>)Session["list"]).Add(Int32.Parse(arg[0]));
                    Tabla.AgregarFila(((DataTable)Session["tabla"]), arg[0], arg[1], arg[2]);
                    lblMensaje.Text = "Producto agregado: " + arg[1];
                }
            }
        }
        protected void btnProvincia_Click(object sender, EventArgs e)
        {
            string provinciaId = ((Button)sender).CommandArgument.ToString();
            SeleccionProvincia(provinciaId, SqlDataSource1);
        }

        protected void btnBusqueda_Click(object sender, EventArgs e)
        {
            try
            {
                NegocioSucursales.SeleccionarSucursales(SqlDataSource1, $"SELECT * FROM Sucursal WHERE NombreSucursal like '{txtBusqueda.Text}%'");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        public void SeleccionProvincia(string IddeProvincia, SqlDataSource sqlDataSourceExtra)
        {
            sqlDataSourceExtra.SelectCommand = $"SELECT * FROM Sucursal WHERE Id_ProvinciaSucursal={IddeProvincia}";
            sqlDataSourceExtra.DataBind();
        }

        protected void cvLimiteCaracteres_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length <= 15)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}
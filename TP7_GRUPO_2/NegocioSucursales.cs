using System;
using System.Web.UI.WebControls;

namespace Business
{
    public static class NegocioSucursales
    {
        public static void SeleccionarSucursales(SqlDataSource ds, string query)
        {
            try
            {
                ds.SelectCommand = query;
                ds.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
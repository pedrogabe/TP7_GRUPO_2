using System.Data;
using DB;

namespace Business
{
    public static class NegocioSucursales
    {
        public static DataTable ObtenerSucursales()
        {
            return DBClass.ObtenerTabla("SELECT * FROM Sucursal");
        }
    }
}
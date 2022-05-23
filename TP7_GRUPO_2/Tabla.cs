using System;
using System.Data;

namespace TP7_GRUPO_2
{
    public static class Tabla
    {
        public static DataTable CrearTabla()
        {
            DataTable dt = new DataTable();
            DataColumn columna = new DataColumn("IdSucursal", System.Type.GetType("System.Int32"));
            dt.Columns.Add(columna);
            columna = new DataColumn("NombreSucursal", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);
            columna = new DataColumn("DescripcionSucursal", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);
            return dt;
        }

        public static void AgregarFila(DataTable tabla, String IdSucursal, String NombreSucursal, String DescripcionSucursal)
        {
            DataRow dr = tabla.NewRow();
            dr["IdSucursal"] = IdSucursal;
            dr["NombreSucursal"] = NombreSucursal;
            dr["DescripcionSucursal"] = DescripcionSucursal;
            tabla.Rows.Add(dr);

        }
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace DB
{
    public static class DBClass
    {
        private static string connString = "Data Source=localhost\\sqlexpress; Initial Catalog=BDSucursales; Integrated Security = True";


        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connString);
        }

        private static SqlCommand GetCommand(in string query, in object[] parameters)
        {
            var cmd = new SqlCommand(query, GetConnection());
            AddParameters(ref cmd, parameters);
            return cmd;
        }

        public static void AddParameters(ref SqlCommand cmd, in object[] parameters)
        {
            int i = 0;
            foreach(string param in parameters)
            {
                cmd.Parameters.AddWithValue("@" + i, parameters[i]);
                i++;
            }
        }

        /// <summary>
        /// Ejecuta consultas en la base de datos.
        /// </summary>
        /// <param name="query">Consulta a la base de datos</param>
        /// <param name="parameters">Valores de los parámetros</param>
        /// <returns>DataSet con los resultados de la consulta o null falla la operación.</returns>
        public static DataSet Query(string query, params object[] parameters)
        {
            try
            {
                var cmd = GetCommand(query, parameters);
                var adapter = new SqlDataAdapter(cmd);
                var ds = new DataSet();
                adapter.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        /// <summary>
        /// Ejecuta operaciones en la base de datos que no sean de selección.
        /// </summary>
        /// <param name="query">Consulta a la base de datos</param>
        /// <param name="parameters">Valores de los parámetros</param>
        /// <returns>Cantidad de filas afectadas o null si falla la operación</returns>
        public static int? NonQuery(string query, params object[] parameters)
        {
            try
            {
                var cmd = GetCommand(query, parameters);
                cmd.Connection.Open();
                int affected = cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return affected;
            }

            catch
            {
                return null;
            }
        }

        /// <summary>
        /// Realiza una consulta a la base de datos y devuelve la primera tabla del resultado.
        /// </summary>
        /// <param name="query">Consulta SQL</param>
        /// <returns>Primera tabla del DataSet obtenido o null si falla la consulta.</returns>
        public static DataTable ObtenerTabla(string query)
        {
            try
            {
                DataSet ds = Query(query);
                return ds?.Tables[0];
            }
            catch (ArgumentNullException)
            {
                System.Diagnostics.Trace.WriteLine("Invalid query");
                throw;
            }
        }
    }
}
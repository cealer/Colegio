using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ACCESO_DATOS
{
    public class Conexion
    {
        public static SqlConnection ConexionDBSqlServer()
        {
            var url = @"Data Source=PROGRAMADOR\SQLEXPRESS;Initial Catalog=Colegio;Integrated Security=True";
            var cn = new SqlConnection(url);
            return cn;
        }
    }
}

using Entidades;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;


namespace ACCESO_DATOS
{
    public class TipoAmbienteAD
    {
        public static bool Agregar(TipoAmbiente ent)
        {
            var r = 0;
            using (var cn = Conexion.ConexionDBSqlServer())
            {
                SqlCommand cmd = new SqlCommand("SPU_INSERTAR_TipoAmbiente", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Descripcion", ent.Descripcion);
                cn.Open();
                r = cmd.ExecuteNonQuery();
                cn.Close();
            }
            return r > 0;
        }

        public static bool Modificar(TipoAmbiente ent)
        {
            var r = 0;
            using (var cn = Conexion.ConexionDBSqlServer())
            {
                SqlCommand cmd = new SqlCommand("SPU_Modificar_TipoAmbiente", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", ent.Id);
                cmd.Parameters.AddWithValue("@Descripcion", ent.Descripcion);
                cmd.Parameters.AddWithValue("@Estado", ent.Estado);
                cn.Open();
                r = cmd.ExecuteNonQuery();
                cn.Close();
            }
            return r > 0;
        }

        public static bool Existe(string id)
        {
            var r = 0;
            using (var cn = Conexion.ConexionDBSqlServer())
            {
                var sql = "select count(Id) from TipoAmbiente where Id = @Id";
                var cmd = new SqlCommand(sql, cn);
                cmd.Parameters.AddWithValue("@Id", id);
                cn.Open();
                r = (int)cmd.ExecuteScalar();
                cn.Close();
            }
            return r > 0;
        }

        public static bool Eliminar(string id)
        {
            var r = 0;
            using (var cn = Conexion.ConexionDBSqlServer())
            {
                var sql = "UPDATE TipoAmbiente SET Estado='0' WHERE Id =@Id";
                var cmd = new SqlCommand(sql, cn);
                cmd.Parameters.AddWithValue("@Id", id);
                cn.Open();
                r = cmd.ExecuteNonQuery();
                cn.Close();
            }
            return r > 0;
        }


        public static TipoAmbiente CrearEntidad(IDataReader lector)
        {
            var aux = new TipoAmbiente();
            aux.Id = lector.GetString(0);
            aux.Descripcion = lector.GetString(1);
            aux.Estado = lector.GetString(2);
            return aux;
        }

        public static List<TipoAmbiente> Buscar(TipoAmbiente ent)
        {
            var lista = new List<TipoAmbiente>();
            using (var cn = Conexion.ConexionDBSqlServer())
            {
                SqlCommand cmd = new SqlCommand("SPU_BUSCAR_TipoAmbiente", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                cmd.Parameters.AddWithValue("@TipoAmbienteDescripcion", ent.Descripcion);
                var r = cmd.ExecuteReader();
                while (r.Read())
                {
                    lista.Add(CrearEntidad(r));
                }
                cn.Close();
            }
            return lista;
        }

        public static List<TipoAmbiente> ObtenerUltimos()
        {
            var lista = new List<TipoAmbiente>();
            using (var cn = Conexion.ConexionDBSqlServer())
            {
                SqlCommand cmd = new SqlCommand("SPU_TOP10_TipoAmbiente", cn);
                cn.Open();
                var r = cmd.ExecuteReader();
                while (r.Read())
                {
                    lista.Add(CrearEntidad(r));
                }
                cn.Close();
            }
            return lista;
        }
    }
}

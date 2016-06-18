using System; 
using System.Collections.Generic; 
using System.Linq; 
using System.Text; 
using System.Threading.Tasks; 
using Entidades;
using ACCESO_DATOS;
using System.Data;
using System.Data.SqlClient;


namespace ACCESO_DATOS
{
    public class AmbienteAD
    {
        public static bool Agregar(Ambiente ent)
        {
        var r = 0;
            using (var cn = Conexion.ConexionDBSqlServer())
            {
            SqlCommand cmd = new SqlCommand("SPU_INSERTAR_Ambiente",cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IdTipoAmbiente",ent.IdTipoAmbiente);
            cmd.Parameters.AddWithValue("@Descripcion",ent.Descripcion);
            cmd.Parameters.AddWithValue("@Ubicacion",ent.Ubicacion);
            cmd.Parameters.AddWithValue("@Capacidad",ent.Capacidad);
            cmd.Parameters.AddWithValue("@Area",ent.Area);
            cmd.Parameters.AddWithValue("@Condicion",ent.Condicion);
        cn.Open();
        r = cmd.ExecuteNonQuery();
        cn.Close();
        }
        return r > 0;
      }

        public static bool Modificar(Ambiente ent)
        {
        var r = 0;
            using (var cn = Conexion.ConexionDBSqlServer())
            {
            SqlCommand cmd = new SqlCommand("SPU_Modificar_Ambiente",cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id",ent.Id);
            cmd.Parameters.AddWithValue("@IdTipoAmbiente",ent.IdTipoAmbiente);
            cmd.Parameters.AddWithValue("@Descripcion",ent.Descripcion);
            cmd.Parameters.AddWithValue("@Ubicacion",ent.Ubicacion);
            cmd.Parameters.AddWithValue("@Capacidad",ent.Capacidad);
            cmd.Parameters.AddWithValue("@Area",ent.Area);
            cmd.Parameters.AddWithValue("@Condicion",ent.Condicion);
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
         var sql = "select count(Id) from Ambiente where Id = @Id"; 
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
        using (var cn = Conexion.ConexionDBSqlServer()){
        var sql = "UPDATE Ambiente SET Estado='0' WHERE Id =@Id";
        var cmd = new SqlCommand(sql, cn);
        cmd.Parameters.AddWithValue("@Id", id);
        cn.Open();
        r = cmd.ExecuteNonQuery();
        cn.Close();
        }
        return r > 0;
        }


        public static Ambiente CrearEntidad(IDataReader lector)
        {
        var aux = new Ambiente();
        aux.Id = lector.GetString(0);
        aux.IdTipoAmbiente = lector.GetString(1);
        aux.Descripcion = lector.GetString(2);
        aux.Ubicacion = lector.GetString(3);
        aux.Condicion = lector.GetString(6);
        aux.Estado = lector.GetString(7);
        return aux;
        }

         public static List<Ambiente> Buscar(Ambiente ent)
        {
        var lista = new List<Ambiente>();
        using (var cn = Conexion.ConexionDBSqlServer())
        {
                    SqlCommand cmd = new SqlCommand("SPU_BUSCAR_Ambiente", cn); 
            cmd.CommandType = CommandType.StoredProcedure;
        cn.Open();
            cmd.Parameters.AddWithValue("@AmbienteDescripcion",ent.Descripcion);
        var r = cmd.ExecuteReader();
        while (r.Read())
        {
        lista.Add(CrearEntidad(r));
        }
       cn.Close();
        }
        return lista;
        }

        public static List<Ambiente> ObtenerUltimos()
        {
        var lista = new List<Ambiente>();
        using (var cn = Conexion.ConexionDBSqlServer())
        {
                    SqlCommand cmd = new SqlCommand("SPU_TOP10_Ambiente", cn); 
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

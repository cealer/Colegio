using System; 
using System.Collections.Generic; 
using System.Linq; 
using System.Text; 
using System.Threading.Tasks; 
using ACCESO_DATOS;
using Entidades;

namespace BOL
{
    public class AmbienteBOL
    {

        public static bool Registro(Ambiente ent)
        {
        bool r;
                if (AmbienteAD.Existe(ent.Id))
                {
        r = true;
                AmbienteAD.Modificar(ent);
                 }
                else
                {
        r = false;
               AmbienteAD.Agregar(ent);
                 }
        return r;
        }
        public static void Eliminar(string id)
        {
                AmbienteAD.Eliminar(id);
        }

         public static List<Ambiente> BuscarUltimos()
        {
                return AmbienteAD.ObtenerUltimos();
        }

         public static List<Ambiente> Buscar(Ambiente ent)
        {
                return AmbienteAD.Buscar(ent);
        }
    }
}

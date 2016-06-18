using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ACCESO_DATOS;
using Entidades;

namespace BOL
{
    public class TipoAmbienteBOL
    {

        public static bool Registro(TipoAmbiente ent)
        {
        bool r;
                if (TipoAmbienteAD.Existe(ent.Id))
                {
        r = true;
                TipoAmbienteAD.Modificar(ent);
                 }
                else
                {
        r = false;
               TipoAmbienteAD.Agregar(ent);
                 }
        return r;
        }
        public static void Eliminar(string id)
        {
                TipoAmbienteAD.Eliminar(id);
        }

         public static List<TipoAmbiente> BuscarUltimos()
        {
                return TipoAmbienteAD.ObtenerUltimos();
        }

         public static List<TipoAmbiente> Buscar(TipoAmbiente ent)
        {
                return TipoAmbienteAD.Buscar(ent);
        }
    }
}

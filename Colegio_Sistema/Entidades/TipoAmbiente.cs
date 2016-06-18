using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class TipoAmbiente
    {
        public string Id { get; set; }
        public string Descripcion { get; set; }
        public string Estado { get; set; }

        public TipoAmbiente()
        {

        }

        public TipoAmbiente(string id, string descripcion, string estado)
        {
            Id = id;
            Descripcion = descripcion;
            Estado = estado;
        }
    }
}

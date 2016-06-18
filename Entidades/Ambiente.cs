using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ambiente
    {
      public  string Id { get; set; }

       public TipoAmbiente TipoAmbiente { get; set; }
        public string Descripcion { get; set; }
        public string Ubicacion { get; set; }
        public int Capacidad { get; set; }

        public decimal Area { get; set; }
        public string Condicion { get; set; }

        public string Estado { get; set; }
    }
}

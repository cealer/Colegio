using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MetroFramework.Forms;
using Entidades;
using BOL;

namespace Presentacion
{
    public partial class FrmTipoAmbiente : MetroForm
    {
        public FrmTipoAmbiente()
        {
            InitializeComponent();
        }

        private void TipoAmbiente_Load(object sender, EventArgs e)
        {

        }

        private void btnRegistro_Click(object sender, EventArgs e)
        {
            TipoAmbiente aux = new TipoAmbiente();
            aux.Id = "";
            aux.Descripcion = tbxDescripcion.Text;
            aux.Estado = "1";
            var r=TipoAmbienteBOL.Registro(aux);
            if (r) {
                MessageBox.Show("Guardado");
            }
                 
        }
    }
}
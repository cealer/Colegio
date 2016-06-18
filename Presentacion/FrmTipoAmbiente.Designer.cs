namespace Presentacion
{
    partial class FrmTipoAmbiente
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnRegistro = new MetroFramework.Controls.MetroButton();
            this.metroLabel1 = new MetroFramework.Controls.MetroLabel();
            this.tbxDescripcion = new MetroFramework.Controls.MetroTextBox();
            this.SuspendLayout();
            // 
            // btnRegistro
            // 
            this.btnRegistro.Location = new System.Drawing.Point(306, 81);
            this.btnRegistro.Name = "btnRegistro";
            this.btnRegistro.Size = new System.Drawing.Size(75, 35);
            this.btnRegistro.Style = MetroFramework.MetroColorStyle.Black;
            this.btnRegistro.TabIndex = 0;
            this.btnRegistro.Text = "Guardar";
            this.btnRegistro.UseSelectable = true;
            this.btnRegistro.UseStyleColors = true;
            this.btnRegistro.Click += new System.EventHandler(this.btnRegistro_Click);
            // 
            // metroLabel1
            // 
            this.metroLabel1.AutoSize = true;
            this.metroLabel1.Location = new System.Drawing.Point(23, 86);
            this.metroLabel1.Name = "metroLabel1";
            this.metroLabel1.Size = new System.Drawing.Size(76, 19);
            this.metroLabel1.Style = MetroFramework.MetroColorStyle.Black;
            this.metroLabel1.TabIndex = 1;
            this.metroLabel1.Text = "Descripcion";
            this.metroLabel1.UseStyleColors = true;
            // 
            // tbxDescripcion
            // 
            // 
            // 
            // 
            this.tbxDescripcion.CustomButton.Image = null;
            this.tbxDescripcion.CustomButton.Location = new System.Drawing.Point(100, 1);
            this.tbxDescripcion.CustomButton.Name = "";
            this.tbxDescripcion.CustomButton.Size = new System.Drawing.Size(21, 21);
            this.tbxDescripcion.CustomButton.Style = MetroFramework.MetroColorStyle.Blue;
            this.tbxDescripcion.CustomButton.TabIndex = 1;
            this.tbxDescripcion.CustomButton.Theme = MetroFramework.MetroThemeStyle.Light;
            this.tbxDescripcion.CustomButton.UseSelectable = true;
            this.tbxDescripcion.CustomButton.Visible = false;
            this.tbxDescripcion.Lines = new string[0];
            this.tbxDescripcion.Location = new System.Drawing.Point(129, 81);
            this.tbxDescripcion.MaxLength = 32767;
            this.tbxDescripcion.Name = "tbxDescripcion";
            this.tbxDescripcion.PasswordChar = '\0';
            this.tbxDescripcion.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.tbxDescripcion.SelectedText = "";
            this.tbxDescripcion.SelectionLength = 0;
            this.tbxDescripcion.SelectionStart = 0;
            this.tbxDescripcion.Size = new System.Drawing.Size(122, 23);
            this.tbxDescripcion.Style = MetroFramework.MetroColorStyle.Black;
            this.tbxDescripcion.TabIndex = 2;
            this.tbxDescripcion.UseSelectable = true;
            this.tbxDescripcion.UseStyleColors = true;
            this.tbxDescripcion.WaterMarkColor = System.Drawing.Color.FromArgb(((int)(((byte)(109)))), ((int)(((byte)(109)))), ((int)(((byte)(109)))));
            this.tbxDescripcion.WaterMarkFont = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Pixel);
            // 
            // FrmTipoAmbiente
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(656, 314);
            this.Controls.Add(this.tbxDescripcion);
            this.Controls.Add(this.metroLabel1);
            this.Controls.Add(this.btnRegistro);
            this.Name = "FrmTipoAmbiente";
            this.Style = MetroFramework.MetroColorStyle.Green;
            this.Text = "Tipo Ambiente";
            this.Theme = MetroFramework.MetroThemeStyle.Default;
            this.Load += new System.EventHandler(this.TipoAmbiente_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private MetroFramework.Controls.MetroButton btnRegistro;
        private MetroFramework.Controls.MetroLabel metroLabel1;
        private MetroFramework.Controls.MetroTextBox tbxDescripcion;
    }
}
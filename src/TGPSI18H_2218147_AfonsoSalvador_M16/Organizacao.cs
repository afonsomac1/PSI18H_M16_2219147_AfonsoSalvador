﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Runtime.InteropServices;
using System.IO;

namespace TGPSI18H_2218147_AfonsoSalvador_M16
{
    public partial class Organizacao : UserControl
    {
        public Organizacao()
        {
            InitializeComponent();
          
        }
        public event EventHandler ButtonClick1;
        public event EventHandler ButtonClick2;
        private void Button1_Click(object sender, EventArgs e)
        {
            if (this.ButtonClick1 != null)
                this.ButtonClick1(this, new EventArgs());
        }

        private void Panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Button3_Click(object sender, EventArgs e)
        {
        
        }

        private void Button2_Click(object sender, EventArgs e)
        {
        }

        private void Button4_Click(object sender, EventArgs e)
        {
           

        }

        private void Organizacao_Load(object sender, EventArgs e)
        {
            label1.Text = "Global Volunteers";
            label2.Text = "Volunteering Solutions";
        }

        private void Panel1_Paint(object sender, PaintEventArgs e)
        {

            ControlPaint.DrawBorder(e.Graphics, panel1.DisplayRectangle, Color.FromArgb(0, 192, 192), ButtonBorderStyle.Dashed);
        }

        private void Button2_Click_1(object sender, EventArgs e)
        {
            if (this.ButtonClick2 != null)
                this.ButtonClick2(this, new EventArgs());
        }

        private void Panel2_Paint(object sender, PaintEventArgs e)
        {
            ControlPaint.DrawBorder(e.Graphics, panel2.DisplayRectangle, Color.FromArgb(0, 192, 192), ButtonBorderStyle.Dashed);
        }
    }
}

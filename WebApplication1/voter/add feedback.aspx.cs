﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.voter
{
    public partial class add_feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }
            txtID.Text = Session["NID"].ToString();
            string dt = DateTime.Now.ToString("dd-MMM-yy");
            txtdate.Text = dt;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "insert into feedback (id,comment,date) values (@id,@comment,@date)";
            cmd.Parameters.AddWithValue("@id", txtID.Text);
            cmd.Parameters.AddWithValue("@comment", txtcomment.Text);
            cmd.Parameters.AddWithValue("@date", txtdate.Text);
            cmd.ExecuteNonQuery();
            cn.Close();
            clear();
            Label1.Text = "Successfull";
        }
        private void clear()
        {
            txtcomment.Text = null;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string dt = DateTime.Now.ToString("dd-MMM-yy");
            txtdate.Text = dt;
            //txtID.Text = null;
            txtcomment.Text = null;
            Label1.Text = null;
        }
    }
}
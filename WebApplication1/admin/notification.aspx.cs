using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class notification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }
            string dt = DateTime.Now.ToString("dd-MMM-yy");
            txtdate.Text = dt;
            txtNID.Text = Session["NID"].ToString();



        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "insert into notification_info (Admin_id,Notice,date) values (@Admin_id,@Notice,@date)";
            cmd.Parameters.AddWithValue("@Admin_id", txtNID.Text);
            cmd.Parameters.AddWithValue("@Notice",txtnotification.Text);
            cmd.Parameters.AddWithValue("@date",txtdate.Text);
            cmd.ExecuteNonQuery();
          
            cn.Close();
            clear();
            Label1.Text = "Successfull";
        }

        private void clear()
        {
            txtnotification.Text = null;
        }

        
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label2.Visible = false;
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/registration.aspx");
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Session["NID"] = txtnid.Text;
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
          

           cn.Open();
            SqlCommand cmd = new SqlCommand("select * from registration_info where NID=@NID and password=@password", cn);
            cmd.Parameters.AddWithValue("@NID", txtnid.Text);
            cmd.Parameters.AddWithValue("@password", txtpass.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            

            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["type"] = dt.Rows[0]["name"].ToString();
                Session["utype"] = dt.Rows[0]["Type"].ToString();


                if (dt.Rows[0]["Type"].ToString() == "Admin")
                {
                    
                    Response.Redirect("~/admin/ad home.aspx");
                    
                }
                    
                else if (dt.Rows[0]["Type"].ToString() == "Voter")
                {
                    
                    Response.Redirect("~/voter/voter home.aspx");
                }

                else if (dt.Rows[0]["Type"].ToString() == "Candidate")
                {
                   
                    Response.Redirect("~/candidate/cd home.aspx");
                }

            }
            else
            {
                Label2.Visible = true;
                Label2.Text = "Invalid username or password.";
                clear();
            }
            cn.Close();

        }
        private void clear()
        {
            txtnid.Text = null;
            txtpass.Text = null;
        }
       

    }
    }

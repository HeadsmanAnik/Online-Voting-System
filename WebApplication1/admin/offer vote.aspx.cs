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
    public partial class offer_vote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }
            string dt = DateTimeOffset.Now.ToString("dd-MMM-yy");
            txtdate.Text = dt;
            txtregdate.Text = dt;
           
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();

            SqlCommand cmd = new SqlCommand("select * from offer_vote where vote_Name=@NID", cn);
            cmd.Parameters.AddWithValue("@NID", txtname.Text);
            {
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows == false)
                {
                    if (txtname.Text != " ")
                    {

                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                        con.Open();
                        //SqlCommand cmd = new SqlCommand();
                        cmd.Connection = con;
                        cmd.CommandText = "insert into offer_vote (vote_Name,date_of_election,Deadline_of_reg) values (@vote_Name,@date_of_election,@Deadline_of_reg)";
                        cmd.Parameters.AddWithValue("@vote_Name", txtname.Text);
                        cmd.Parameters.AddWithValue("@date_of_election", txtdate.Text);
                        cmd.Parameters.AddWithValue("@Deadline_of_reg", txtregdate.Text);

                        cmd.ExecuteNonQuery();
                        con.Close();
                        Label1.Text = "Successfull";

                    }
                    else
                    {
                        Label1.Text = "please insert name ";
                    }
                }
                else
                {
                    Label1.Text = "Vote Name Already Exist";
                }
                cn.Close();
                reader.Close();
                reader.Dispose();
            }
        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            txtname.Text = "";
            Label1.Text = null;
        }
    }
}
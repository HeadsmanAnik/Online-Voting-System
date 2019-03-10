using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.candidate
{
    public partial class join_vote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }
            txtnid.Text = Session["NID"].ToString();
            txtname.Text = Session["type"].ToString();
        }

        protected void clear()
        {
            Label1.Text = null;
           // txtnid.Text = null;
            txtreqsign.Text = null;
            ddlelectionname.Text = ddlelectionname.SelectedValue;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();

            SqlCommand cmd = new SqlCommand("select * from join_vote where candidate_id=@id and of_id=@ofid", cn);
            
            cmd.Parameters.AddWithValue("@id", txtnid.Text);
            cmd.Parameters.AddWithValue("@ofid",ddlelectionname.SelectedValue);
            {
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows == false)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                    con.Open();

                    cmd.Connection = con;
                    cmd.CommandText = "insert into join_vote (of_id,candidate_name,candidate_id,requested_sign) values (@of_id,@candidate_name,@candidate_id,@requested_sign)";
                    cmd.Parameters.AddWithValue("@of_id", ddlelectionname.SelectedValue);
                    cmd.Parameters.AddWithValue("@candidate_name",txtname.Text);
                    cmd.Parameters.AddWithValue("@candidate_id", txtnid.Text);
                    cmd.Parameters.AddWithValue("@requested_sign", txtreqsign.Text);
                    cmd.ExecuteNonQuery();

                    con.Close();
                    clear();
                    Label1.Text = "Successfull";
                }
                else
                {
                    Label1.Text = "you Have already Registered";
                }
                cn.Close();
                reader.Close();
                reader.Dispose();
            }
        }
    }
}
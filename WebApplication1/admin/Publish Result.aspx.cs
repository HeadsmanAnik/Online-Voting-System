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
    public partial class Publish_Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["NID"].ToString() == "")
            //{
            //    Response.Redirect("~/login.aspx");
            //}
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            txtofr.Text = gr.Cells[0].Text;
            txtvotename.Text = gr.Cells[1].Text;
            txtcandidateid.Text = gr.Cells[2].Text;
            txtcandidatename.Text = gr.Cells[3].Text;
            txtsign.Text = gr.Cells[4].Text;
            txtamountvote.Text = gr.Cells[5].Text;
        }
        protected void btnstatus_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select Max(amount_balot) From Save_result where of_id=@oid;";
            cmd.Parameters.AddWithValue("@oid", txtofr.Text);
            Int32 max = (Int32)cmd.ExecuteScalar();
            con.Close();
            if (max.ToString() == txtamountvote.Text)
            {
                txtstatus.Text = "Winner";
            }
            else
            {
                txtstatus.Text = "Loser";
            }
        }

        protected void btnpublish_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();

            SqlCommand cmd1 = new SqlCommand("select * from publish_result where of_id=@oID and candidate_id= @cid", cn);
            cmd1.Parameters.AddWithValue("@oID", txtofr.Text);
            cmd1.Parameters.AddWithValue("@cid", txtcandidateid.Text);
            {
                SqlDataReader reader = cmd1.ExecuteReader();
                if (reader.HasRows == false)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "insert into publish_result (of_id,vote_name,candidate_id,candidate_name,vote_sign,amount_balot,Stataus) values(@of_id,@vote_name,@candidate_id,@candidate_name,@vote_sign,@amount_balot,@Stataus)";
                    cmd.Parameters.AddWithValue("@of_id", txtofr.Text);
                    cmd.Parameters.AddWithValue("@vote_name", txtvotename.Text);
                    cmd.Parameters.AddWithValue("@candidate_id", txtcandidateid.Text);
                    cmd.Parameters.AddWithValue("@candidate_name", txtcandidatename.Text);
                    cmd.Parameters.AddWithValue("@vote_sign", txtsign.Text);
                    cmd.Parameters.AddWithValue("@amount_balot", txtamountvote.Text);
                    cmd.Parameters.AddWithValue("@Stataus", txtstatus.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    clear();
                    Label1.Text = "successfull";

                }
                else
                {
                    Label1.Text = "Already Published";
                    clear();
                }
                cn.Close();
                reader.Close();
                reader.Dispose();
            }
            
        }
        private void clear()
        {
            txtofr.Text = null;
            txtcandidateid.Text = null;
            txtamountvote.Text = null;
            txtcandidatename.Text = null;
            txtvotename.Text = null;
            txtsign.Text = null;
            txtstatus.Text = null;
        }
    }
}
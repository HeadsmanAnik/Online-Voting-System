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
    public partial class result : System.Web.UI.Page
    {
        int count =0 ;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }


        }

        protected void btncount_Click(object sender, EventArgs e)
        {
           
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "select count(*) from result1 where Of_id=@ID and Candidate_Id=@cdid";
            cmd.Parameters.AddWithValue("@ID", txtof_id.Text);
            cmd.Parameters.AddWithValue("@cdid", txtcandidateid.Text);
            count = (Int32)cmd.ExecuteScalar();
            txtcount.Text = count.ToString();
            cn.Close();
           
        }
       

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            txtof_id.Text = gr.Cells[0].Text;
            txtvotename.Text = gr.Cells[1].Text;
            txtcandidateid.Text = gr.Cells[2].Text;
            txtcandidatename.Text = gr.Cells[3].Text;
            txtsign.Text = gr.Cells[4].Text;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();

            SqlCommand cmd1 = new SqlCommand("select * from Save_result where of_id=@oID and candidate_id= @cid", cn);
            cmd1.Parameters.AddWithValue("@oID", txtof_id.Text);
            cmd1.Parameters.AddWithValue("@cid", txtcandidateid.Text);
            {
                SqlDataReader reader = cmd1.ExecuteReader();
                if (reader.HasRows == false)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "insert into Save_result (of_id,vote_name,candidate_id,candidate_name,vote_sign,amount_balot) values (@of_id,@vote_name,@candidate_id,@candidate_name,@vote_sign,@amount_balot)";
                    cmd.Parameters.AddWithValue("@of_id", txtof_id.Text);
                    cmd.Parameters.AddWithValue("@vote_name", txtvotename.Text);
                    cmd.Parameters.AddWithValue("@candidate_id", txtcandidateid.Text);
                    cmd.Parameters.AddWithValue("@candidate_name", txtcandidatename.Text);
                    cmd.Parameters.AddWithValue("@vote_sign", txtsign.Text);
                    cmd.Parameters.AddWithValue("@amount_balot", txtcount.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    clear();
                    Label1.Text = "Successfull";

                }
                else
                {
                    Label1.Text = "Already Saved";
                    clear();
                }
                cn.Close();
                reader.Close();
                reader.Dispose();
            }
           
        }
        private void clear()
        {
            txtof_id.Text = null;
            txtsign.Text = null;
            txtcandidateid.Text = null;
            txtcandidatename.Text = null;
            txtcount.Text = null;
        }
         
    }  
}
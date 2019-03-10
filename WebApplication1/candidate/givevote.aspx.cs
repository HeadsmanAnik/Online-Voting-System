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
    public partial class give_vote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }
            txtvoterid.Text = Session["NID"].ToString();


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
        private void clear()
        {
            txtof_id.Text = null;
            txtcandidateid.Text = null;
            txtcandidatename.Text = null;
            txtvotename.Text = null;
            txtsign.Text = null;
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();
            SqlCommand cmd = new SqlCommand("select * from result1 where Of_id=@id and Voter_id=@ofid", cn);

            cmd.Parameters.AddWithValue("@id", txtof_id.Text);
            cmd.Parameters.AddWithValue("@ofid", txtvoterid.Text);
            {
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows == false)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.Connection = con;
                    cmd1.CommandText = "insert into result1 (Of_id,vote_name,Candidate_Id,Candidate_name,Candidat_sign,Voter_id) values" +
                        " (@Of_id,@vote_name,@Candidate_Id,@Candidate_name,@Candidat_sign,@Voter_id)";
                    cmd1.Parameters.AddWithValue("@Of_id", txtof_id.Text);
                    cmd1.Parameters.AddWithValue("@vote_name",txtvotename.Text);
                    cmd1.Parameters.AddWithValue("@Candidate_Id", txtcandidateid.Text);
                    cmd1.Parameters.AddWithValue("@Candidate_name", txtcandidatename.Text);
                    cmd1.Parameters.AddWithValue("@Candidat_sign", txtsign.Text);
                    cmd1.Parameters.AddWithValue("@Voter_id", txtvoterid.Text);
                    cmd1.ExecuteNonQuery();

                     con.Close();
                    Label1.Text = "Your Vote Submitted";
                    clear();
                }
                else
                {
                    Label1.Text = "You have already Given your Vote";
                    clear();
                }
                cn.Close();
                reader.Close();
                reader.Dispose();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }
    }
}
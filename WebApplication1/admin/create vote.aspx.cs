using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin.adimg
{
    public partial class create_vote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }

        }

        protected void SqlDataSource1111_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();

            SqlCommand cmd = new SqlCommand("select * from Creat_vote where of_id=@id and sign_name=@ofid", cn);

            cmd.Parameters.AddWithValue("@id", txtof_id.Text);
            cmd.Parameters.AddWithValue("@ofid", ddlsign.SelectedValue);
            {
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows == false)
                {
                    SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                    cnn.Open();
                    SqlCommand cmd1 = new SqlCommand("select * from Creat_vote where of_id=@oid and candidate_id=@cnid", cnn);

                    cmd1.Parameters.AddWithValue("@oid", txtof_id.Text);
                    cmd1.Parameters.AddWithValue("@cnid",txtcandidateid.Text);
                    {
                        SqlDataReader rd = cmd1.ExecuteReader();
                        if (rd.HasRows == false)
                        {
                            if (FileUpload1.HasFile)
                            {

                                string name = FileUpload1.FileName;
                                FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "/photo/" + name);
                                string path = "/photo/" + name.ToString();

                                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                                con.Open();
                                //SqlCommand cmd2 = new SqlCommand();
                                cmd1.Connection = con;
                                cmd1.CommandText = "insert into Creat_vote (of_id,vote_name,candidate_id,candidate_name,sign_name,sign_pic) values (@of_id,@vote_name, @candidate_id,@candidate_name,@sign_name,@sign_pic)";
                                cmd1.Parameters.AddWithValue("@of_id", txtof_id.Text);
                                cmd1.Parameters.AddWithValue("@vote_name", ddlvotename.SelectedValue);
                                cmd1.Parameters.AddWithValue("@candidate_id",txtcandidateid.Text);
                                cmd1.Parameters.AddWithValue("@candidate_name", txtcandidatename.Text);
                                cmd1.Parameters.AddWithValue("@sign_name", ddlsign.SelectedValue);
                                cmd1.Parameters.AddWithValue("@sign_pic", path);
                                cmd1.ExecuteNonQuery();
                                con.Close();
                                clear();
                                Label1.Text = "Successfull";
                            }
                            else
                            {
                                Label1.Text = " please upload image sign";
                            }

                        }
                        else
                        {
                            Label1.Text = "NID Already Exist";
                            clear();
                        }
                        cnn.Close();
                        rd.Close();
                        rd.Dispose();
                    }
                }

                else
                {
                    Label1.Text = "This sign is already given";
                    clear();
                }
                cn.Close();
                reader.Close();
                reader.Dispose();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            txtof_id.Text= gr.Cells[0].Text;
            txtcandidatename.Text= gr.Cells[1].Text;
            txtcandidateid.Text = gr.Cells[2].Text;
        }
        private void clear()
        {
            txtof_id.Text = null;
            txtcandidateid.Text = null;
            txtcandidatename.Text = null;
        }
    }

       
    }



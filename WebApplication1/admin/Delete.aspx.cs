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
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            txtofferid.Text = gr.Cells[0].Text;
            txtvotename.Text = gr.Cells[1].Text;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from  Creat_vote where  Of_id=@id and vote_name=@vtname ", con);

            cmd.Parameters.AddWithValue("@id", txtofferid.Text);
            cmd.Parameters.AddWithValue("@vtname", txtvotename.Text);
            {
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows == false)
                {
                    Label1.Text = "Already Finished";
                }
                else
                {
                   
                        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                        cn.Open();
                        //SqlCommand cmd1 = new SqlCommand("DELETE FROM Creat_vote WHERE of_id = @of_id and vote_name=@vote_name", cn);
                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.Connection = cn;
                        cmd1.CommandText = "UPDATE Creat_vote SET status= @status where of_id=@Id ";
                        cmd1.Parameters.AddWithValue("@status", DropDownList1.SelectedIndex);
                    cmd1.Parameters.AddWithValue("@Id", txtofferid.Text);
                        cmd1.ExecuteNonQuery();
                        cn.Close();
                        Label1.Text = "Status Update Successful";
                  
                    //SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                    //cn.Open();
                    ////SqlCommand cmd1 = new SqlCommand("DELETE FROM Creat_vote WHERE of_id = @of_id and vote_name=@vote_name", cn);
                    //SqlCommand cmd1 = new SqlCommand();
                    //cmd1.Connection = cn;
                    //cmd1.CommandText = "DELETE  FROM Creat_vote WHERE of_id = @of_id and vote_name = @vote_name";
                    //cmd1.Parameters.AddWithValue("@of_id", txtofferid.Text);
                    //cmd1.Parameters.AddWithValue("@vote_name", txtvotename.Text);
                    //cmd1.ExecuteNonQuery();
                    //cn.Close();
                    //Label1.Text = "Status Update Successful";
                    
                }
                con.Close();
                reader.Close();
                reader.Dispose();


            }

        }
        }
    }
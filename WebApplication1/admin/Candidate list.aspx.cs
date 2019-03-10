using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class Candidatelist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }
            //DetailsView1.Visible = false;
            Table1.Visible = false;
            lblerror.Visible = false;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells[0].Text == "1000000000000")
                e.Row.Visible = false;

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            
            //DetailsView1.Visible = true;
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);


            cn.Open();
            SqlCommand cmd = new SqlCommand("select * from registration_info where NID=@NID", cn);
            cmd.Parameters.AddWithValue("@NID", txtnid.Text);
           
            SqlDataReader dr = cmd.ExecuteReader();
           if (dr.Read())
            {
                Table1.Visible = true;
                ldlnid.Text = dr.GetValue(0).ToString();
                lblname.Text= dr.GetValue(1).ToString();
                lblgender.Text= dr.GetValue(3).ToString();
                lbladdress.Text= dr.GetValue(4).ToString();
                lblcontact.Text= dr.GetValue(5).ToString();
                lblage.Text= dr.GetValue(6).ToString();
                lbltype.Text= dr.GetValue(7).ToString();
                Image2.ImageUrl = dr.GetValue(8).ToString();
            }
            else
            {
                Table1.Visible = false;
                lblerror.Visible = true;
                lblerror.Text = "No records Found";
                lblerror.ForeColor = Color.Yellow; 
            }
            //DataTable dt = new DataTable();

            //DetailsView1.DataSource = dr;
            //DetailsView1.DataBind();
            //DetailsView1.Visible = true;
            cn.Close();

        }
    }
}
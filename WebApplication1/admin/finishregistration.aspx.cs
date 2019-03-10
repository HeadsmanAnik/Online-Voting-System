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
    public partial class finishregistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            txtofferid.Text = gr.Cells[0].Text;
            txtvotename.Text = gr.Cells[1].Text;
            txtdate.Text = gr.Cells[2].Text;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "UPDATE offer_vote SET status = @status where Id=@Id ";
            cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@Id", txtofferid.Text);
            cmd.ExecuteNonQuery();
            clear();
            cn.Close();
            Label1.Text = "Successfull";
        }
        private void clear()
        {
            txtofferid.Text = null;
            txtdate.Text = null;
            txtvotename.Text = null;
            DropDownList1.SelectedValue = "0";
        }
    }
}
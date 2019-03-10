using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication1
{
    public partial class registration : System.Web.UI.Page
    {
        string dt = DateTime.Now.ToString("dd-MMM-yy");
       
        protected void Page_Load(object sender, EventArgs e)
        {


            string dt = DateTime.Now.ToString("dd-MMM-yy");
            txtage.Text = dt;

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
            cn.Open();

            SqlCommand cmd = new SqlCommand("select * from registration_info where NID=@NID", cn);
            cmd.Parameters.AddWithValue("@NID", txtnid.Text);
            {
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows == false)
                {
                    if (FileUpload1.HasFile)
                    {
                        string name = FileUpload1.FileName;
                        FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "/photo/" + name);
                        string path = "/photo/" + name.ToString();
                        //int length = FileUpload1.PostedFile.ContentLength;
                        //byte[] pic = new byte[length];
                        //FileUpload1.PostedFile.InputStream.Read(pic, 0, length);
                        //SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                        //cn.Open();
                        //SqlCommand cmd = new SqlCommand();
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ConnectionString);
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandText = "insert into registration_info (NID,name,password,gender,address,contact,date_of_birth,type,pic) values (@ND,@name,@password,@gender,@address,@contact,@date_of_birth,@type,@pic)";
                        cmd.Parameters.AddWithValue("@ND", txtnid.Text);
                        cmd.Parameters.AddWithValue("@name", txtname.Text);
                        cmd.Parameters.AddWithValue("@password", txtpass.Text);
                        cmd.Parameters.AddWithValue("@gender", txtgender.SelectedValue);
                        cmd.Parameters.AddWithValue("@address", address.Text);
                        cmd.Parameters.AddWithValue("@contact", txtcontact.Text);
                        cmd.Parameters.AddWithValue("@date_of_birth", txtage.Text);
                        cmd.Parameters.AddWithValue("@type", txtusertype.SelectedValue);
                        cmd.Parameters.AddWithValue("@pic", path);

                        cmd.ExecuteNonQuery();

                        cn.Close();

                        Response.Redirect("/login.aspx");


                    }
                    else
                    {
                        clear();
                    }
                }
                else
                {
                    Label1.Text = "Your NID already Exist";
                    clear();
                }
                cn.Close();
                reader.Close();
                reader.Dispose();
            }
           



        }
        private void clear()
        {
            txtnid.Text = null;
            txtname.Text = null;
            txtage.Text = dt;
            txtcontact.Text = null;
            txtusertype.SelectedIndex = 0;
            txtgender.SelectedIndex = 0;
            txtpass.Text = null;
            address.Text = null;
        }

        protected void txtage_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

       
    }
}


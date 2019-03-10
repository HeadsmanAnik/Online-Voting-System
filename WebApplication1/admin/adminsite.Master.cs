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
    public partial class adminsite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((String)Session["utype"].ToString() == "Admin")
            {

            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
            // Label1.Text = "Admin";
            
            

        }
    }
}
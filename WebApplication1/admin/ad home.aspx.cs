using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class ad_home : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
              
        {
            //if (Roles.IsUserInRole(Session["UType"].ToString("Admin"), "Admin"))
            //{
            //    Response.Redirect("~/login.aspx");
            //}

            if (Session["ANID"].ToString() == null )
            {
               
                Response.Redirect("~/login.aspx");
            }
        }
    }
}
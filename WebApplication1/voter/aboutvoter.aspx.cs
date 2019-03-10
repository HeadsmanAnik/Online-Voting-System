using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.voter
{
    public partial class aboutvoter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }
}
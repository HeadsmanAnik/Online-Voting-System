using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.voter
{
    public partial class votersite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((String)Session["utype"].ToString() == "Voter")
            {

            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
            Label1.Text = Session["type"].ToString();
          
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.candidate
{
    public partial class candidatesite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((String)Session["utype"].ToString() == "Candidate")
            {

            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
            Label1.Text= Session["type"].ToString();
        }
    }
}
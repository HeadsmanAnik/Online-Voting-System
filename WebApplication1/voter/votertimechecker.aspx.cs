using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.voter
{
    public partial class timechecker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");
                
            }
            else
            {
                TimeSpan start = TimeSpan.Parse("09:00"); // 09 am
                TimeSpan end = TimeSpan.Parse("18:00");   // 06 pm
                TimeSpan now = DateTime.Now.TimeOfDay;

                if ((now >= start) && (now <= end))
                {
                    Response.Redirect("cast vote.aspx");
                }
                else
                {
                    Label2.Text = "Times Up";
                    Label1.Text = "Voting Time:9:00 AM-6:00PM";
                }
            }
            

           
        }
    }
}
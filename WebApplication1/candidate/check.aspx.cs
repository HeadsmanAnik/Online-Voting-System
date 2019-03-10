using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.candidate
{
    public partial class check : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NID"].ToString() == "")
            {
                Response.Redirect("~/login.aspx");

            }
            else
            {
                TimeSpan start = TimeSpan.Parse("09:00"); // 09 AM
                TimeSpan end = TimeSpan.Parse("18:00");   // 06 PM
                TimeSpan now = DateTime.Now.TimeOfDay;

                if ((now >= start) && (now <= end))
                {
                    Response.Redirect("givevote.aspx");
                }
                else
                {
                    Label2.Text = "Times Up";
                    Label1.Text = "Voting Time:9:00 AM-6:00 PM";
                }
            }
            //TimeSpan start = TimeSpan.Parse("09:00"); // 10 PM
            //TimeSpan end = TimeSpan.Parse("22:00");   // 2 AM
            //TimeSpan now = DateTime.Now.TimeOfDay;

            //if ((now >= start) && (now <= end))
            //{
            //    Response.Redirect("givevote.aspx");
            //}
        }
    }
}
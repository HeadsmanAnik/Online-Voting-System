﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.candidate
{
    public partial class aboutcandidate : System.Web.UI.Page
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
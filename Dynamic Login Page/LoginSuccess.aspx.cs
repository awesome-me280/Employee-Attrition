using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortfolio
{
    public partial class LoginSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] is null)
            {
                // redirect to login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblUser.Text = Session["UserID"].ToString();
            }
        }
    }
}

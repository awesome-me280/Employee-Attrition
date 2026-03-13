using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortfolio
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // This is when a user clicks the button
            // These are the good credentials
            string strUserID = "scrappy@unt.edu";
            string strPass = "P@ss1";

            // Perform a logical test to see if the user input matches good credentials.
            if (txtUserID.Text == strUserID && txtPass.Text == strPass)
            {
                // if this is true
                Session["UserID"] = txtUserID.Text;
                Response.Redirect("LoginSuccess.aspx");
            }
            else
            {
                // if this is not true
                lblError.Text = "Incorrect User ID or Password";
            }
        }
    }
}

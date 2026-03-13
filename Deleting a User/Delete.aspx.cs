using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// data libraries
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace StudentPortfolio
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] is null)
            {
                // redirect to login page
                Response.Redirect("Login2.aspx");
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(dsRemove.ConnectionString);

            try
            {
                // create and configure sqlcommand
                SqlCommand cmd = new SqlCommand(dsRemove.DeleteCommand, conn);
                cmd.Parameters.AddWithValue("@User_Email", txtEmail.Text.ToUpper().Trim());

                // check email against session variable
                if (Session["UserID"].ToString() != txtEmail.Text.ToUpper().Trim())
                {
                    lblError.Text = "You must delete the logged in account.";
                }
                else
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Session["UserID"] = null;
                    Response.Redirect("DeleteSuccess.aspx");
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}

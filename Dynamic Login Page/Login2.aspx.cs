using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// data class libraries
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

// cryptography libraries
using System.Security.Cryptography;
using System.Text;

namespace StudentPortfolio
{
    public partial class Login2 : System.Web.UI.Page
    {
        private string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // create the hash and store it in a byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // build the string
                StringBuilder builder = new StringBuilder();

                // build the hex string
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }

                return builder.ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // no code needed
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string strEmail = txtUserID.Text.ToUpper().Trim();
            string strHashPass = ComputeSha256Hash(txtPass.Text.Trim());
            string strRetEmail = string.Empty;
            string strRetPass = string.Empty;

            // create connection and give it connectionstring
            SqlConnection conn = new SqlConnection(dsLogin.ConnectionString);

            try
            {
                // create sqlcommand and configure
                SqlCommand cmd = new SqlCommand(dsLogin.SelectCommand, conn);

                // populate parameters
                cmd.Parameters.AddWithValue("@User_Email", strEmail);
                cmd.Parameters.AddWithValue("@User_Pass", strHashPass);

                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    strRetEmail = reader.GetString(0).Trim();
                    strRetPass = reader.GetString(1).Trim();
                }

                if (strRetEmail == strEmail && strRetPass == strHashPass)
                {
                    Session["UserID"] = strEmail;
                    Response.Redirect("LoginSuccess.aspx");
                }
                else
                {
                    lblError.Text = "Invalid email or password.";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            finally
            {
                if (conn.State == System.Data.ConnectionState.Open)
                {
                    conn.Close();
                }
            } // conn disposed
        }
    }
}

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

// security Libraries
using System.Security.Cryptography;
using System.Text;

namespace StudentPortfolio
{
    public partial class Register : System.Web.UI.Page
    {
        private string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

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

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            // create and configure
            SqlConnection conn = new SqlConnection(dsRegister.ConnectionString);

            try
            {
                // create and configure sqlcommand
                SqlCommand cmd = new SqlCommand(dsRegister.InsertCommand, conn);

                // populate parameters
                cmd.Parameters.AddWithValue("@User_Email", txtCEmail.Text.ToUpper().Trim());
                cmd.Parameters.AddWithValue("@User_Pass", ComputeSha256Hash(txtCPass.Text.Trim()));
                cmd.Parameters.AddWithValue("@User_FName", txtFName.Text.Trim());
                cmd.Parameters.AddWithValue("@User_LName", txtLName.Text.Trim());

                // need to convert YOB to an integer before storing
                cmd.Parameters.AddWithValue("@User_YOB", Convert.ToInt64(txtYoB.Text.Trim()));

                // open the connection
                conn.Open();

                // execute the command
                cmd.ExecuteNonQuery();

                conn.Close();
                Response.Redirect("RegSuccess.aspx");
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
            }
        }
    }
}

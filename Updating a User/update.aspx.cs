using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPortfolio
{
    public partial class update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Logical test to see if user is logged in
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            // Logical test to see if its a postback
            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // create a connection
            SqlConnection conn = new SqlConnection(dsUpdate.ConnectionString);

            // create a command
            SqlCommand cmd = new SqlCommand(dsUpdate.UpdateCommand, conn);

            // populate parameters
            cmd.Parameters.AddWithValue("@User_Email", lblEmail.Text.Trim());

            // populate password based on whether or not it was changed
            if (txtPass.Text.Trim() == string.Empty)
            {
                // we use the old password
                cmd.Parameters.AddWithValue("@User_Pass", lblPass.Text.Trim());
            }
            else
            {
                // we hash the value in the confirm textbox
                cmd.Parameters.AddWithValue("@User_Pass", ComputeSha256Hash(txtPass.Text.Trim()));
            }

            cmd.Parameters.AddWithValue("@User_FName", txtFName.Text.Trim());
            cmd.Parameters.AddWithValue("@User_LName", txtLName.Text.Trim());
            cmd.Parameters.AddWithValue("@User_YOB", Convert.ToInt32(txtYOB.Text.Trim()));

            // perform the update
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                lblError.Text = "Update Successful";
                LoadUserData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }

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

        private void LoadUserData()
        {
            // create connection
            SqlConnection conn = new SqlConnection(dsUpdate.ConnectionString);

            // create and configure sqlcommand
            SqlCommand cmd = new SqlCommand(dsUpdate.SelectCommand, conn);
            cmd.Parameters.AddWithValue("@User_Email", Session["UserID"].ToString());

            // process the read
            try
            {
                // open the connection
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    lblEmail.Text = reader[0].ToString();
                    lblPass.Text = reader[1].ToString();
                    txtFName.Text = reader[2].ToString();
                    txtLName.Text = reader[3].ToString();
                    txtYOB.Text = reader[4].ToString();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
    }
}

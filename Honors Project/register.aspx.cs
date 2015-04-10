using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace Honors_Project
{
    public partial class register : System.Web.UI.Page
    {
        protected void Register(object sender, EventArgs e)
        {
            int IDno = 0;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_User"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Username", usernameTXT.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", passwordTXT.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", emailTXT.Text.Trim());
                        cmd.Connection = con;
                        con.Open();
                        IDno = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                string message = string.Empty;
                switch (IDno)
                {
                    case -1:
                        message = "Username already exists.\\nPlease choose a different username.";
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        break;
                    default:
                        message = "Registration successful.";
                        //SendEmail(emailTXT.Text.Trim());
                        Response.Redirect("~/login.aspx");
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
            }
        }

        private void SendEmail(string recipient)
        {
            string sender = "";
            string password = "";
            using(MailMessage email = new MailMessage(sender, recipient))
            {
                email.Subject = "Account Registration";
                email.Body = "Your account was successfully added to the database.";
                email.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.live.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(sender, password);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(email);
            }
        }

    }
}
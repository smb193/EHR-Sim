using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Honors_Project.Teach
{
    public partial class AddPatient : System.Web.UI.Page
    {
        protected void CreatePatient(object sender, EventArgs e)
        {
            int IDno = 0;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_Patient", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FName", fnameTXT.Text.Trim());
                        cmd.Parameters.AddWithValue("@LName", lnameTXT.Text.Trim());
                        cmd.Parameters.AddWithValue("@Age", Convert.ToInt16(ageTXT.Text.Trim()));
                        cmd.Parameters.AddWithValue("@HeightIn", Convert.ToInt16(heightTXT.Text.Trim()));
                        cmd.Parameters.AddWithValue("@WeightLb", Convert.ToInt32(weightTXT.Text.Trim()));
                        cmd.Parameters.AddWithValue("@Sex", genderBTN.SelectedValue);
                        cmd.Connection = con;
                        con.Open();
                        IDno = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                        Response.Redirect("~/Teach/Patients.aspx", true);
                    }
                }
            }
        }

        protected void CancelAdd(object sender, EventArgs e)
        {
            Response.Redirect("~/Teach/Patients.aspx");
        }
    }
}
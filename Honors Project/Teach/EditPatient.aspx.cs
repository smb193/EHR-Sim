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
    public partial class EditPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string IDno = Request.QueryString["id"];
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                SqlDataReader reader;
                using (SqlConnection con = new SqlConnection(constr))
                { 
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Patients WHERE ID ='" + IDno + "'", con))
                    {
                        con.Open();
                        reader = cmd.ExecuteReader();
                        while(reader.Read())
                        {
                            fnameTXT.Text = reader["FName"].ToString();
                            lnameTXT.Text = reader["LName"].ToString();
                            ageTXT.Text = reader["Age"].ToString();
                            genderBTN.SelectedValue = reader["Sex"].ToString();
                            heightTXT.Text = reader["HeightIn"].ToString();
                            weightTXT.Text = reader["WeightLb"].ToString();
                        }
                        con.Close();
                    }
                }
            }
        }

        protected void Update_Patient(object sender, EventArgs e)
        {
            string IDno = Request.QueryString["id"];
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string cmdstr = "UPDATE Patients SET FName = @FName, LName = @LName, Age = @Age, Sex = @Sex, HeightIn = @HeightIn, WeightLb = @WeightLb WHERE ID = '" + IDno + "'";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdstr, con))
                {
                    cmd.Parameters.AddWithValue("@FName", fnameTXT.Text.Trim());
                    cmd.Parameters.AddWithValue("@LName", lnameTXT.Text.Trim());
                    cmd.Parameters.AddWithValue("@Age", Convert.ToInt16(ageTXT.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Sex", Convert.ToChar(genderBTN.SelectedValue));
                    cmd.Parameters.AddWithValue("@HeightIn", Convert.ToInt16(heightTXT.Text.Trim()));
                    cmd.Parameters.AddWithValue("WeightLb", Convert.ToInt32(weightTXT.Text.Trim()));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("~/Teach/Patients.aspx");
                }
            }
        }

        protected void Cancel_Update(object sender, EventArgs e)
        {
            Response.Redirect("~/Teach/Patients.aspx");
        }
    }
}
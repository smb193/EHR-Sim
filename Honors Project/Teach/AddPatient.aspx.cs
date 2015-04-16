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
        protected void CreatePatient(object sender, WizardNavigationEventArgs e)
        {
            int IDno = 0;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string cmdstr1 = "INSERT INTO Patients (FName, LName, Age, HeightIn, WeightLb, Sex, Background) VALUES (@FName, @LName, @Age, @HeightIn, @WeightLb, @Sex, @Background); SELECT SCOPE_IDENTITY()";
            string cmdstr2 = "INSERT INTO BMP VALUES (@ID, @Glucose, @CO2, @Sodium, @Potassium, @Chloride, @BUN, @Creatinine)";
            string cmdstr3 = "INSERT INTO CBMP VALUES (@ID, @Calcium, @Albumin, @Protein, @ALP, @ALT, @AST, @Bilirubin, @TotalChol, @HDL, @LDL, @TG";
            string cmdstr4 = "INSERT INTO Blood VALUES (@ID, @RBC, @Hgb, @Hct, @MCV, @MCH, @MCHC, @WBC)";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdstr1, con))
                {
                    cmd.Parameters.AddWithValue("@FName", fname.Text.Trim());
                    cmd.Parameters.AddWithValue("@LName", lname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Age", Convert.ToInt16(Age.Text.Trim()));
                    cmd.Parameters.AddWithValue("@HeightIn", Convert.ToInt16(Heightin.Text.Trim()));
                    cmd.Parameters.AddWithValue("@WeightLb", Convert.ToInt32(Weightlb.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Sex", genderBTN.SelectedValue);
                    cmd.Parameters.AddWithValue("@Background", bg.Text.Trim());
                    con.Open();
                    IDno = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand(cmdstr2, con))
                {
                    cmd.Parameters.AddWithValue("@ID", IDno);
                    cmd.Parameters.AddWithValue("@Glucose", glucose.Text.Trim());
                    cmd.Parameters.AddWithValue("@CO2", co2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Sodium", sodium.Text.Trim());
                    cmd.Parameters.AddWithValue("@Potassium", Potassium.Text.Trim());
                    cmd.Parameters.AddWithValue("@Chloride", Chloride.Text.Trim());
                    cmd.Parameters.AddWithValue("@BUN", bun.Text.Trim());
                    cmd.Parameters.AddWithValue("@Creatinine", Creatinine.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand(cmdstr3, con))
                {
                    cmd.Parameters.AddWithValue("@ID", IDno);
                    cmd.Parameters.AddWithValue("@Calcium", Calcium.Text.Trim());
                    cmd.Parameters.AddWithValue("@Albumin", albumin.Text.Trim());
                    cmd.Parameters.AddWithValue("@Protein", protein.Text.Trim());
                    cmd.Parameters.AddWithValue("@ALP", alp.Text.Trim());
                    cmd.Parameters.AddWithValue("@ALT", alt.Text.Trim());
                    cmd.Parameters.AddWithValue("@AST", ast.Text.Trim());
                    cmd.Parameters.AddWithValue("@Bilirubin", bilirubin.Text.Trim());
                    cmd.Parameters.AddWithValue("@TotalChol", totalchol.Text.Trim());
                    cmd.Parameters.AddWithValue("@HDL", hdl.Text.Trim());
                    cmd.Parameters.AddWithValue("@LDL", ldl.Text.Trim());
                    cmd.Parameters.AddWithValue("@TG", tg.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand(cmdstr4, con))
                {
                    cmd.Parameters.AddWithValue("@ID", IDno);
                    cmd.Parameters.AddWithValue("@RBC", rbc.Text.Trim());
                    cmd.Parameters.AddWithValue("@Hgb", hgb.Text.Trim());
                    cmd.Parameters.AddWithValue("@Hct", hct.Text.Trim());
                    cmd.Parameters.AddWithValue("@MCV", mcv.Text.Trim());
                    cmd.Parameters.AddWithValue("@MCH", mch.Text.Trim());
                    cmd.Parameters.AddWithValue("@MCHC", mchc.Text.Trim());
                    cmd.Parameters.AddWithValue("@WBC", WBC.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect("~/Teach/Patients.aspx", true);
        }

        protected void CancelAdd(object sender, EventArgs e)
        {
            Response.Redirect("~/Teach/Patients.aspx");
        }
    }
}
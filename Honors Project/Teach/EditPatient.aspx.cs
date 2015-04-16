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

        }

        protected void Update_Patient(object sender, WizardNavigationEventArgs e)
        {
            WizardStep step1 = (WizardStep)Wizard1.FindControl("Step1");
            WizardStep step2 = (WizardStep)Wizard1.FindControl("Step2");
            WizardStep step3 = (WizardStep)Wizard1.FindControl("Step3");
            WizardStep step4 = (WizardStep)Wizard1.FindControl("Step4");
            WizardStep step5 = (WizardStep)Wizard1.FindControl("Step5");

            FormView fv1 = (FormView)step1.FindControl("fv1");
            FormView fv2 = (FormView)step2.FindControl("fv2");
            FormView fv3 = (FormView)step3.FindControl("fv3");
            FormView fv4 = (FormView)step4.FindControl("fv4");
            FormView fv5 = (FormView)step5.FindControl("fv5");

            string fname = ((TextBox)fv1.FindControl("fname")).Text;
            string lname = ((TextBox)fv1.FindControl("lname")).Text;
            string age = ((TextBox)fv1.FindControl("Age")).Text;
            string sex = ((RadioButtonList)fv1.FindControl("genderBTN")).SelectedValue;
            string height = ((TextBox)fv1.FindControl("Heightin")).Text;
            string weight = ((TextBox)fv1.FindControl("Weightlb")).Text;
            string bg = ((TextBox)fv2.FindControl("bg")).Text;

            string glucose = ((TextBox)fv3.FindControl("glucose")).Text;
            string co2 = ((TextBox)fv3.FindControl("co2")).Text;
            string sodium = ((TextBox)fv3.FindControl("sodium")).Text;
            string potassium = ((TextBox)fv3.FindControl("Potassium")).Text;
            string chloride = ((TextBox)fv3.FindControl("Chloride")).Text;
            string bun = ((TextBox)fv3.FindControl("bun")).Text;
            string creatinine = ((TextBox)fv3.FindControl("Creatinine")).Text;

            string calcium = ((TextBox)fv4.FindControl("Calcium")).Text;
            string albumin = ((TextBox)fv4.FindControl("albumin")).Text;
            string protein = ((TextBox)fv4.FindControl("protein")).Text;
            string alp = ((TextBox)fv4.FindControl("alp")).Text;
            string alt = ((TextBox)fv4.FindControl("alt")).Text;
            string ast = ((TextBox)fv4.FindControl("ast")).Text;
            string bilirubin = ((TextBox)fv4.FindControl("bilirubin")).Text;
            string totalchol = ((TextBox)fv4.FindControl("totalchol")).Text;
            string hdl = ((TextBox)fv4.FindControl("hdl")).Text;
            string ldl = ((TextBox)fv4.FindControl("ldl")).Text;
            string tg = ((TextBox)fv4.FindControl("tg")).Text;

            string rbc = ((TextBox)fv5.FindControl("rbc")).Text;
            string hgb = ((TextBox)fv5.FindControl("hgb")).Text;
            string hct = ((TextBox)fv5.FindControl("hct")).Text;
            string mcv = ((TextBox)fv5.FindControl("mcv")).Text;
            string mch = ((TextBox)fv5.FindControl("mch")).Text;
            string mchc = ((TextBox)fv5.FindControl("mchc")).Text;
            string wbc = ((TextBox)fv5.FindControl("WBC")).Text;

            string IDno = Request.QueryString["id"];
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string cmdstr1 = "UPDATE Patients SET FName=@FName, LName=@LName, Age=@Age, Sex=@Sex, HeightIn=@HeightIn, WeightLb=@WeightLb, Background=@Background WHERE ID=@ID";
            string cmdstr2 = "UPDATE INTO BMP SET Glucose=@Glucose, CO2=@CO2, Sodium=@Sodium, Potassium=@Potassium, Chloride=@Chloride, BUN=@BUN, Creatinine=@Creatinine WHERE ID=@ID";
            string cmdstr3 = "UPDATE INTO CBMP SET Calcium=@Calcium, Albumin=@Albumin, Protein=@Protein, ALP=@ALP, ALT=@ALT, AST=@AST, Bilirubin=@Bilirubin, Total Chol=@TotalChol, HDL=@HDL, LDL=@LDL, TG=@TG WHERE ID=@ID";
            string cmdstr4 = "UPDATE INTO Blood SET RBC=@RBC, Hgb=@Hgb, Hct=@Hct, MCV=@MCV, MCH=@MCH, MCHC=@MCHC, WBC=@WBC WHERE ID=@ID";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(cmdstr1, con))
                {
                    cmd.Parameters.AddWithValue("@ID", IDno);
                    cmd.Parameters.AddWithValue("@FName", fname);
                    cmd.Parameters.AddWithValue("@LName", lname);
                    cmd.Parameters.AddWithValue("@Age", Convert.ToInt16(age));
                    cmd.Parameters.AddWithValue("@HeightIn", Convert.ToInt16(height));
                    cmd.Parameters.AddWithValue("@WeightLb", Convert.ToInt32(weight));
                    cmd.Parameters.AddWithValue("@Sex", sex);
                    cmd.Parameters.AddWithValue("@Background", bg);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand(cmdstr2, con))
                {
                    cmd.Parameters.AddWithValue("@ID", IDno);
                    cmd.Parameters.AddWithValue("@Glucose", glucose);
                    cmd.Parameters.AddWithValue("@CO2", co2);
                    cmd.Parameters.AddWithValue("@Sodium", sodium);
                    cmd.Parameters.AddWithValue("@Potassium", potassium);
                    cmd.Parameters.AddWithValue("@Chloride", chloride);
                    cmd.Parameters.AddWithValue("@BUN", bun);
                    cmd.Parameters.AddWithValue("@Creatinine", creatinine);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand(cmdstr3, con))
                {
                    cmd.Parameters.AddWithValue("@ID", IDno);
                    cmd.Parameters.AddWithValue("@Calcium", calcium);
                    cmd.Parameters.AddWithValue("@Albumin", albumin);
                    cmd.Parameters.AddWithValue("@Protein", protein);
                    cmd.Parameters.AddWithValue("@ALP", alp);
                    cmd.Parameters.AddWithValue("@ALT", alt);
                    cmd.Parameters.AddWithValue("@AST", ast);
                    cmd.Parameters.AddWithValue("@Bilirubin", bilirubin);
                    cmd.Parameters.AddWithValue("@TotalChol", totalchol);
                    cmd.Parameters.AddWithValue("@HDL", hdl);
                    cmd.Parameters.AddWithValue("@LDL", ldl);
                    cmd.Parameters.AddWithValue("@TG", tg);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand(cmdstr4, con))
                {
                    cmd.Parameters.AddWithValue("@ID", IDno);
                    cmd.Parameters.AddWithValue("@RBC", rbc);
                    cmd.Parameters.AddWithValue("@Hgb", hgb);
                    cmd.Parameters.AddWithValue("@Hct", hct);
                    cmd.Parameters.AddWithValue("@MCV", mcv);
                    cmd.Parameters.AddWithValue("@MCH", mch);
                    cmd.Parameters.AddWithValue("@MCHC", mchc);
                    cmd.Parameters.AddWithValue("@WBC", wbc);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect("~/Teach/Patients.aspx", true);
        }

        protected void Cancel_Update(object sender, EventArgs e)
        {
            Response.Redirect("~/Teach/Patients.aspx");
        }

        protected string genderSelect(string dbval, string itemval)
        {
            if (dbval == itemval)
                return "True";
            return "False";
        }
    }
}
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Honors_Project
{
    public partial class response : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Wizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            int ID = Convert.ToInt32(Session["ID"]);
            int pcID = Convert.ToInt32(Request.QueryString["id"]);

            WizardStep step1 = (WizardStep)Wizard1.FindControl("Step1");
            WizardStep step6 = (WizardStep)Wizard1.FindControl("Step6");
            WizardStep step7 = (WizardStep)Wizard1.FindControl("Step7");
            FormView fv1 = (FormView)step1.FindControl("fv1");

            TextBox heighttxt = (TextBox)fv1.FindControl("HeightCm");
            TextBox weighttxt = (TextBox)fv1.FindControl("WeightKg");
            TextBox ibwtxt = (TextBox)fv1.FindControl("ibw");
            TextBox pibwtxt = (TextBox)fv1.FindControl("pibw");

            TextBox hbetxt = (TextBox)step6.FindControl("hbe");
            TextBox msjtxt = (TextBox)step6.FindControl("msj");
            TextBox kcaltxt = (TextBox)step6.FindControl("kcal");
            TextBox proteintxt = (TextBox)step6.FindControl("proteinTxt");
            TextBox hstxt = (TextBox)step6.FindControl("hs");
            TextBox flagetxt = (TextBox)step6.FindControl("flage");
            TextBox energytxt = (TextBox)step6.FindControl("energy");

            TextBox pestxt = (TextBox)step7.FindControl("pes");
            TextBox intervtxt = (TextBox)step7.FindControl("interv");

            double height = Convert.ToDouble(heighttxt.Text);
            double weight = Convert.ToDouble(weighttxt.Text);
            string ibw = ibwtxt.Text;
            string pibw = pibwtxt.Text;

            string hbe = hbetxt.Text;
            string msj = msjtxt.Text;
            string kcal = kcaltxt.Text;
            string protein = proteintxt.Text;
            string hs = hstxt.Text;
            string flage = flagetxt.Text;
            string energy = energytxt.Text;
            string pes = pestxt.Text;
            string interv = intervtxt.Text;

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Response (StudentID, PatientClassID, HeightCm, WeightKg, HBE, MSJ, Kcal, Protein, PES, FlHS, FlAge, FlEnergy, Interv, IBW, PIBW) VALUES (@StudentID, @PatientClassID, @HeightCm, @WeightKg, @HBE, @MSJ, @Kcal, @Protein, @PES, @FlHS, @FlAge, @FlEnergy, @Interv, @IBW, @PIBW)"))
                {
                    cmd.Parameters.AddWithValue("@StudentID", ID);
                    cmd.Parameters.AddWithValue("@PatientClassID", pcID);
                    cmd.Parameters.AddWithValue("@HeightCm", height);
                    cmd.Parameters.AddWithValue("@WeightKg", weight);
                    cmd.Parameters.AddWithValue("@HBE", hbe);
                    cmd.Parameters.AddWithValue("@MSJ", msj);
                    cmd.Parameters.AddWithValue("@Kcal", kcal);
                    cmd.Parameters.AddWithValue("@Protein", protein);
                    cmd.Parameters.AddWithValue("@PES", pes);
                    cmd.Parameters.AddWithValue("@FlHS", hs);
                    cmd.Parameters.AddWithValue("@FlAge", flage);
                    cmd.Parameters.AddWithValue("@FlEnergy", energy);
                    cmd.Parameters.AddWithValue("@Interv", interv);
                    cmd.Parameters.AddWithValue("@IBW", ibw);
                    cmd.Parameters.AddWithValue("@PIBW", pibw);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}
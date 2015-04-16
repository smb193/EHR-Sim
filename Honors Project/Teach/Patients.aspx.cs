using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Honors_Project.Teach
{
    public partial class Patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (this.Page.User.IsInRole("Admin") || this.Page.User.IsInRole("Prof"))
                {
                    Panel1.Visible = true;
                }
            }
        }

        protected string SetNavigateUrl(object ID)
        {
            string url = "EditPatient.aspx?id=" + ID.ToString();
            return url;
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Teach/AddPatient.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this patient.";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#7242ff");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#e9dafe");
                    row.ToolTip = "Click to select this patient.";
                }
            }
        }

        protected void patientButton_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text);
            int classID = Convert.ToInt32(classList.SelectedValue);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO PatientClass (PatientID, ClassID) VALUES (@PatientID, @ClassID)"))
                {
                    cmd.Parameters.AddWithValue("@PatientID", ID);
                    cmd.Parameters.AddWithValue("@ClassID", classID);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}
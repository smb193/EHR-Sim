using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Honors_Project
{
    public partial class apply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string determineApprovalText(string status)
        {
            if(status == "Y")
            {
                return "Enrolled";
            }
            if(status == "N")
            {
                return "Pending";
            }
            return "Not Enrolled";
        }

        protected void ApplyToClass(object sender, EventArgs e)
        {
            int IDno = int.Parse((sender as Button).CommandArgument);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO ClassList (ClassID, StudentID) VALUES (@ClassID, @StudentID)", con))
                {
                    cmd.Parameters.AddWithValue("ClassID", IDno);
                    cmd.Parameters.AddWithValue("StudentID", Convert.ToInt32(Session["ID"]));
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}
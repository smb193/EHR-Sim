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

namespace Honors_Project.Teach
{
    public partial class ViewClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ApproveStudent(object sender, EventArgs e)
        {
            int IDno = int.Parse((sender as Button).CommandArgument);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE ClassList SET isApproved='Y' WHERE ID=@ID", con))
                {
                    cmd.Parameters.AddWithValue("ID", IDno);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}
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
    }
}
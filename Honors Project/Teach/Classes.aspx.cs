using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Honors_Project.Teach
{
    public partial class Classes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string SetNavigateUrl(object ID)
        {
            string url = "ViewClass.aspx?id=" + ID.ToString();
            return url;
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Teach/AddClass.aspx");
        }
    }
}
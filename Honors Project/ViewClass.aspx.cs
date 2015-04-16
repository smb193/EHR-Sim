using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Honors_Project
{
    public partial class ViewClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string SetNavigateUrl(object ID)
        {
            string url = "~/Response.aspx?id=" + ID.ToString();
            return url;
        }
    }
}
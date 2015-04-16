using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Honors_Project.Teach
{
    public partial class ViewResponses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string getNavUrl(string ID)
        {
            string url = "~/Teach/response.aspx?id=" + ID;
            return url;
        }
    }
}
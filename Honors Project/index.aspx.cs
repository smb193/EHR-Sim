using System;
using System.Web.Security;

namespace Honors_Project
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }
        protected string SetNavigateUrl(object ID)
        {
            string url = "~/ViewClass.aspx?id=" + ID.ToString();
            return url;
        }
    }
}
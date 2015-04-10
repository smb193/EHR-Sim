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

namespace Honors_Project.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (this.Page.User.IsInRole("Admin"))
                {
                    Panel1.Visible = true;
                    GridView1.DataSource = GetData("SELECT ID, Username, RoleNumber FROM Users");
                    GridView1.DataBind();
                }
            }
        }

        private DataTable GetData(string query)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlRoles = (e.Row.FindControl("ddlRoles") as DropDownList);
                ddlRoles.DataSource = GetData("SELECT RoleNumber, RoleName FROM Roles");
                ddlRoles.DataTextField = "RoleName";
                ddlRoles.DataValueField = "RoleNumber";
                ddlRoles.DataBind();

                string assignedRole = (e.Row.DataItem as DataRowView)["RoleNumber"].ToString();
                ddlRoles.Items.FindByValue(assignedRole).Selected = true;
            }
        }

        protected void UpdateRole(object sender, EventArgs e)
        {
            GridViewRow row = ((sender as Button).NamingContainer as GridViewRow);
            int IDno = int.Parse((sender as Button).CommandArgument);
            int roleNo = int.Parse((row.FindControl("ddlRoles") as DropDownList).SelectedItem.Value);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Users SET RoleNumber = @RoleNumber WHERE ID = @ID"))
                {
                    cmd.Parameters.AddWithValue("@ID", IDno);
                    cmd.Parameters.AddWithValue("@RoleNumber", roleNo);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}
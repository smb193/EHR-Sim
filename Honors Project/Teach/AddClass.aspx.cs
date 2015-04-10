using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Honors_Project.Teach
{
    public partial class AddClass : System.Web.UI.Page
    {
        protected void Create_Class(object sender, EventArgs e)
        {
            string classID;
            string IDno = Session["ID"].ToString();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string cmdstr = "INSERT INTO Classes (Course, Section, Instructor, Name, Year, Semester) " +
                "VALUES (@Course, @Section, @Instructor, @Name, @Year, @Semester) SELECT SCOPE_IDENTITY()";
            string cmdstr2 = "INSERT INTO ClassList (ClassID, StudentID, isApproved) VALUES (@ClassID, @StudentID, 'Y')";
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd1 = new SqlCommand(cmdstr, con);
                SqlCommand cmd2 = new SqlCommand(cmdstr2, con);
                cmd1.Parameters.AddWithValue("@Course", Convert.ToInt32(courseTXT.Text));
                cmd1.Parameters.AddWithValue("@Section", sectionTXT.Text.Trim());
                cmd1.Parameters.AddWithValue("@Instructor", IDno);
                cmd1.Parameters.AddWithValue("@Name", nameTXT.Text.Trim());
                cmd1.Parameters.AddWithValue("@Year", Convert.ToInt32(yearTXT.Text.Trim()));
                cmd1.Parameters.AddWithValue("@Semester", semBtn.SelectedValue);
                cmd2.Parameters.AddWithValue("@StudentID", IDno);
                con.Open();
                classID = cmd1.ExecuteScalar().ToString();
                cmd2.Parameters.AddWithValue("@ClassID", classID);
                cmd2.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/Teach/Classes.aspx", true);
            }
        }

        protected void CancelAdd(object sender, EventArgs e)
        {
            Response.Redirect("~/Teach/Classes.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MileStone3
{
    public partial class LecturerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Home(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand userTypeCheck = new SqlCommand("GetType", conn);
            userTypeCheck.CommandType = CommandType.StoredProcedure;
            SqlParameter userid = userTypeCheck.Parameters.Add(new SqlParameter("@userID", SqlDbType.Int));
            userid.Value = Session["ID"];
            SqlParameter type = userTypeCheck.Parameters.Add("@type", SqlDbType.VarChar, 50);
            type.Direction = ParameterDirection.Output;
            conn.Open();
            userTypeCheck.ExecuteNonQuery();
            conn.Close();

            if (type.Value.ToString().Equals("Student"))
            {
                Response.Redirect("Student.aspx");
            }
            else if (type.Value.ToString().Equals("Company"))
            {
                Response.Redirect("Company.aspx");
            }
            else if (type.Value.ToString().Equals("Employee"))
            {
                Response.Redirect("EmpView.aspx");
            }
            else if (type.Value.ToString().Equals("External Examiner"))
            {
                Response.Redirect("EE.aspx");
            }
            else if (type.Value.ToString().Equals("Lecturer"))
            {
                Response.Redirect("Lecturer.aspx");
            }
            else if (type.Value.ToString().Equals("Coordinator"))
            {
                Response.Redirect("Coordinator.aspx");
            }
            else if (type.Value.ToString().Equals("Teaching Assistant"))
            {
                Response.Redirect("TA.aspx");
            }
        }

        protected void ViewBachelor(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            Response.Redirect("ViewBachelor.aspx");

        }
        protected void Logout(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            Session["ID"] = -1;
            Response.Redirect("UserLogin.aspx");

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand userTypeCheck = new SqlCommand("GetType", conn);
            userTypeCheck.CommandType = CommandType.StoredProcedure;
            SqlParameter userid = userTypeCheck.Parameters.Add(new SqlParameter("@userID", SqlDbType.Int));
            userid.Value = Session["ID"];
            SqlParameter type = userTypeCheck.Parameters.Add("@type", SqlDbType.VarChar, 50);
            type.Direction = ParameterDirection.Output;
            conn.Open();
            userTypeCheck.ExecuteNonQuery();
            conn.Close();

            if (type.Value.ToString().Equals("Student"))
            {
                Response.Redirect("Student.aspx");
            }
            else if (type.Value.ToString().Equals("Company"))
            {
                Response.Redirect("Company.aspx");
            }
            else if (type.Value.ToString().Equals("Employee"))
            {
                Response.Redirect("EmpView.aspx");
            }
            else if (type.Value.ToString().Equals("External Examiner"))
            {
                Response.Redirect("EE.aspx");
            }
            else if (type.Value.ToString().Equals("Lecturer"))
            {
                Response.Redirect("Lecturer.aspx");
            }
            else if (type.Value.ToString().Equals("Coordinator"))
            {
                Response.Redirect("Coordinator.aspx");
            }
            else if (type.Value.ToString().Equals("Teaching Assistant"))
            {
                Response.Redirect("TA.aspx");
            }
        }

        protected void ViewProfile(object sender, EventArgs e)
        {

            Response.Redirect("ViewMyProfile.aspx");

        }

        protected void LecturerCreateLocalProject(object sender, EventArgs e)
        {
            Response.Redirect("createsBachelorPro.aspx");

        }

        protected void SpecifyThesisDeadline(object sender, EventArgs e)
        {
            Response.Redirect("LecturerSpecifiesDeadline.aspx");

        }

        protected void CreateMeeting(object sender, EventArgs e)
        {
            Response.Redirect("LecCreateMeeting.aspx");

        }

        protected void LecturerAddToDo(object sender, EventArgs e)
        {
            Response.Redirect("LecturerAddToDo.aspx");

        }

        protected void ViewMeetingLecturer(object sender, EventArgs e)
        {
            Response.Redirect("viewMeeting.aspx");

        }

        protected void ViewEE(object sender, EventArgs e)
        {
            Response.Redirect("ViewNotRecommended.aspx");
        }

        protected void RecommendEE(object sender, EventArgs e)
        {
            Response.Redirect("LecRecommendEEtoProject.aspx");

        }

        protected void SuperviseIndustrial(object sender, EventArgs e)
        {

        }

        protected void LecGradeThesis(object sender, EventArgs e)
        {
            Response.Redirect("Lecturer Grade thesis.aspx");

        }

        protected void LecGradedefense(object sender, EventArgs e)
        {
            Response.Redirect("Lecturer Grade defence.aspx");

        }

        protected void LecCreatePR(object sender, EventArgs e)
        {
            Response.Redirect("Create progress report.aspx");

        }

        protected void LecGradePR(object sender, EventArgs e)
        {
            Response.Redirect("GradeProgressReport.aspx");

        }
    }
}
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
    public partial class createsBachelorPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void Create_bachelor_project_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand createProject = new SqlCommand("LecturerCreateLocalProject", conn);
            createProject.CommandType = CommandType.StoredProcedure;

            SqlParameter projectName = createProject.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar, 50));
                projectName.Value = project_nameIN.Text;

            SqlParameter project_description= createProject.Parameters.Add(new SqlParameter("@description", SqlDbType.VarChar, 200));
                project_description.Value = Project_descriptionIN.Text;

            SqlParameter projectcode = createProject.Parameters.Add(new SqlParameter("@proj_code", SqlDbType.VarChar, 10));
                projectcode.Value = project_codeIN.Text;

            SqlParameter majorcode = createProject.Parameters.Add(new SqlParameter("@major_code", SqlDbType.VarChar, 10));
            majorcode.Value = major_codeIN.Text;

            SqlParameter Lecturerid = createProject.Parameters.Add(new SqlParameter("@Lecturer_id", SqlDbType.Int));
            Lecturerid.Value = Session["ID"];

            conn.Open();
            createProject.ExecuteNonQuery();
            conn.Close();


        }
    }
}
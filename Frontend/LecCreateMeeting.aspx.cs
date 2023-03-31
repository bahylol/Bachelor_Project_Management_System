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
    public partial class CreateMeeting : System.Web.UI.Page
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

        protected void BookMeeting_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand BookMeeting = new SqlCommand("CreateMeeting", conn);
            BookMeeting.CommandType = CommandType.StoredProcedure;

            SqlParameter LecturerID = BookMeeting.Parameters.Add(new SqlParameter("@Lecturer_id", SqlDbType.Text));
            LecturerID.Value = Session["ID"];

            SqlParameter StartTime = new SqlParameter("@start_time",SqlDbType.Time);
            StartTime.Value = startTimeIN.Text;

            SqlParameter endTime = new SqlParameter("@end_time", SqlDbType.Time);
            endTime.Value = endTimeIN.Text;

            SqlParameter meetingDate = new SqlParameter("@start_time", SqlDbType.DateTime);
            meetingDate.Value = dateIN.Text;

            SqlParameter meetingLocation = new SqlParameter("@start_time", SqlDbType.VarChar,5);
            meetingLocation.Value = meetingPointIN.Text;


            conn.Open();
            BookMeeting.ExecuteNonQuery();
            conn.Close();

        }
    }
}
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
    public partial class Create_progress_report : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand createProgressReport = new SqlCommand("@LecCreatePR", conn);
            createProgressReport.CommandType = CommandType.StoredProcedure;

            SqlParameter PRstudentID = createProgressReport.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            PRstudentID.Value = Int16.Parse(ProgressReportIdIN.Text);

            SqlParameter PRdate = createProgressReport.Parameters.Add(new SqlParameter("@date", SqlDbType.Date));
            PRdate.Value = DateTime.Parse(PRDateIN.Text);

            SqlParameter PRcontent = createProgressReport.Parameters.Add(new SqlParameter("@content", SqlDbType.VarChar,1000));
            PRcontent.Value = PRcontentIN.Text;

            conn.Open();
            createProgressReport.ExecuteNonQuery();
            conn.Close();   
        }
    }
}
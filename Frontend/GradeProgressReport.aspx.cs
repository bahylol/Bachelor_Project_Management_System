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
    public partial class GradeProgressReport : System.Web.UI.Page
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

            SqlCommand gradePR = new SqlCommand("LecGradePR", conn);
            gradePR.CommandType = CommandType.StoredProcedure;

            SqlParameter studentIdPR = gradePR.Parameters.Add(new SqlParameter("@sid", SqlDbType.VarChar, 50));
            studentIdPR.Value = PRgradeSidIN.Text;

            SqlParameter PRgradeDate = gradePR.Parameters.Add(new SqlParameter("@date", SqlDbType.DateTime));
            PRgradeDate.Value = DateTime.Parse(PRgradeDateIN.Text);

            SqlParameter PRgrade = gradePR.Parameters.Add(new SqlParameter("@lecturer_grade", SqlDbType.Decimal));
            PRgrade.Value = Decimal.Parse(PRgradeIN.Text);

            conn.Open();
            gradePR.ExecuteNonQuery();  
            conn.Close();
        }
    }
}
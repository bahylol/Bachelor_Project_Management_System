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
    public partial class Register : System.Web.UI.Page
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

        protected void RegisterAccount(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);

            String userRole = UserRole_Entry.Text;
            String username = UserName_Entry.Text;
            String userEmail = UserEmail_Entry.Text;
            String firstName = FirstName_Entry.Text;
            String lastName = LastName_Entry.Text;
            String birthdate = BirthDate_Entry.Text;
            String gpa = GPA_Entry.Text;
            String semester = Semester_Entry.Text;
            String address = Address_Entry.Text;
            String facultyCode = FacultyCode_Entry.Text;
            String majorCode = MajorCode_Entry.Text;
            String company = CompanyName_Entry.Text;
            String repName = RepName_Entry.Text;
            String repEmail = RepEmail_Entry.Text;
            String phoneNum = Phone_Entry.Text;
            String country = Country_Entry.Text;

            SqlCommand RegisterProc = new SqlCommand("UserRegister", conn);
            RegisterProc.CommandType = CommandType.StoredProcedure;
            RegisterProc.Parameters.Add(new SqlParameter("@usertype", userRole));
            RegisterProc.Parameters.Add(new SqlParameter("@userName", username));
            RegisterProc.Parameters.Add(new SqlParameter("@email", userEmail));
            RegisterProc.Parameters.Add(new SqlParameter("@first_name", firstName));
            RegisterProc.Parameters.Add(new SqlParameter("@last_name", lastName));
            RegisterProc.Parameters.Add(new SqlParameter("@birth_date", birthdate));
            RegisterProc.Parameters.Add(new SqlParameter("@GPA", gpa));
            RegisterProc.Parameters.Add(new SqlParameter("@semester", semester));
            RegisterProc.Parameters.Add(new SqlParameter("@address", address));
            RegisterProc.Parameters.Add(new SqlParameter("@faculty_code", facultyCode));
            RegisterProc.Parameters.Add(new SqlParameter("@major_code", majorCode));
            RegisterProc.Parameters.Add(new SqlParameter("@company_name", company));
            RegisterProc.Parameters.Add(new SqlParameter("@representative_name", repName));
            RegisterProc.Parameters.Add(new SqlParameter("@representative_email", repEmail));
            RegisterProc.Parameters.Add(new SqlParameter("@phone_number", phoneNum));
            RegisterProc.Parameters.Add(new SqlParameter("@country_of_residence", country));

            if (company == null)
            {
                company = null;
            }
            if (repEmail == null)
            {
                repEmail = null;
            }
            if (repName == null)
            {
                repName = null;
            }
            if (gpa == null)
            {
                gpa = null;
            }
            if (semester == null)
            {
                semester = null;
            }
            if (facultyCode == null)
            {
                facultyCode = null;
            }
            if (majorCode == null)
            {
                majorCode = null;
            }



            SqlParameter user_id = RegisterProc.Parameters.Add("@user_id", SqlDbType.Int);
            SqlParameter password = RegisterProc.Parameters.Add("@password", SqlDbType.Text);

            user_id.Direction = ParameterDirection.Output;
            Session["ID"] = user_id;
            password.Direction = ParameterDirection.Output;

            conn.Open();
            RegisterProc.ExecuteNonQuery();
            conn.Close();

            Response.Write("REGISTER DONE  \n");


            for (int i = 0; i < 200; i++)
            {
                Response.Write("Your password is: " + password.ToString());
            }

            Response.Redirect("UserLogin.aspx");
        }
    }
}
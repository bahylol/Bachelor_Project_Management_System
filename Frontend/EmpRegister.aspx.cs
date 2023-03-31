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
    public partial class EmpRegister : System.Web.UI.Page
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
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);

            string companyID = TextBox1.Text;
            string email = TextBox2.Text;
            string name = TextBox3.Text;
            string phone = TextBox4.Text;
            string field = TextBox5.Text;

            SqlCommand AddEmp = new SqlCommand("AddEmployee", conn);
            AddEmp.CommandType = System.Data.CommandType.StoredProcedure;
            AddEmp.Parameters.Add(new SqlParameter("@CompanyID", companyID));
            AddEmp.Parameters.Add(new SqlParameter("@email", email));
            AddEmp.Parameters.Add(new SqlParameter("@name", name));
            AddEmp.Parameters.Add(new SqlParameter("@phone_number", phone));
            AddEmp.Parameters.Add(new SqlParameter("@field", field));

            SqlParameter StaffID = AddEmp.Parameters.Add("@staff_id", SqlDbType.Text);
            SqlParameter password = AddEmp.Parameters.Add("@employee_pass", SqlDbType.Text);
            SqlParameter cid = AddEmp.Parameters.Add("@cid", SqlDbType.Int);

            StaffID.Direction = ParameterDirection.Output;
            password.Direction = ParameterDirection.Output;
            cid.Direction = ParameterDirection.Output;

            conn.Open();
            AddEmp.ExecuteNonQuery();
            conn.Close();

            Response.Write("REGISTER DONE  \n");
            Response.Redirect("ViewMyProfile.aspx");

        }
    }
}
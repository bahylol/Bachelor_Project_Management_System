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
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);


            String username = Username_Entry.Text;

            String password = Password_Entry.Text;

            SqlCommand loginProc = new SqlCommand("UserLogin", conn);
            loginProc.CommandType = CommandType.StoredProcedure;
            loginProc.Parameters.Add(new SqlParameter("@email", username));
            loginProc.Parameters.Add(new SqlParameter("@password", password));

            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Bit);
            SqlParameter user_id = loginProc.Parameters.Add("@user_id", SqlDbType.Int);

            success.Direction = ParameterDirection.Output;
            user_id.Direction = ParameterDirection.Output;

            conn.Open();
            loginProc.ExecuteNonQuery();
            conn.Close();
            if (success.Value.ToString().Equals("True"))
            {
                
                SqlCommand userTypeCheck = new SqlCommand("GetType", conn);
                userTypeCheck.CommandType = CommandType.StoredProcedure;
                SqlParameter userid = userTypeCheck.Parameters.Add(new SqlParameter("@userID", SqlDbType.Int));
                userid.Value = user_id.Value;
                SqlParameter type = userTypeCheck.Parameters.Add("@type", SqlDbType.VarChar,50);
                type.Direction = ParameterDirection.Output;
                conn.Open();
                userTypeCheck.ExecuteNonQuery();
                conn.Close();
                Session["ID"] = user_id.Value;
 
                if (type.Value.ToString().Equals("Student"))
                {
                    Response.Write("ana hena");
                    Response.Redirect("Student.aspx");
                }
                else if(type.Value.ToString().Equals("Company"))
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
            else
            {
                Response.Write("Invalid email or password \n");
            }




        }

        protected void Register_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
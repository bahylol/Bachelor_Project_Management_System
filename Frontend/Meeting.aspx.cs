using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Caching;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MileStone3
{
    public partial class Meeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewAvailableMeetings(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewAvailable = new SqlCommand("ViewNotBookedMeetings", conn);
            viewAvailable.CommandType = CommandType.StoredProcedure;
            SqlParameter type = viewAvailable.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            type.Value = Session["ID"];
            using (conn)
            {
                conn.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(viewAvailable);
                DataTable data = new DataTable();
                dataAdapter.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
            addtoDoList.Visible = false;
            viewbooked.Visible = false;
            Bookmeet.Visible = true;
        }

        protected void BookMeeting(object sender, EventArgs e) {
                 //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand BookMeeting = new SqlCommand("BookMeeting", conn);
            BookMeeting.CommandType = CommandType.StoredProcedure;
            SqlParameter user = BookMeeting.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            user.Value = Session["ID"];
            SqlParameter meetingId = BookMeeting.Parameters.Add(new SqlParameter("@meeting_id", SqlDbType.Int));
            meetingId.Value = TextBox4.Text;
            conn.Open();
            BookMeeting.ExecuteNonQuery();
            conn.Close();

        }



        protected void MeetingsForm(object sender, EventArgs e)
        {
            addtoDoList.Visible = false;
            Bookmeet.Visible = false;
            viewbooked.Visible = true;
        }
        protected void ViewBookedMeetings(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewAvailable = new SqlCommand("ViewMeeting", conn);
            viewAvailable.CommandType = CommandType.StoredProcedure;
            SqlParameter meetingId = viewAvailable.Parameters.Add(new SqlParameter("@meeting_id", SqlDbType.Int));
            meetingId.Value = TextBox1.Text;
            SqlParameter user = viewAvailable.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            user.Value = Session["ID"];
            using (conn)
            {
                conn.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(viewAvailable);
                DataTable data = new DataTable();
                dataAdapter.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
            viewbooked.Visible = false;
            Bookmeet.Visible = false;
            addtoDoList.Visible = true;
        }
        protected void AdToDO(object sender, EventArgs e) {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand StudentAddToDo = new SqlCommand("StudentAddToDo", conn);
            StudentAddToDo.CommandType = CommandType.StoredProcedure;
            SqlParameter meetingId = StudentAddToDo.Parameters.Add(new SqlParameter("@meeting_id", SqlDbType.Int));
            meetingId.Value = TextBox2.Text;
            SqlParameter list = StudentAddToDo.Parameters.Add(new SqlParameter("@to_do_list", SqlDbType.VarChar,200));
            list.Value = TextBox3.Text;
            conn.Open();
            StudentAddToDo.ExecuteNonQuery();
            conn.Close();

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
            Response.Redirect("ViewBachelor.aspx");

        }
        protected void Logout(object sender, EventArgs e)
        {
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

        /* protected void Go_Click(object sender, EventArgs e)
         {
             string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
             //create a new connection
             SqlConnection conn = new SqlConnection(connStr);
             SqlCommand ShowCompanyDetails = new SqlCommand("ViewUsers", conn);
             ShowCompanyDetails.CommandType = CommandType.StoredProcedure;
             SqlParameter type = ShowCompanyDetails.Parameters.Add(new SqlParameter("@User_type", SqlDbType.VarChar, 20));
             type.Value = ChooseUserRole.SelectedItem.Value;
             SqlParameter id = ShowCompanyDetails.Parameters.Add(new SqlParameter("@User_id", SqlDbType.Int));
             id.Value = DBNull.Value;
             using (conn)
             {
                 conn.Open();
                 SqlDataAdapter dataAdapter = new SqlDataAdapter(ShowCompanyDetails);
                 DataTable data = new DataTable();
                 dataAdapter.Fill(data);
                 UserData.DataSource = data;
                 UserData.DataBind();
             }
         }*/
    }
}
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
    public partial class ViewBachelor : System.Web.UI.Page
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

        protected void ViewYourProjects(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewBachelor = new SqlCommand("ViewBachelorProjects", conn);
            viewBachelor.CommandType = CommandType.StoredProcedure;
            SqlParameter type = viewBachelor.Parameters.Add(new SqlParameter("@ProjectType", SqlDbType.VarChar, 20));
                type.Value = DBNull.Value;
            SqlParameter user = viewBachelor.Parameters.Add(new SqlParameter("@User_id", SqlDbType.Int));
            user.Value = Session["ID"];
            if (Session["ID"] == null)
                user.Value = DBNull.Value;
            using (conn)
            {
                conn.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(viewBachelor);
                DataTable data = new DataTable();
                dataAdapter.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
        }

        protected void ViewIndustrial(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewBachelor = new SqlCommand("ViewBachelorProjects", conn);
            viewBachelor.CommandType = CommandType.StoredProcedure;
            SqlParameter type = viewBachelor.Parameters.Add(new SqlParameter("@ProjectType", SqlDbType.VarChar, 20));
            type.Value = "Industrial";
            SqlParameter user = viewBachelor.Parameters.Add(new SqlParameter("@User_id", SqlDbType.Int));
            user.Value = Session["ID"];
            if (Session["ID"] == null)
                user.Value = DBNull.Value;
            using (conn)
            {
                conn.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(viewBachelor);
                DataTable data = new DataTable();
                dataAdapter.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
        }

        protected void ViewAcademic(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewBachelor = new SqlCommand("ViewBachelorProjects", conn);
            viewBachelor.CommandType = CommandType.StoredProcedure;
            SqlParameter type = viewBachelor.Parameters.Add(new SqlParameter("@ProjectType", SqlDbType.VarChar, 20));
            type.Value = "Academic";
            SqlParameter user = viewBachelor.Parameters.Add(new SqlParameter("@User_id", SqlDbType.Int));
            user.Value = Session["ID"];
            if (Session["ID"] == null)
                user.Value = DBNull.Value;
            using (conn)
            {
                conn.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(viewBachelor);
                DataTable data = new DataTable();
                dataAdapter.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
        }

        protected void ViewAll(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewBachelor = new SqlCommand("ViewBachelorProjects", conn);
            viewBachelor.CommandType = CommandType.StoredProcedure;
            SqlParameter type = viewBachelor.Parameters.Add(new SqlParameter("@ProjectType", SqlDbType.VarChar, 20));
                type.Value = DBNull.Value;
            SqlParameter user = viewBachelor.Parameters.Add(new SqlParameter("@User_id", SqlDbType.Int));
                user.Value = DBNull.Value;
            using (conn)
            {
                conn.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(viewBachelor);
                DataTable data = new DataTable();
                dataAdapter.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session["ID"] = -1;
            Response.Redirect("UserLogin.aspx");

        }
    }
}
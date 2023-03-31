using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Windows;

namespace MileStone3
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewProfile(sender, e);
        }

        protected void perefrenceForm(object sender, EventArgs e)
        {
            TextBox3.Enabled = true;
            TextBox3.Text= string.Empty;
            TextBox4.Enabled = true;
            TextBox4.Text = string.Empty;
            submitThesis.Visible = false;
            viewThesis.Visible = false;
            Defense.Visible = false;
            Bachelor.Visible = false;
            progress.Visible = false;
            GridView1.Visible= false;
            makeperefrence.Visible = true;
        }
        protected void MakePreferencesLocalProject(object sender, EventArgs e)
        {
            
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand MakePreferencesLocalProject = new SqlCommand("MakePreferencesLocalProject", conn);
            MakePreferencesLocalProject.CommandType = CommandType.StoredProcedure;
            SqlParameter user = MakePreferencesLocalProject.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            user.Value = Session["ID"];
            SqlParameter bachelorCode = MakePreferencesLocalProject.Parameters.Add(new SqlParameter("@bachelor_code", SqlDbType.VarChar, 10));
            bachelorCode.Value = TextBox3.Text;
            SqlParameter perference = MakePreferencesLocalProject.Parameters.Add(new SqlParameter("@preference_number", SqlDbType.Int));
            perference.Value = TextBox4.Text;
            TextBox3.Enabled = false;
            TextBox4.Enabled = false;
            conn.Open();
            MakePreferencesLocalProject.ExecuteNonQuery();
            conn.Close();

        }

        protected void ThesisviewForm(object sender, EventArgs e)
        {
            submitThesis.Visible = false;
            Defense.Visible = false;
            Bachelor.Visible = false;
            progress.Visible = false;
            makeperefrence.Visible = false;
            GridView1.Visible = false;
            viewThesis.Visible = true;
        }
        protected void ViewMyThesis(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ViewMyThesis = new SqlCommand("ViewMyThesis", conn);
            ViewMyThesis.CommandType = CommandType.StoredProcedure;
            SqlParameter user = ViewMyThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            user.Value = Session["ID"];
            SqlParameter title = ViewMyThesis.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar,50));
            title.Value=TextBox5.Text;
        }

        protected void progressform(object sender, EventArgs e)
        {
            submitThesis.Visible = false;
            viewThesis.Visible = false;
            Defense.Visible = false;
            Bachelor.Visible = false;
            makeperefrence.Visible = false;
            GridView1.Visible = false;
            progress.Visible = true;

        }

        protected void ViewMyProgressReports(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewprogress = new SqlCommand("ViewMyProgressReports", conn);
            viewprogress.CommandType = CommandType.StoredProcedure;
            SqlParameter user = viewprogress.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            user.Value = Session["ID"];
            SqlParameter Date = viewprogress.Parameters.Add(new SqlParameter("@date", SqlDbType.DateTime));
            Date.Value =TextBox7.Text;
            GridView1.Visible=true;
            using (conn)
            {
                conn.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(viewprogress);
                DataTable data = new DataTable();
                dataAdapter.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
        }

        protected void ViewMyDefense(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewDefense = new SqlCommand("ViewMyDefense", conn);
            viewDefense.CommandType = CommandType.StoredProcedure;
            SqlParameter type = viewDefense.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            type.Value = Session["ID"];
            GridView1.Visible = true;
            using (conn)
            {
                conn.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(viewDefense);
                DataTable data = new DataTable();
                dataAdapter.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
            submitThesis.Visible = false;
            viewThesis.Visible = false;
            Bachelor.Visible = false;
            makeperefrence.Visible = false;
            progress.Visible = false;
            Defense.Visible= true;
        }

        protected void UpdateDefense(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand UpdateDefense = new SqlCommand("UpdateMyDefense", conn);
            UpdateDefense.CommandType = CommandType.StoredProcedure;
            SqlParameter user = UpdateDefense.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            user.Value = Session["ID"];
            SqlParameter content = UpdateDefense.Parameters.Add(new SqlParameter("@defense_content", SqlDbType.VarChar,1000));
            content.Value = TextBox6.Text;
            conn.Open();
            UpdateDefense.ExecuteNonQuery();
            conn.Close();
        }

        //show the grade
        protected void ViewMyBachelorProjectGrade(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            submitThesis.Visible = false;
            viewThesis.Visible = false;
            makeperefrence.Visible = false;
            progress.Visible = false;
            Defense.Visible = false;
            Bachelor.Visible = true;
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewBachelor = new SqlCommand("ViewMyBachelorProjectGrade", conn);
            viewBachelor.CommandType = CommandType.StoredProcedure;
            SqlParameter type = viewBachelor.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            type.Value = Session["ID"];
            SqlParameter bachelorgrade = viewBachelor.Parameters.Add("@BachelorGrade", SqlDbType.Decimal,4);
            bachelorgrade.Direction= ParameterDirection.Output;
            conn.Open();
            viewBachelor.ExecuteNonQuery();
            conn.Close();
            Label1.Text = "Bachelor Grade " + bachelorgrade.Value.ToString();
        }

        protected void view_meetings(object sender, EventArgs e)
        {
            Response.Redirect("Meeting.aspx");
        }

        protected void ThesisForm(object sender, EventArgs e)
        {
            viewThesis.Visible = false;
            Defense.Visible = false;
            Bachelor.Visible = false;
            progress.Visible = false;
            makeperefrence.Visible = false;
            GridView1.Visible = false;
            submitThesis.Visible = true;
        }
        protected void submitMyThesis(object sender, EventArgs e) {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand SubmitMyThesis = new SqlCommand("SubmitMyThesis", conn);
            SubmitMyThesis.CommandType = CommandType.StoredProcedure;
            SqlParameter user = SubmitMyThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int));
            user.Value = Session["ID"];
            SqlParameter title = SubmitMyThesis.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar,50));
            title.Value=TextBox1.Text;
            SqlParameter pdf = SubmitMyThesis.Parameters.Add(new SqlParameter("@PDF_Document", SqlDbType.VarChar, 1000));
            pdf.Value =TextBox2.Text;
            TextBox1.Enabled = false;
            TextBox2.Enabled = false;
            conn.Open();
            SubmitMyThesis.ExecuteNonQuery();
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
    
        protected void ViewProfile(object sender, EventArgs e)
        {
            viewThesis.Visible = false;
            Defense.Visible = false;
            Bachelor.Visible = false;
            progress.Visible = false;
            makeperefrence.Visible = false;
            GridView1.Visible = true;
            submitThesis.Visible = false;
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ViewProfile = new SqlCommand("ViewProfile", conn);
            ViewProfile.CommandType = CommandType.StoredProcedure;
            SqlParameter user = ViewProfile.Parameters.Add(new SqlParameter("@user_id", SqlDbType.Int));
            user.Value = Session["ID"];
            using (conn)
            {
                conn.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(ViewProfile);
                DataTable data = new DataTable();
                dataAdapter.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            }


        }
        
    }
}

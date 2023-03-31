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
    public partial class ScheduleD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Go_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GIU"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ScheduleDefense = new SqlCommand("ScheduleDefense", conn);
            ScheduleDefense.CommandType = CommandType.StoredProcedure;
            SqlParameter date = ScheduleDefense.Parameters.Add(new SqlParameter("@date", SqlDbType.DateTime));
            date.Value = d.Text;
            SqlParameter time = ScheduleDefense.Parameters.Add(new SqlParameter("@time", SqlDbType.Time));
            time.Value = t.Text;
            SqlParameter loc = ScheduleDefense.Parameters.Add(new SqlParameter("@location", SqlDbType.VarChar, 5));
            loc.Value = location.Text;
            conn.Open();
            ScheduleDefense.ExecuteNonQuery();
            conn.Close();
            Defense.DataBind();
        }

        protected void d_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
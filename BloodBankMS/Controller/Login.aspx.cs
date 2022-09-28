using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBankMS.Controller
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("Select count(*) from EmpTbl where EmpName = '" + txtUname.Text + "' and EmpPass = '" + txtPswd.Text + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows[0][0].ToString() == "1")
            {
                Response.Redirect("Dashboard.aspx");
                con.Close();
            }
            else
            {
                //MessageBox.Show("Wrong Username or Password");
                Response.Redirect("Login.aspx");
                txtUname.Text = "";
                txtUname.Text = "";
            }
            con.Close();
        }

        protected void adminBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}
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
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void GetData()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("Select count(*) from DonorTbl", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            donorLbl.Text = dt.Rows[0][0].ToString();
            SqlDataAdapter da2 = new SqlDataAdapter("Select count(*) from PatientTbl", con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            patientLbl.Text = dt2.Rows[0][0].ToString();
            SqlDataAdapter da3 = new SqlDataAdapter("Select count(*) from EmpTbl", con);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            userLbl.Text = dt3.Rows[0][0].ToString();
            con.Close();
        }
    }
}
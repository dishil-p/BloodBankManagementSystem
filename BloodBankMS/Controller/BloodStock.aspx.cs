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
    public partial class BloodStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                
            }

        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void GetStockByBGroup(object sender, EventArgs e)
        {
            
            string bgroup = ddlBGroup.SelectedItem.ToString();
            SqlDataAdapter adapter = new SqlDataAdapter($"Select * from BloodTbl where BGroup='{bgroup}'", con);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            BloodGV.DataSourceID = null;
            BloodGV.DataSource = ds;
            BloodGV.DataBind(); //Bind ds records into gridview
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
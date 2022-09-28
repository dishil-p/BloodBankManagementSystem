using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace BloodBankMS.Controller
{
    public partial class Donate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        int oldstock;

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView2.SelectedRow;
            txtName.Text = gr.Cells[2].Text;
            txtBGroup.Text = gr.Cells[7].Text;
            GetStock(txtBGroup.Text);
        }

        public void reset()
        {
            txtName.Text = "";
            txtBGroup.Text = "";
        }

        public void GetStock(string Bgroup)
        {
            con.Open();
            string query = "select * from BloodTbl where BGroup = '" + Bgroup + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                oldstock = Convert.ToInt32(dr["BStock"].ToString());
            }
            con.Close();
        }


        protected void donateBtn_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "" || txtBGroup.Text == "")
            {
                testLbl.Text = "Please select a donor!";
            }
            else
            {
                try
                {
                    GetStock(txtBGroup.Text);

                    int stock = oldstock + 1;
                    string query = "Update BloodTbl set BStock = " + stock + " where BGroup = '" + txtBGroup.Text + "'";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    testLbl.Text = "Donation Successfull";
                    con.Close();
                    reset();

                    GridView3.DataBind();
                }

                catch (Exception ex)
                {
                    testLbl.Text = ex.Message;
                }

                finally
                {
                    con.Close();
                    reset();
                }
            }
        }

        protected void GetStockByBGroup(object sender, EventArgs e)
        {
            string bgroup = ddlBGroup.SelectedItem.ToString();
            SqlDataAdapter adapter = new SqlDataAdapter($"Select * from DonorTbl where DBGroup='{bgroup}'", con);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            GridView2.DataSourceID = null;
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
    }
}
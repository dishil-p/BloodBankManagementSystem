using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBankMS.Model
{
    public partial class Donor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void InsertDonor(object sender, EventArgs e)
        {
                      
            try
            {
                string query = $"insert into DonorTbl values('{txtName.Text}', {txtAge.Text}, '{ddlGender.SelectedItem.ToString()}', '{txtPhone.Text}', '{txtAddress.Text}', '{ddlBGroup.SelectedItem.ToString()}')";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                RegisterLbl.Text = "Donor Registered Successfully";
                //con.Close();
            }

            catch (Exception ex)
            {
                RegisterLbl.Text = ex.Message;
                //MessageBox.Show(ex.Message);
            }

            finally
            {
                con.Close();
                //Reset();
            }
        }
    }
}
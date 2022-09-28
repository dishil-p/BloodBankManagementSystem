using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBankMS.Controller
{
    public partial class Patient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void InsertPatient(object sender, EventArgs e)
        {

            try
            {
                string query = $"insert into PatientTbl values('{txtName.Text}', {txtAge.Text}, '{txtPhone.Text}','{ddlGender.SelectedItem.ToString()}',   '{ddlBGroup.SelectedItem.ToString()}', '{txtAddress.Text}')";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                RegisterLbl.Text = "Patient Registered Successfully";
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
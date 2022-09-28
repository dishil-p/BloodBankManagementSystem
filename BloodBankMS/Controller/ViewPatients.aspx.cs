using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBankMS.Controller
{
    public partial class ViewPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void Reset()
        {
            txtName.Text = "";
            txtAge.Text = "";
            txtPhone.Text = "";
            ddlGender.SelectedIndex = -1;
            ddlBGroup.SelectedIndex = -1;
            txtAddress.Text = "";
            selectLbl.Text = "None";
            //key = 0;
        }

        protected void editBtn_Click(object sender, EventArgs e)
        {
            if (selectLbl.Text=="None")
            {
                resultLbl.Text = "Please select a patient!";
            }
            else
            {
                try
                {
                    string query = $"Update PatientTbl set PName = '{txtName.Text}', PAge = '{txtAge.Text}', PPhone = '{txtPhone.Text}', PGender = '{ddlGender.SelectedItem.ToString()}', PBGroup = '{ddlBGroup.SelectedItem.ToString()}', PAddress = '{txtAddress.Text}' where PId = '{selectLbl.Text}'";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    resultLbl.Text = "Patient Details have been Successfully Updated!";
                    con.Close();
                    Reset();
                    //populate();
                    GridView1.DataBind();
                }

                catch (Exception ex)
                {
                    resultLbl.Text = ex.Message;
                }

                finally
                {
                    con.Close();
                    Reset();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            selectLbl.Text = gr.Cells[1].Text;
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            if (selectLbl.Text == "None")
            {
                resultLbl.Text = "Select the patient to be deleted!";
            }
            else
            {
                try
                {
                    string query = $"Delete from PatientTbl where PId = '{selectLbl.Text}';";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    resultLbl.Text = "Patient Details Successfully Deleted.";
                    con.Close();
                    Reset();
                    //populate();
                    GridView1.DataBind();
                }

                catch (Exception ex)
                {
                    resultLbl.Text = ex.Message;
                }

                finally
                {
                    con.Close();
                    Reset();
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
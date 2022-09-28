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
    public partial class ViewDonors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            selectLbl.Text = gr.Cells[1].Text;
        }

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
            if (selectLbl.Text == "None")
            {
                resultLbl.Text = "Please select a donor!";
            }
            else
            {
                try
                {
                    string query = $"Update DonorTbl set DName = '{txtName.Text}', DAge = '{txtAge.Text}', DPhone = '{txtPhone.Text}', DGender = '{ddlGender.SelectedItem.ToString()}', DBGroup = '{ddlBGroup.SelectedItem.ToString()}', DAddress = '{txtAddress.Text}' where DId = '{selectLbl.Text}'";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    resultLbl.Text = "Donor's details have been Successfully Updated!";
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

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            if (selectLbl.Text == "None")
            {
                resultLbl.Text = "Select the donor to be deleted!";
            }
            else
            {
                try
                {
                    string query = $"Delete from DonorTbl where DId = '{selectLbl.Text}';";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    resultLbl.Text = "Donor's details have been Successfully Deleted!";
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
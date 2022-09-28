using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace BloodBankMS.Controller
{
    public partial class EmpList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GridViewRow gr = GridView1.SelectedRow;
            nameLbl.Text = gr.Cells[2].Text;
            pswdLbl.Text = gr.Cells[3].Text;
            
        }


        protected void Reset()
        {
            txtName.Text = "";
            txtPswd.Text = "";
            nameLbl.Text = "None";
            pswdLbl.Text = "None";
        }
        protected void saveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string query = $"insert into EmpTbl values('{txtName.Text}', '{txtPswd.Text}')";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                resultLbl.Text = "Employee Added Successfully.";
                con.Close();
            }

            catch (Exception ex)
            {
                resultLbl.Text = ex.Message;
            }

            finally
            {
                con.Close();
                GridView1.DataBind();
                //populate();
                Reset();
            }
        }

        protected void editBtn_Click(object sender, EventArgs e)
        {
            if (nameLbl.Text == "None" || pswdLbl.Text == "None")
            {
                resultLbl.Text = "Please select employee!";
            }
            else
            {
                try
                {
                    GridViewRow gr = GridView1.SelectedRow;
                    
                    string query = $"Update EmpTbl set EmpName = '{txtName.Text}', EmpPass = '{txtPswd.Text}' where EmpId = '" + gr.Cells[1].Text+"'";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    resultLbl.Text = "Employee Details have been Successfully Updated!";
                    con.Close();
                    Reset();
                    GridView1.DataBind();
                    //populate();
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
            if (nameLbl.Text == "None" || pswdLbl.Text == "None")
            {
                resultLbl.Text = "Please select employee!";
            }

            else
            {
                try
                {
                    GridViewRow gr = GridView1.SelectedRow;

                    string query = $"Delete from EmpTbl where EmpId = '{gr.Cells[1].Text}';";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    resultLbl.Text = "Employee Deleted Successfully.";
                    con.Close();
                    Reset();
                    GridView1.DataBind();
                    //populate();
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

        protected void logOutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
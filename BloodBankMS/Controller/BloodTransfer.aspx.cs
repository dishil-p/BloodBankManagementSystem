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
    public partial class BloodTransfer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);



        protected void GetData(object sender, EventArgs e)
        {
            if (txtPId.Text == "")
                txtAvailable.Text = "Please enter patient id!";
            else
            {
                try
                {

                    con.Open();
                    string query = "select * from PatientTbl where PId = " + txtPId.Text;
                    SqlCommand cmd = new SqlCommand(query, con);
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    //SqlCommandBuilder builder = new SqlCommandBuilder(sda);
                    //var ds = new DataSet();
                    sda.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        txtPName.Text = dr["PName"].ToString();
                        txtPBGroup.Text = dr["PBGroup"].ToString();

                    }
                    txtPName.Visible = true;
                    txtPBGroup.Visible = true;
                    con.Close();

                    GetStock(txtPBGroup.Text);
                    txtTransfer.Visible = false;

                    if (stock > 0)
                    {
                        transferBtn.Visible = true;
                        txtAvailable.Text = "Stock Available";
                        txtAvailable.Visible = true;
                    }
                    else
                    {
                        txtAvailable.Text = "Stock Not Available";
                        txtAvailable.Visible = true;
                        transferBtn.Visible = false;

                    }
                }

                catch (Exception)
                {
                    //testLbl.Text = ex.Message;
                }



                finally
                {
                    con.Close();
                }
            }
        }


        int stock;
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
                stock = Convert.ToInt32(dr["BStock"].ToString());
            }
            con.Close();
        }


        
        private void updateStock()
        {
            try
            {
                GetStock(txtPBGroup.Text);
                int newStock = stock - 1;
                string query = $"Update BloodTbl set BStock = " + newStock + " where BGroup = '" + txtPBGroup.Text + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

            }

            catch (Exception ex)
            {
                txtTransfer.Text = ex.Message;
            }

            finally
            {
                con.Close();
                //Reset();
            }
        }

        protected void Transfer_Blood(object sender, EventArgs e)
        {            
                try
                {
                    string query = "insert into TransferTbl values('" + txtPName.Text + "','" + txtPBGroup.Text + "')";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    txtTransfer.Visible = true;
                    txtTransfer.Text = "Transfered successfully!";
                    con.Close();
                    updateStock();

                }

                catch (Exception ex)
                {
                txtTransfer.Text = ex.Message;

                }

            finally
                {
                    con.Close();
                    //Reset();
                }
            
        }


            /*
            private void Availability(object sender, EventArgs e)
            {
                GetData();
                GetStock(BloodGroup.Text);
                if (stock > 0)
                {
                    TransferBtn.Visible = true;
                    Availablelbl.Text = "Available Stock";
                    Availablelbl.Visible = true;
                }
                else
                {
                    Availablelbl.Text = "Stock Not Available";
                    Availablelbl.Visible = true;
                }
            }
            */
        }
}
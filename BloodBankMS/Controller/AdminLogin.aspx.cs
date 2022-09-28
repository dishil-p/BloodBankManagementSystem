using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBankMS.Controller
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {

            if (txtPswd.Text == "Password")
            {
                Response.Redirect("EmpList.aspx");
            }
            else
            {
                testLbl.Text = "Wrong password! Contact the System Admin";
                txtPswd.Text = "";
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
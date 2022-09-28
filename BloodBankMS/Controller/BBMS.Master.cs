using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBankMS.Model
{
    public partial class BBMS : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Donorb_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Donor.aspx");
        }

        protected void Donatelb_Click(object sender, EventArgs e)
        {
            Response.Redirect("Donate.aspx");
        }

        protected void ViewDonorslb_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewDonors.aspx");
        }

        protected void Patientlb_Click(object sender, EventArgs e)
        {
            Response.Redirect("Patient.aspx");
        }

        protected void ViewPatientslb_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewPatients.aspx");
        }

        protected void BloodTransferlb_Click(object sender, EventArgs e)
        {
            Response.Redirect("BloodTransfer.aspx");
        }

        protected void BloodStocklb_Click(object sender, EventArgs e)
        {
            Response.Redirect("BloodStock.aspx");
        }

        protected void Dashboardlb_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void LogOutlb_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
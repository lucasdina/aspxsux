using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace diskInventory
{
    public partial class Artists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddAnother_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Artists.aspx");
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Default.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (validateFields() && ArtistsDB.AddArtist(txtFirstName.Text, txtLastName.Text))
            {
                lblModalTitle.Text = "Successfully Added Artist";
                lblModalBody.Text = txtFirstName.Text + " has been successfully added to the database. Please select an option.";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                upModal.Update();
            }
            else
            {
                txtErrorMessage.Text = "One or more fields might not have been filled.";
            }
        }

        private bool validateFields()
        {
            bool isValid = true;
            if (String.IsNullOrEmpty(txtFirstName.Text)) isValid = false;
            if (String.IsNullOrEmpty(txtLastName.Text)) isValid = false;
            return isValid;
        }
    }
}
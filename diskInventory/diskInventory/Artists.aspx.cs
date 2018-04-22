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

        //modal add another button
        protected void btnAddAnother_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Artists.aspx");
        }

        // modal return button
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Default.aspx");
        }

        // Clear form
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
        }

        // submit form button
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (validateFields() && ArtistsDB.AddArtist(txtFirstName.Text, txtLastName.Text))
            {
                // add artist and show modal
                lblModalTitle.Text = "Successfully Added Artist";
                lblModalBody.Text = txtFirstName.Text + " has been successfully added to the database. Please select an option.";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                upModal.Update();
            }
            else
            {
                // error at bottom of page
                txtErrorMessage.Text = "One or more fields might not have been filled.";
            }
        }

        // check if fields are null
        private bool validateFields()
        {
            bool isValid = true;
            if (String.IsNullOrEmpty(txtFirstName.Text)) isValid = false;
            if (String.IsNullOrEmpty(txtLastName.Text)) isValid = false;
            return isValid;
        }
    }
}
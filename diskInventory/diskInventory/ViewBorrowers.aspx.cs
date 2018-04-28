using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace diskInventory
{
    public partial class ViewBorrowers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //modal add another
        protected void btnAddAnother_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Borrowers.aspx");
        }

        // modal return
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Default.aspx");
        }

        // clear form
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
        }

        // form submit
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (validateFields() && BorrowerDB.AddBorrower(txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtPhone.Text))
            {
                // add borrower and show modal
                lblModalTitle.Text = "Successfully Added Borrower";
                lblModalBody.Text = txtFirstName.Text + " has been successfully added to the database. Please select an option.";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                upModal.Update();
            }
            else
            {
                // show error message
                txtErrorMessage.Text = "One or more fields might not have been filled.";
            }
        }

        //validation
        private bool validateFields()
        {
            bool isValid = true;
            if (String.IsNullOrEmpty(txtFirstName.Text)) isValid = false;
            if (String.IsNullOrEmpty(txtLastName.Text)) isValid = false;
            if (String.IsNullOrEmpty(txtEmail.Text)) isValid = false;
            if (String.IsNullOrEmpty(txtPhone.Text)) isValid = false;
            return isValid;
        }
    }
}
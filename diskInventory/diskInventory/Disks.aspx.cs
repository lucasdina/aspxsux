using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace diskInventory
{
    public partial class Disks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddAnother_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Borrowers.aspx");
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Default.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtTitle.Text = "";
            txtGenre.Text = "";
            txtLength.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (validateFields() && DisksDB.AddDisk(txtTitle.Text, Int32.Parse(txtLength.Text), txtGenre.Text))
            {
                lblModalTitle.Text = "Successfully Added Disk";
                lblModalBody.Text = txtTitle.Text + " has been successfully added to the database. Please select an option.";
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
            if (String.IsNullOrEmpty(txtTitle.Text)) isValid = false;
            if (String.IsNullOrEmpty(txtLength.Text)) isValid = false;
            if (String.IsNullOrEmpty(txtGenre.Text)) isValid = false;

            try
            {
                Int32.Parse(txtLength.Text);
            } catch (Exception)
            {
                isValid = false;
            }

            return isValid;
        }
    }
}
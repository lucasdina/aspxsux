using diskInventory.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace diskInventory
{
    public partial class ConfirmBorrower : System.Web.UI.Page
    {
        public Borrower borrower;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["currentBorrower"]!= null)
            {
                borrower = (Borrower)Session["currentBorrower"];
            }
            else
            {
                borrower = new Borrower
                {
                    FirstName = "unset",
                    LastName = "unset",
                    Email = "unset",
                    Phone = "unset"
                };
            }
        }
    }
}
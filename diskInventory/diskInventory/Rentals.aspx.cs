using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace diskInventory
{
    public partial class Rentals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //nav to disk list
        protected void btnViewNewRentals_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Rent.aspx");
        }

        // nav to borrower list
        protected void btnViewCurrentRentals_Click(object sender, EventArgs e)
        {
            Response.Redirect("./RentalRecords.aspx");
        }
    }
}
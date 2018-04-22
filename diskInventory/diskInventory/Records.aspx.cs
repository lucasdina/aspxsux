using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace diskInventory
{
    public partial class Records : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // nav to artist list
        protected void btnViewArtists_Click(object sender, EventArgs e)
        {
            Response.Redirect("./ViewArtists.aspx");
        }

        //nav to disk list
        protected void btnViewDisks_Click(object sender, EventArgs e)
        {
            Response.Redirect("./ViewDisks.aspx");
        }

        // nav to borrower list
        protected void btnViewBorrowers_Click(object sender, EventArgs e)
        {
            Response.Redirect("./ViewBorrowers.aspx");
        }
    }
}
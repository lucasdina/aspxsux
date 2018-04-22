using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace diskInventory
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //nav add borrower
        protected void btnAddBorrower_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Borrowers.aspx");
        }

        // nav add artist
        protected void btnAddArtist_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Artists.aspx");
        }

        // nav add disk
        protected void btnAddDisk_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Disks.aspx");
        }

        // nav view records
        protected void btnViewRecords_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Records.aspx");
        }
    }
}
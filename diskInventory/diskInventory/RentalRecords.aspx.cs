using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace diskInventory
{
    public partial class RentalRecords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rentals_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "returnDisk")
            {
                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);

                // Get the last name of the selected author from the appropriate
                // cell in the GridView control.
                GridViewRow selectedRow = rentals.Rows[index];
                TableCell borrowerId = selectedRow.Cells[0];
                TableCell diskId = selectedRow.Cells[1];
                int borrower = Convert.ToInt32(borrowerId.Text);
                int disk = Convert.ToInt32(diskId.Text);
                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = ConfigurationManager
                            .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "DELETE FROM DiskHasBorrower WHERE disk_id = @diskId AND borrower_id = @borrowerId;" +
                            "UPDATE Disk SET returned_date = GETDATE() WHERE disk_id = @diskId";
                        cmd.Parameters.AddWithValue("@diskId", disk);
                        cmd.Parameters.AddWithValue("@borrowerId", borrower);
                        cmd.Connection = conn;
                        conn.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                        }
                        conn.Close();
                    }
                    Response.Redirect("./RentalRecords.aspx");
                }
            }
        }
    }
}
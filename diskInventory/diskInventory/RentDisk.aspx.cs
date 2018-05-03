using diskInventory.Objects;
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
    public partial class RentDisk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tempBorrower"] == null)
            {
                Response.Redirect("./Rent.aspx");
            }
            else
            {
                if (IsPostBack)
                {
                    if (Request.Form["__EVENTTARGET"] != null && Request.Form["__EVENTARGUMENT"] != null)
                    {
                        string postbackAction = Request.Form["__EVENTTARGET"];
                        string value = Request.Form["__EVENTARGUMENT"];
                        switch (postbackAction)
                        {
                            case "rd":
                                titleSelected(value);
                                break;
                        }
                    }
                }
                else
                {
                    // Default Page
                }
            }

        }

        // modal add another
        protected void btnAddAnother_Click(object sender, EventArgs e)
        {
            Session["tempDisk"] = null;
            Session["tempBorrower"] = null;
            Response.Redirect("./Rent.aspx");
        }

        // modal return
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Rentals.aspx");
        }

        private void titleSelected(string title)
        {
            Disk disk = new Disk();
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Disk where " +
                    "disk_title like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", title);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            disk.Title = sdr.GetString(sdr.GetOrdinal("disk_title"));
                            disk.Genre = sdr.GetString(sdr.GetOrdinal("disk_genre"));
                            disk.Length = sdr.GetInt32(sdr.GetOrdinal("disk_length"));
                            disk.ID = sdr.GetInt32(sdr.GetOrdinal("disk_id"));
                        }
                    }
                    conn.Close();
                }
                setAndLockFields(disk);
            }
        }

        private void setAndLockFields(Disk disk)
        {
            Session["tempDisk"] = disk;

            txtTitle.Text = disk.Title;
            txtGenre.Text = disk.Genre;
            txtLength.Text = disk.Length.ToString(); ;
            txtId.Text = disk.ID.ToString();

            txtTitle.Enabled = false;
            txtGenre.Enabled = false;
            txtLength.Enabled = false;
            txtId.Enabled = false;
        }

        // clear form
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Session["tempDisk"] = null;

            txtTitle.Text = "";
            txtGenre.Text = "";
            txtLength.Text = "";
            txtId.Text = "";

            txtTitle.Enabled = true;
            txtGenre.Enabled = true;
            txtLength.Enabled = true;
            txtId.Enabled = true;
        }

        // next form
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Disk disk = (Disk)Session["tempDisk"];
            Borrower borrower = (Borrower)Session["tempBorrower"];
            if (disk != null && borrower != null)
            {
                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = ConfigurationManager
                            .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "UPDATE Disk SET returned_date = NULL, borrowed_date = GETDATE() WHERE disk_id = @DiskId;  " +
                        "INSERT INTO DiskHasBorrower (disk_id, borrower_id) VALUES(@DiskId, @BorrowerId);";
                        cmd.Parameters.AddWithValue("@DiskId", disk.ID);
                        cmd.Parameters.AddWithValue("@BorrowerId", borrower.ID);
                        cmd.Connection = conn;
                        conn.Open();
                        List<string> disks = new List<string>();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                        }
                        conn.Close();

                        // show success modal
                        Label1.Text = "Rental Successful";
                        Label2.Text = disk.Title + " has been successfully rented to " + borrower.FirstName + " " + borrower.LastName;
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#badModal').modal();", true);
                        UpdatePanel1.Update();
                    }
                }
            }
            else
            {
                // show error modal
                Label1.Text = "Uh Oh";
                Label2.Text = "Something went wrong. Please return.";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#badModal').modal();", true);
                UpdatePanel1.Update();
            }
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchDiskTitle(string prefixText, int count)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Disk where " +
                    "disk_title like @SearchText + '%' AND returned_date IS NOT NULL";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> disks = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            disks.Add(sdr["disk_title"].ToString());
                        }
                    }
                    conn.Close();
                    return disks;
                }
            }
        }
    }
}
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
    public partial class Rent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.Form["__EVENTTARGET"] != null && Request.Form["__EVENTARGUMENT"] != null)
                {
                    string postbackAction = Request.Form["__EVENTTARGET"];
                    string value = Request.Form["__EVENTARGUMENT"];
                    switch (postbackAction)
                    {
                        case "fn":
                            firstNameSelected(value);
                            break;
                        case "ln":
                            lastNameSelected(value);
                            break;
                        case "em":
                            emailSelected(value);
                            break;
                        case "ph":
                            phoneSelected(value);
                            break;
                    }
                }
            }
        }

        private void firstNameSelected (string name)
        {
            Borrower borrower = new Borrower();
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Borrower where " +
                    "borrower_first_name like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", name);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            borrower.FirstName = sdr.GetString(sdr.GetOrdinal("borrower_first_name"));
                            borrower.LastName = sdr.GetString(sdr.GetOrdinal("borrower_last_name"));
                            borrower.Email = sdr.GetString(sdr.GetOrdinal("borrower_email"));
                            borrower.Phone = sdr.GetString(sdr.GetOrdinal("borrower_phone"));
                            borrower.ID = sdr.GetInt32(sdr.GetOrdinal("borrower_id"));
                        }
                    }
                    conn.Close();
                }
                setAndLockFields(borrower);
            }
        }

        private void lastNameSelected(string name)
        {
            Borrower borrower = new Borrower();
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Borrower where " +
                    "borrower_last_name like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", name);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            borrower.FirstName = sdr.GetString(sdr.GetOrdinal("borrower_first_name"));
                            borrower.LastName = sdr.GetString(sdr.GetOrdinal("borrower_last_name"));
                            borrower.Email = sdr.GetString(sdr.GetOrdinal("borrower_email"));
                            borrower.Phone = sdr.GetString(sdr.GetOrdinal("borrower_phone"));
                            borrower.ID = sdr.GetInt32(sdr.GetOrdinal("borrower_id"));
                        }
                    }
                    conn.Close();
                }
                setAndLockFields(borrower);
            }
        }

        private void emailSelected(string email)
        {
            Borrower borrower = new Borrower();
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Borrower where " +
                    "borrower_email like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", email);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            borrower.FirstName = sdr.GetString(sdr.GetOrdinal("borrower_first_name"));
                            borrower.LastName = sdr.GetString(sdr.GetOrdinal("borrower_last_name"));
                            borrower.Email = sdr.GetString(sdr.GetOrdinal("borrower_email"));
                            borrower.Phone = sdr.GetString(sdr.GetOrdinal("borrower_phone"));
                            borrower.ID = sdr.GetInt32(sdr.GetOrdinal("borrower_id"));
                        }
                    }
                    conn.Close();
                }
                setAndLockFields(borrower);
            }
        }

        private void phoneSelected(string phone)
        {
            Borrower borrower = new Borrower();
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Borrower where " +
                    "borrower_phone like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", phone);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            borrower.FirstName = sdr.GetString(sdr.GetOrdinal("borrower_first_name"));
                            borrower.LastName = sdr.GetString(sdr.GetOrdinal("borrower_last_name"));
                            borrower.Email = sdr.GetString(sdr.GetOrdinal("borrower_email"));
                            borrower.Phone = sdr.GetString(sdr.GetOrdinal("borrower_phone"));
                            borrower.ID = sdr.GetInt32(sdr.GetOrdinal("borrower_id"));
                        }
                    }
                    conn.Close();
                }
                setAndLockFields(borrower);
            }
        }

        private void setAndLockFields(Borrower borrower)
        {
            Session["tempBorrower"] = borrower;

            txtBorrowerFirstName.Text = borrower.FirstName;
            txtBorrowerLastName.Text = borrower.LastName;
            txtBorrowerEmail.Text = borrower.Email;
            txtBorrowerPhone.Text = borrower.Phone;

            txtBorrowerFirstName.Enabled = false;
            txtBorrowerLastName.Enabled = false;
            txtBorrowerEmail.Enabled = false;
            txtBorrowerPhone.Enabled = false;
        }

        // clear form
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Session["tempBorrower"] = null;

            txtBorrowerFirstName.Text = "";
            txtBorrowerLastName.Text = "";
            txtBorrowerEmail.Text = "";
            txtBorrowerPhone.Text = "";

            txtBorrowerFirstName.Enabled = true;
            txtBorrowerLastName.Enabled = true;
            txtBorrowerEmail.Enabled = true;
            txtBorrowerPhone.Enabled = true;
        }

        // next form
        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("./RentDisk.aspx");
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchBorrowerFirstName(string prefixText, int count)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Borrower where " +
                    "borrower_first_name like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> borrowers = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            borrowers.Add(sdr["borrower_first_name"].ToString());
                        }
                    }
                    conn.Close();
                    return borrowers;
                }
            }
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchBorrowerLastName(string prefixText, int count)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Borrower where " +
                    "borrower_last_name like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> borrowers = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            borrowers.Add(sdr["borrower_last_name"].ToString());
                        }
                    }
                    conn.Close();
                    return borrowers;
                }
            }
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchBorrowerEmail(string prefixText, int count)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Borrower where " +
                    "borrower_email like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> borrowers = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            borrowers.Add(sdr["borrower_email"].ToString());
                        }
                    }
                    conn.Close();
                    return borrowers;
                }
            }
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> SearchBorrowerPhone(string prefixText, int count)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager
                        .ConnectionStrings["disk_inventoryConnectionString"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from Borrower where " +
                    "borrower_phone like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    conn.Open();
                    List<string> borrowers = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            borrowers.Add(sdr["borrower_phone"].ToString());
                        }
                    }
                    conn.Close();
                    return borrowers;
                }
            }
        }
    }
}
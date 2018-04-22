using System;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

[DataObject]
public class BorrowerDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAllBorrowers()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = "SELECT * FROM Borrower";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        return rdr;
    }


    [DataObjectMethod(DataObjectMethodType.Select)]
    public static Boolean AddBorrower(string firstName, string lastName, string email, string phone)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = "insert into Borrower (borrower_first_name, borrower_last_name, borrower_email, borrower_phone) values" +
            "('" + firstName + "','" + lastName + "','" + email + "','" + phone + "')";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        return rdr.RecordsAffected > 0 ? true : false;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings[
            "disk_inventoryConnectionString"].ConnectionString;
    }
}
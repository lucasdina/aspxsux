using System;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

[DataObject]
public class DisksDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAllDisks()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel ="SELECT * FROM Disk";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        return rdr;
    }


    [DataObjectMethod(DataObjectMethodType.Select)]
    public static Boolean AddDisk(string title, int length, string genre, DateTime borrowed, DateTime returned)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = "insert into Disk (disk_title, disk_length, disk_genre, borrowed_date, returned_date) values " +
            "('" + title + "'," + length + ",'" + genre + "','" + borrowed + "','" + returned + "')";
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
using System;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

[DataObject]
public class ArtistsDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetAllArtists()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = "SELECT * FROM Artist";
        SqlCommand cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        return rdr;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static Boolean AddArtist(string firstName, string lastName)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = "insert into Artist (artist_first_name, artist_last_name) values " +
            "('"+firstName+"','"+lastName+"')";
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
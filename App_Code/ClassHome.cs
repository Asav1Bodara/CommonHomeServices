using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for ClassHome
/// </summary>
public class ClassHome
{
    public static SqlDataReader getRecords(String query)
    {
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\HomeSol.mdf;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        return dr;
    }

    public static int setRecords(String query)
    {
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\HomeSol.mdf;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        int i = cmd.ExecuteNonQuery();
        return i;
    }
}
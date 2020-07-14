using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Configuration;
using System.Data.SqlClient;



public partial class Water : System.Web.UI.Page
{
  DataTable dt = new DataTable();

  string qry;
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      Rating[] temp = new Rating[500];
      Label[] lbl = new Label[500];
      Label[] cnt = new Label[500];
      string[] count = new string[500];
      string[] lbl1 = new string[500];
      for (int i = 0; i < DataList1.Items.Count; i++)
      {
        DataTable dt = new DataTable();
        object avg;
        lbl[i] = DataList1.Items[i].FindControl("lblEmail") as Label;
        lbl1[i] = lbl[i].Text;
        dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM tblrating WHERE StoreName='" + lbl1[i] + "'");
        temp[i] = DataList1.Items[i].FindControl("Rating1") as Rating;
        temp[i].CurrentRating = Convert.ToInt32(dt.Rows[i]["AverageRating"]);
        cnt[i] = DataList1.Items[i].FindControl("lblCount") as Label;
        cnt[i].Text = string.Format("  (Total {0}  Reviwes)", dt.Rows[i]["RatingCOunt"]);

      }
    }
  }


  private DataTable GetData(string query)
  {
    SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\HomeSol.mdf;Integrated Security=True");
    SqlCommand cmd = new SqlCommand(query);
    SqlDataAdapter sda = new SqlDataAdapter();
    cmd.CommandType = CommandType.Text;
    cmd.Connection = con;
    sda.SelectCommand = cmd;
    sda.Fill(dt);
    return dt;
  }




  protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
  {
    if (e.CommandName == "sendQuery")
    {
      Response.Redirect("SendQuery.aspx?id=" + e.CommandArgument.ToString());

    }
  }
}

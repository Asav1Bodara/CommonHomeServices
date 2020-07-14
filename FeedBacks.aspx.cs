using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;
public partial class FeedBacks : System.Web.UI.Page
{
  DataTable dt = new DataTable();

  protected void Page_Load(object sender, EventArgs e)
  {
    string email = Convert.ToString(Session["ProviderEmail"]);
    Label1.Text = email;
    if (!IsPostBack)
    {
      DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM tblrating WHERE StoreName= '" + Label1.Text + "'" );
      Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
      lblresult.Text = string.Format("{0} Users have rated. Average Rating {1}", dt.Rows[0]["RatingCount"], dt.Rows[0]["AverageRating"]);
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


}

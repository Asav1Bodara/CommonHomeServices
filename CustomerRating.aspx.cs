using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data;

public partial class CustomerRating : System.Web.UI.Page
{
  string qry,provideremail,customeremail;
  string providername, customername, providerphone,providerstore, customerquery, quote;
    protected void Page_Load(object sender, EventArgs e)
    {
    customername = Convert.ToString(Session["CustName"]);
    customeremail = Convert.ToString(Session["CustEmail"]);
  }

  protected void btnConfirm_Click(object sender, EventArgs e)
    {
    Panel1.Visible = false;
    Panel2.Visible = true;
    }

  protected void btnBack_Click(object sender, EventArgs e)
  {
    Response.Redirect("CustomerConfirmation.aspx");
  }

  protected void FetchDetails()
  {
    Label lbl1 = DataList1.Items[0].FindControl("lblProviderPhone") as Label;
   providerphone = lbl1.Text;
     Label lbl2 = DataList1.Items[0].FindControl("lblStoreName") as Label;
    providerstore = lbl2.Text;
     Label lbl4 = DataList1.Items[0].FindControl("lblCustomerQuery") as Label;
    customerquery = lbl4.Text; 
    Label lbl5 = DataList1.Items[0].FindControl("lblQuote") as Label;
    quote = lbl5.Text;
    
    qry = "SELECT * FROM tblServiceProvider WHERE SPPhone=" + providerphone;
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      provideremail = dr.GetValue(7).ToString();
    }

  }
  protected void btnRating_Click(object sender, EventArgs e)
  {
    FetchDetails();    
    SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\HomeSol.mdf;Integrated Security=True");
     qry = "INSERT INTO tblrating (rating, review, StoreName, CustomerName) VALUES (@ratingvalue, @review,@provideremail,@custemail )";
     SqlCommand cmd = new SqlCommand(qry);
     SqlDataAdapter sda = new SqlDataAdapter();
     cmd.CommandType = CommandType.Text;
     cmd.Parameters.AddWithValue("@ratingvalue", Rating1.CurrentRating.ToString());
     cmd.Parameters.AddWithValue("@review", txtreview.Text);
     cmd.Parameters.AddWithValue("@provideremail", provideremail);
     cmd.Parameters.AddWithValue("@custemail", customeremail);
     cmd.Connection = con;
     con.Open();
     cmd.ExecuteNonQuery();
     con.Close();
    qry = "INSERT INTO tblCustomerCompletion (ProviderStore,CustomerName,ProviderPhone,CustomerQuery,QuoteAmount) VALUES ('" + providerstore + "','" + customername + "','" + providerphone + "','" + customerquery + "','" + quote + "')";
    int i = ClassHome.setRecords(qry);
    Label lbl6 = DataList1.Items[0].FindControl("lblId") as Label;
    string id = lbl6.Text;
    qry = "DELETE FROM tblComplete WHERE Id=" + id;
    int p = ClassHome.setRecords(qry);
    Response.Redirect("Dashboard.aspx");

  }
}

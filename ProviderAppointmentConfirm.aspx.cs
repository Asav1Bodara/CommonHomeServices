using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProviderAppointmentConfirm : System.Web.UI.Page
{
  string qry;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

  protected void btnConfirm_Click(object sender, EventArgs e)
  {
    string ProviderStore, CustomerName, CustomerPhone, ProviderPhone, CustomerAddress, CustomerQuery, QuoteAmount;
    qry = "SELECT * FROM tblAppointment WHERE ApptId=" + Request.QueryString["id"];
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      ProviderStore = dr.GetValue(1).ToString();
      CustomerName = dr.GetValue(2).ToString();
      CustomerPhone = dr.GetValue(3).ToString();
      ProviderPhone = dr.GetValue(4).ToString();
      CustomerAddress = dr.GetValue(5).ToString();
      CustomerQuery = dr.GetValue(6).ToString();
      QuoteAmount = dr.GetValue(7).ToString();
      qry = "INSERT INTO tblComplete (ProviderStore,CustomerName,CustomerPhone,ProviderPhone,CustomerAddress,CustomerQuery,QuoteAmount) VALUES ('" + ProviderStore + "','" + CustomerName + "','" + CustomerPhone + "','" + ProviderPhone + "','" + CustomerAddress + "','" + CustomerQuery + "','" + QuoteAmount + "')";
      int i = ClassHome.setRecords(qry);
      qry = "DELETE FROM tblAppointment WHERE ApptId=" + Request.QueryString["id"];
      int p = ClassHome.setRecords(qry);
    }
    Response.Redirect("CompletedRequests.aspx");
  }
  protected void btnBack_Click(object sender, EventArgs e)
  {
    Response.Redirect("ProviderAppointmentConfirm.aspx");
  }
}

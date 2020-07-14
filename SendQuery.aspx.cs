using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using AjaxControlToolkit;

public partial class Plumber_Details : System.Web.UI.Page
{
  string qry, custname, custemail, custphone, custaddress;
    protected void Page_Load(object sender, EventArgs e)
  {
    custname = Convert.ToString(Session["CustName"]);
    custemail = Convert.ToString(Session["CustEmail"]);
    custphone = Convert.ToString(Session["CustPhone"]);
    custaddress = Convert.ToString(Session["CustAddress"]);
    FillList();   
  }
  public void FillList()
  {
    SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\HomeSol.mdf;Integrated Security=True");
    qry = "SELECT SPStoreName , SPName , SPPhone , SPAddress , SPEmail FROM viewServiceProvider WHERE SPPhone=" + Request.QueryString["id"];
    con.Open();
    SqlCommand cmd = new SqlCommand(qry, con);
    SqlDataAdapter sda = new SqlDataAdapter();
    sda.SelectCommand = cmd;
    DataSet ds = new DataSet();
    sda.Fill(ds);
    DataList1.DataSource = ds;
    DataList1.DataBind();
    con.Close();
  }
 

  public void InsertDetails()
  {
    Label lbl = DataList1.Items[0].FindControl("lblEmail") as Label;
    string lbltext = lbl.Text;
    Label lbl1 = DataList1.Items[0].FindControl("lblName") as Label;
    string lblname = lbl1.Text;
    Label lbl2 = DataList1.Items[0].FindControl("lblStoreName") as Label;
    string lblstore = lbl2.Text;
    Label lbl3 = DataList1.Items[0].FindControl("lblPhone") as Label;
    string lblphone = lbl3.Text;
    Label lbl4 = DataList1.Items[0].FindControl("lblAddress") as Label;
    string lbladdress = lbl4.Text;
    qry = "INSERT INTO tblCustomerRequest (CustName, CustPhone, CustEmail, CustAddress, RequestDetails, ProviderName, ProviderEmail, ProviderStoreName, ProviderAddress, ProviderPhone) VALUES ('" + custname + "','" + custphone + "','" + custemail + "','" + custaddress + "','" + txtContent.Text + "','" + lblname + "','" + lbltext + "','" + lblstore + "','" + lbladdress + "','" + lblphone + "')";
    int i = ClassHome.setRecords(qry);
  }

  protected void sendEMail_Click1(object sender, EventArgs e)
  {
    Label lbl = DataList1.Items[0].FindControl("lblEmail") as Label;
    string lbltext = lbl.Text;
    Label lbl1 = DataList1.Items[0].FindControl("lblName") as Label;
    string lblname = lbl1.Text;   
    Label lbl2 = DataList1.Items[0].FindControl("lblStoreName") as Label;
    string lblstore = lbl2.Text;
    Label lbl3 = DataList1.Items[0].FindControl("lblPhone") as Label;
    string lblphone = lbl3.Text;
    Label lbl4 = DataList1.Items[0].FindControl("lblAddress") as Label;
    string lbladdress = lbl4.Text;
    NetworkCredential loginInfo = new NetworkCredential("hsolutions93@gmail.com", "homesolutions");
    MailMessage msg = new MailMessage();
    string text = "Hello!! " + lblname + " You got one new request from customer:\n" + txtContent.Text +
                    @"<html> <body> <br><hr/> Thanks and Regards <br> <b>Home Solutions and Co. </b></body> </html> ";    
    msg.From = new MailAddress("hsolutions93@gmail.com");
    msg.To.Add(new MailAddress(lbltext));   //the email id where you need to send email.
    msg.Subject = "Update on your application in Home Solutions";
    msg.Body = text;
    msg.IsBodyHtml = true;
    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
    client.EnableSsl = true;
    client.UseDefaultCredentials = false;
    client.Credentials = loginInfo;
    client.Send(msg);
    InsertDetails();
    string reqid, msg1;
    qry = "SELECT * FROM tblCustomerRequest WHERE CustPhone = '" + custphone + "'";
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      reqid = dr.GetValue(0).ToString();
      msg1 = dr.GetValue(5).ToString();
      qry = "INSERT INTO tblChat (ReqId,Sender,ChatMsg,CustomerEmail,ProviderEmail) VALUES ('" + reqid + "','" + custname + "','" + msg1 + "','" + custemail + "', '" + lbltext + "')";
      int p = ClassHome.setRecords(qry);
    }
    Response.Redirect("Dashboard.aspx");
  }
}

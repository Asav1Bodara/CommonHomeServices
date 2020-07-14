using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

public partial class ChatRecords : System.Web.UI.Page
{
  string qry;
        string custname, reqid,customeremail, provideremail,sender,chatMsg;

  protected void Page_Load(object sender, EventArgs e)
    {
    custname = Convert.ToString(Session["CustName"]);
    //FillGrid();
    CheckQuote();
    }
  protected void CheckQuote()
  { 
    string quote;
    qry = "SELECT * FROM tblQuote where Reqid =" + Request.QueryString["id"];
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      quote = dr.GetValue(1).ToString();
      lblQuote.Text = "Provider Sent you the quote: $"+quote;
      lblQuote.Visible = true;
    }
  
    if (lblQuote.Text == "Label")
    {

    }
    else
    {
      lblQuote.Visible = true;
      Panel1.Visible = false;
      Panel3.Visible = true;
    }

  }
 /* public void FillGrid()
  {
    SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\HomeSol.mdf;Integrated Security=True");
    qry = "SELECT * FROM tblChat WHERE ReqId=" + Request.QueryString["id"];    
    SqlDataReader dr = ClassHome.getRecords(qry);  
    GridView1.DataSource = dr;
    GridView1.DataBind();
    }*/
 public void FetchEmails()
  {
    qry = "SELECT * FROM tblChat WHERE ReqId=" + Request.QueryString["id"];
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      reqid = dr.GetValue(1).ToString(); 
      customeremail = dr.GetValue(4).ToString();
      provideremail = dr.GetValue(5).ToString();
      Label1.Text = customeremail;
      Label2.Text = provideremail;
    }
  }

    protected void sendEMail_Click(object sender, EventArgs e)
    {
    FetchEmails();
    NetworkCredential loginInfo = new NetworkCredential("hsolutions93@gmail.com", "homesolutions");
    MailMessage msg = new MailMessage();
    string text = "Hello!! You got one new response from customer" + custname + ":\n" + txtContent.Text +  @"<html> <body> <br><hr/> Thanks and Regards <br> <b>Home Solutions and Co. </b></body> </html> ";
    msg.From = new MailAddress("hsolutions93@gmail.com");
    msg.To.Add(new MailAddress(provideremail));   //the email id where you need to send email.
    msg.Subject = "Update on your application in Home Solutions";
    msg.Body = text;
    msg.IsBodyHtml = true;
    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
    client.EnableSsl = true;
    client.UseDefaultCredentials = false;
    client.Credentials = loginInfo;
    client.Send(msg);
    qry = "INSERT INTO tblChat (ReqId,Sender,ChatMsg,CustomerEmail,ProviderEmail) VALUES ('" + reqid + "','" + custname + "','" + txtContent.Text + "','" + customeremail +"', '" + provideremail +"')";
    int i = ClassHome.setRecords(qry);
    Response.Redirect("Dashboard.aspx");
  }

    protected void btnEnd_Click(object sender, EventArgs e)
    {
    btnEnd.Visible = false;
    Panel2.Visible = true;
    Panel3.Visible = false;
    }

  protected void FetchAndTransferChat()
  {
    qry = "SELECT * FROM tblChat WHERE ReqId=" + Request.QueryString["id"];
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      reqid = dr.GetValue(1).ToString();
      sender = dr.GetValue(2).ToString();
      chatMsg = dr.GetValue(3).ToString();
      customeremail = dr.GetValue(4).ToString();
      provideremail = dr.GetValue(5).ToString();
    }
    else { }

    qry = "INSERT INTO tblEndedChats (EReqId,ESender,EChatMsg,ECustomerEmail,EProviderEmail) VALUES ('" + reqid + "', '" + sender + "', '" + chatMsg + "', '" + customeremail + "','" + provideremail + "')";
    int i = ClassHome.setRecords(qry);

    qry = "DELETE FROM tblChat WHERE ReqId='" + reqid + "'";
    int p = ClassHome.setRecords(qry);

    qry = "DELETE FROM tblCustomerRequest WHERE ReqId = '" + reqid + "'";
    int r = ClassHome.setRecords(qry);

  }

  protected void btnsubmit_Click(object sender, EventArgs e)
  {
    FetchAndTransferChat();   
    Response.Redirect("Dashboard.aspx");
  }

  protected void btnYes_Click(object sender, EventArgs e)
  {
    FetchEmails();
    string flag = "Yes";
    qry = "DELETE FROM tblConfirmation WHERE ReqId='" + reqid + "'";
    int i = ClassHome.setRecords(qry);
    qry = "INSERT INTO tblConfirmation (Confirmation,ReqId) VALUES ('" + flag + "','" + reqid + "')";
    int p = ClassHome.setRecords(qry);
    Panel1.Visible = true;
    Panel3.Visible = false;
    lblQuote.Visible = false;
    Label3.Text = "Accept the quote and send an appointment details:";
  }

  protected void btnNo_Click(object sender, EventArgs e)
  {
    FetchEmails();
    string flag = "No";
    qry = "DELETE FROM tblConfirmation WHERE ReqId='" + reqid + "'";
    int i = ClassHome.setRecords(qry);
    qry = "INSERT INTO tblConfirmation (Confirmation,ReqId) VALUES ('" + flag + "','" + reqid + "')";
    int p = ClassHome.setRecords(qry);
    Panel1.Visible = true;
    Panel3.Visible = false;
    lblQuote.Visible = false;
  }
}

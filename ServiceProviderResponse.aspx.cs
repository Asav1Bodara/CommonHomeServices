using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceProviderResponse : System.Web.UI.Page
{
  string qry,providername,chatMsg,sender1;
  string reqid, customeremail, provideremail;
  string quote,quoteid;
    protected void Page_Load(object sender, EventArgs e)
    {
    
    Panel1.Visible = false;
    //FillGrid();
    QuoteDetails();
    providername = Convert.ToString(Session["ProviderName"]);
    }

  protected void QuoteDetails()
  {
    string conf;
    FetchEmails();
    qry = "SELECT * FROM tblConfirmation WHERE ReqId='"+ reqid + "'";
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
     conf = dr.GetValue(1).ToString();
     Label1.Text = conf;
      if (Label1.Text == "Yes")
      {
        Label2.Visible = false;
        Label3.Visible = false;
        Label1.Visible = true;
        sendEMail.Visible = false;
        btnEndchat1.Visible = false;
        Label1.Text = "The quote you send was accepted by the customer and sent you following details for appointment";
        Panel2.Visible = true;

      }
      else
      {
        FetchQuote();
        Label2.Visible = true;
        Label3.Visible = true;
        Panel1.Visible = true;
        Label1.Visible = true;
        Label1.ForeColor = System.Drawing.Color.Red;
        Label1.Text = "Unfortunately!! Your quote was not accepted by the customer.";
      }
    }
   
  }
  protected void FetchQuote()
  {
    FetchEmails();
    qry = "SELECT * FROM tblQuote WHERE ReqId=" + reqid;
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      quoteid = dr.GetValue(0).ToString();
      quote = dr.GetValue(1).ToString();
      Label2.Text = quote;
      lblQuoteId.Text = quoteid;
    }
  }
  public void FetchEmails()
  {
    Label lbl1 = DataList1.Items[0].FindControl("lblRequest") as Label;
    chatMsg = lbl1.Text;
    Label lbl = DataList1.Items[0].FindControl("lblReqId") as Label;
    string lblreqid = lbl.Text;
    qry = "SELECT * FROM tblChat WHERE ReqId="+lblreqid;
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      reqid = dr.GetValue(1).ToString();
      sender1 = dr.GetValue(2).ToString();
      customeremail = dr.GetValue(4).ToString();
      provideremail = dr.GetValue(5).ToString();
    }
  }

  /*public void FillGrid()
  { 
    Label lbl = DataList1.Items[0].FindControl("lblReqId") as Label;
    string lblreqid = lbl.Text;
    SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\HomeSol.mdf;Integrated Security=True");
    qry = "SELECT * FROM tblChat WHERE ReqId=" + lblreqid;
    SqlDataReader dr = ClassHome.getRecords(qry);
    GridView1.DataSource = dr;
    GridView1.DataBind();
  }
  */
  protected void sendEMail_Click(object sender, EventArgs e)
  {
    Label lbl = DataList1.Items[0].FindControl("lblReqId") as Label;
    string lblreqid = lbl.Text;   
    qry = "INSERT INTO tblChat (ReqId,Sender,ChatMsg,CustomerEmail,ProviderEmail) VALUES ('" + lblreqid + "','" + providername + "','" + txtContent.Text + "','" + customeremail+ "', '"+ provideremail +"')";
    int i = ClassHome.setRecords(qry);

  }

  protected void btnEndchat1_Click(object sender, EventArgs e)
  {
    Panel1.Visible = true;
    sendEMail.Visible = false;
    btnEndchat1.Visible = false;
  }

  protected void sendemail()
  {

    Label lbl = DataList1.Items[0].FindControl("lblReqId") as Label;
    string lblreqid = lbl.Text;
    string tempchat;
    tempchat = txtContent.Text + "And Your Quote is: $" + txtQuote.Text;
    FetchEmails();
    if (txtQuote.Text != null)
    {
      NetworkCredential loginInfo = new NetworkCredential("hsolutions93@gmail.com", "homesolutions");
      MailMessage msg = new MailMessage();
      string text = "Hello!! You got one new response from service provider" + providername + ":\n" + txtContent.Text
        + @"<html><body><b><br><hr><br>The quote given from provider is: </b></body></html>" + "$ " +txtQuote.Text 
        + @" <html> <body> <br><hr/> Thanks and Regards <br> <b>Home Solutions and Co. </b></body> </html> ";
      msg.From = new MailAddress("hsolutions93@gmail.com");
      msg.To.Add(new MailAddress(customeremail));   //the email id where you need to send email.
      msg.Subject = "Update on your application in Home Solutions";
      msg.Body = text;
      msg.IsBodyHtml = true;
      SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
      client.EnableSsl = true;
      client.UseDefaultCredentials = false;
      client.Credentials = loginInfo;
      client.Send(msg);
      FetchQuote();
      if ( Label2.Text=="Label")
      {
        qry = "INSERT INTO tblQuote (QuoteAmount,ReqId) VALUES ('" + txtQuote.Text + "','" + lblreqid + "')";
        int p = ClassHome.setRecords(qry);
      }
      else
      {
        qry = "UPDATE tblQuote SET QuoteAmount='" + txtQuote.Text + "'  WHERE ReqId='" + lblreqid + "'";
        int p = ClassHome.setRecords(qry);       
      }

        qry = "INSERT INTO tblChat (ReqId,Sender,ChatMsg,CustomerEmail,ProviderEmail) VALUES ('" + lblreqid + "','" + providername + "','" + tempchat + "','" + customeremail + "', '" + provideremail + "')";
        int i = ClassHome.setRecords(qry);

        Response.Redirect("ServiceProviderDash.aspx");
    }
    else
    {
      NetworkCredential loginInfo = new NetworkCredential("hsolutions93@gmail.com", "homesolutions");
      MailMessage msg = new MailMessage();
      string text = "Hello!! You got one new response from service provider" + providername + ":\n" + txtContent.Text
        + @" < html> <body> <br><hr/> Thanks and Regards <br> <b>Home Solutions and Co. </b></body> </html> ";
      msg.From = new MailAddress("hsolutions93@gmail.com");
      msg.To.Add(new MailAddress(customeremail));   //the email id where you need to send email.
      msg.Subject = "Update on your application in Home Solutions";
      msg.Body = text;
      msg.IsBodyHtml = true;
      SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
      client.EnableSsl = true;
      client.UseDefaultCredentials = false;
      client.Credentials = loginInfo;
      client.Send(msg);
      qry = "INSERT INTO tblChat (ReqId,Sender,ChatMsg,CustomerEmail,ProviderEmail) VALUES ('" + lblreqid + "','" + providername + "','" + tempchat + "','" + customeremail + "', '" + provideremail + "')";
      int i = ClassHome.setRecords(qry);
      Response.Redirect("ServiceProviderDash.aspx");

    }
  }
  protected void btnSendWithQuote_Click(object sender, EventArgs e)
  {
   sendemail(); 
  }

  protected void btnAbort_Click(object sender, EventArgs e)
  {
    FetchEmails();
    qry = "INSERT INTO tblEndedChats (EReqId,ESender,EChatMsg,ECustomerEmail,EProviderEmail) VALUES ('" + reqid + "', '" + sender1 + "', '" + chatMsg + "', '" + customeremail + "','" + provideremail + "')";
    int i = ClassHome.setRecords(qry);
    qry = "DELETE FROM tblChat WHERE ReqId='" + reqid + "'";
    int p = ClassHome.setRecords(qry);
    qry = "DELETE FROM tblCustomerRequest WHERE ReqId = '" + reqid + "'";
    int r = ClassHome.setRecords(qry);
    Response.Redirect("ServiceProviderDash.aspx");
  }

  protected void btnSendAppt_Click(object sender, EventArgs e)
  {
    string CustomerName, CustomerPhone, ProviderName, ProviderPhone, CustomerAddress, CustomerQuery;
    FetchQuote();
    qry = "SELECT * FROM tblCustomerRequest WHERE ReqId=" + reqid;
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      CustomerName = dr.GetValue(1).ToString();
      CustomerPhone= dr.GetValue(2).ToString();
      ProviderName = dr.GetValue(8).ToString();
      ProviderPhone = dr.GetValue(10).ToString();
      CustomerAddress = dr.GetValue(4).ToString();
      CustomerQuery = dr.GetValue(5).ToString();
      qry = "INSERT INTO tblAppointment (ProviderStore,CustomerName,CustomerPhone,ProviderPhone,CustomerAddress,CustomerQuery,QuoteAmount,Date,TIME) VALUES('" + ProviderName + "','" + CustomerName + "','" + CustomerPhone +"','" + ProviderPhone +"','" + CustomerAddress +"','" + CustomerQuery +"','" + Label2.Text +"','" + txtApp.Text +"','" + txtApptime.Text +"')";
      int i = ClassHome.setRecords(qry);
    }
    qry = "DELETE FROM tblCustomerRequest WHERE ReqId="+reqid;
    int r = ClassHome.setRecords(qry);
    Response.Redirect("ProviderAppointmentDetails.aspx");
  }
}

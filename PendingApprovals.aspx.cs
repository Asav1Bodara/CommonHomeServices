using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Text;


public partial class PendingApprovals : System.Web.UI.Page
{
  string qry,qry1;
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      if (Session["utype"].ToString() == "Reception")
      {
        Response.Redirect("EmployeeDash.aspx");
      }
      qry = "SELECT DISTINCT([SPType]) FROM[tblServiceProviderType]";
      SqlDataReader dr = ClassHome.getRecords(qry);
      ddlSearchCategory.DataSource = dr;
      ddlSearchCategory.DataBind();
      ddlSearchCategory.Items.Insert(0, "-- select --");
      FillGrid();
    }
  }
  
  protected void FillGrid()
  {
    qry = "SELECT PreSPID AS [ID],PreSPStoreName AS [Store Name] , PreSPName AS [Provider Name], PreSPPhone AS [Phone], PreSPAddress AS [Address], PreSPEmail AS [Email], SPType AS [Category], PreSPLic AS [Licence Number], PreDriverLic AS [Driver's Lic], PreReferences AS [References] FROM viewPreServiceProvider";
    SqlDataReader dr = ClassHome.getRecords(qry);
    GridView1.DataSource = dr;
    GridView1.DataBind();
  }
  protected void btnApprove_Click(object sender, EventArgs e)
  {

    pnlView.Visible = true;
    pnlTable.Visible = false;
    Panel1.Visible = false;
  }

  protected void btnReject_Click(object sender, EventArgs e)
  {
    int flag = 0;
    if (flag == 0)
    {
      qry = "INSERT INTO tblRejectedSP (RejSPStoreName ,RejSPName,RejSPPhone, RejSPAddress, RejSPEmail, SPTypeId, RejSPLic, RejDriverLic, RejReferences) VALUES ('" + lblStoreName.Text + "', '" + lblName.Text + "','" + lblPhone.Text + "','" + lblAddress.Text + "','" + lblEmail.Text + "','" + lblTypeID.Text + "','" + lblLic.Text + "','" + lblDriverLic.Text + "','" + lblReferences.Text + "')";
      int i = ClassHome.setRecords(qry);
      qry1 = "DELETE FROM tblPreServiceProvider WHERE PreSPID='" + GridView1.SelectedRow.Cells[1].Text + "'";
      int i1 = ClassHome.setRecords(qry1);
      flag = 1;
    }
    else
    {
    }
    if (flag == 1)
    {
      string text = "Hello!! " + lblStoreName.Text + " You have been rejected in verification of the home solution participation please see us inperson";
      string text3 = @" <html> <body> <br><hr/><br> Thanks and Regards<br><b>Home Solutions and Co. </b></body> </html> ";
      string text1 = @"<html><body><br><b>Your Reason for rejection is: &nbsp</b></body></html>"
;      NetworkCredential loginInfo = new NetworkCredential("hsolutions93@gmail.com", "homesolutions");
      MailMessage msg = new MailMessage();
      msg.From = new MailAddress("hsolutions93@gmail.com");
      msg.To.Add(new MailAddress(lblEmail.Text));   //the email id where you need to send email.
      msg.Subject = "Update on your application in Home Solutions";
      msg.Body = text + text1 + txtReason.Text + text3;
      msg.IsBodyHtml = true;
      SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
      client.EnableSsl = true;
      client.UseDefaultCredentials = false;
      client.Credentials = loginInfo;
      client.Send(msg);
      //for sending email ends here
    }
    Response.Redirect("PendingApprovals.aspx");
  }

  protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
  {
    qry = "SELECT * FROM viewPreServiceProvider WHERE PreSPID='" + GridView1.SelectedRow.Cells[1].Text + "'";
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      lblStoreName.Text = dr.GetValue(1).ToString();
      lblName.Text = dr.GetValue(2).ToString();
      lblPhone.Text = dr.GetValue(3).ToString();
      lblEmail.Text = dr.GetValue(5).ToString();
      lblAddress.Text = dr.GetValue(4).ToString();
      lblLic.Text = dr.GetValue(7).ToString();
      lblType.Text = dr.GetValue(10).ToString();
      lblTypeID.Text = dr.GetValue(6).ToString();
      lblDriverLic.Text = dr.GetValue(8).ToString();
      lblReferences.Text = dr.GetValue(9).ToString();

    }
    dr.Close();
}

  protected void btnBack_Click(object sender, EventArgs e)
  {
    pnlView.Visible = false;
    pnlTable.Visible = true;

  }
  public string encryption(string pwd)
  {
    string encrypwd;
    string strmsg = string.Empty;
    byte[] encode = new byte[pwd.Length];
    encode = Encoding.UTF8.GetBytes(pwd);
    strmsg = Convert.ToBase64String(encode);
    encrypwd = strmsg;
    return (encrypwd);
  }
  protected void btnApprove1_Click(object sender, EventArgs e)
  {
    string password = txtPassword.Text;
    string enc = encryption(password);
    int flag = 0;
    if (flag == 0)
    {
      qry = "INSERT INTO tblServiceProvider (SPStoreName ,SPName,SPPhone,SPUserName,SPPassword,SPAddress,SPEmail,SPTypeId, SPLic,SPDriverLic,SPReferences) VALUES ('" + lblStoreName.Text + "', '" + lblName.Text + "','" + lblPhone.Text + "','" + txtUserName.Text + "','" + enc + "','" + lblAddress.Text + "','" + lblEmail.Text + "','" + lblTypeID.Text + "','" + lblLic.Text + "','" + lblDriverLic.Text + "','" + lblReferences.Text + "')";
      int i = ClassHome.setRecords(qry);
      qry1 = "DELETE FROM tblPreServiceProvider WHERE PreSPID='" + GridView1.SelectedRow.Cells[1].Text + "'";
      int i1 = ClassHome.setRecords(qry1);
      flag = 1;
    }
    else
    {
    }
      if(flag==1)
      {
      string text = "Hello!!" + lblStoreName.Text + " You have been successfully approved for the home solution signup.";
      string text1="@ <html><body><p> Congratulations on your approval.</p><p> Now customer can see your all information on their portal.</p>" +
       "<p> We have attached the username and password to this email </p><hr><b> Your User name is:</b></body></html>" + txtUserName.Text;
      string text2 = @"<html><body><b>And Your password is:</b></body></html>";
       string text3 = @" <html> <body> <br><hr/><br> Thanks and Regards<br><b>Home Solutions and Co. </b></body> </html> ";

      NetworkCredential loginInfo = new NetworkCredential("hsolutions93@gmail.com", "homesolutions");
      MailMessage msg = new MailMessage();
      msg.From = new MailAddress("hsolutions93@gmail.com");
      msg.To.Add(new MailAddress(lblEmail.Text));   //the email id where you need to send email.
      msg.Subject = "Your Login Credentials for Home Solutions";
      msg.Body = text + text1 + text2 + txtPassword.Text + text3; ;
      msg.IsBodyHtml = true;
      SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
      client.EnableSsl = true;
      client.UseDefaultCredentials = false;
      client.Credentials = loginInfo;
      client.Send(msg);
      //for sending email ends here
      Response.Redirect("PendingApprovals.aspx");

    }
  }

  protected void btnExportExcel_Click(object sender, EventArgs e)
  {
    // Clear all content output from the buffer stream
    Response.ClearContent();
    // Specify the default file name using "content-disposition" RESPONSE header
    Response.AppendHeader("content-disposition", "attachment; filename=PendingApprovals.xls");
    // Set excel as the HTTP MIME type
    Response.ContentType = "application/excel";
    // Create an instance of stringWriter for writing information to a string
    System.IO.StringWriter stringWriter = new System.IO.StringWriter();
    // Create an instance of HtmlTextWriter class for writing markup 
    // characters and text to an ASP.NET server control output stream
    HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

    // Set white color as the background color for gridview header row
    GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");

    // Set background color of each cell of GridView1 header row
    foreach (TableCell tableCell in GridView1.HeaderRow.Cells)
    {
      tableCell.Style["background-color"] = "#A55129";
    }

    // Set background color of each cell of each data row of GridView1
    foreach (GridViewRow gridViewRow in GridView1.Rows)
    {
      gridViewRow.BackColor = System.Drawing.Color.White;
      foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
      {
        gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
      }
    }
    GridView1.RenderControl(htw);
    Response.Write(stringWriter.ToString());
    Response.End();
  }

  protected void btnSearch_Click(object sender, EventArgs e)
  {
    if (ddlSearchCategory.SelectedIndex == 0)
    {
      qry = "SELECT PreSPID AS [ID], PreSPStoreName AS [Store Name] , PreSPName AS [Provider Name], PreSPPhone AS [Phone], PreSPAddress AS [Address], PreSPEmail AS [Email], SPType AS [Category], PreSPLic AS [Licence Number] FROM viewPreServiceProvider WHERE PreSPStoreName LIKE '" + txtSearchCompany.Text + "%'";
    }

    else
    {
      qry = "SELECT PreSPID AS [ID], PreSPStoreName AS [Store Name] , PreSPName AS [Provider Name], PreSPPhone AS [Phone], PreSPAddress AS [Address], PreSPEmail AS [Email], SPType AS [Category], PreSPLic AS [Licence Number] FROM viewPreServiceProvider WHERE PreSPStoreName LIKE '" + txtSearchCompany.Text + "%' AND SPType='" + ddlSearchCategory.SelectedValue + "'";
    }
    SqlDataReader dr = ClassHome.getRecords(qry);
    GridView1.DataSource = dr;
    GridView1.DataBind();
  }
  public override void VerifyRenderingInServerForm(Control control)
  {
    /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
       server control at run time. */
  }

  protected void btntemp_Click(object sender, EventArgs e)
  {
    Panel1.Visible = true;

  }
}


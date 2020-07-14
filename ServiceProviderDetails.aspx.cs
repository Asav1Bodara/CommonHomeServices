using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Text;

public partial class ServiceProviderDetails : System.Web.UI.Page
{
  String qry;

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
    }
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
  protected void btnSubmit_Click(object sender, EventArgs e)
  {
    string password = txtPassword.Text;
    string enc = encryption(password);
    if (btnSubmit.Text == "Submit")
    {
      qry = "INSERT INTO tblServiceProvider (SPStoreName ,SPName,SPPhone,SPUserName,SPPassword,SPAddress,SPEmail,SPTypeId, SPLic) VALUES ('" + txtStore.Text + "', '" + txtName.Text + "','" + txtPhone.Text + "','" + txtUserName.Text + "','" + enc + "','" + txtAddress.Text + "','" + txtEmail.Text + "','" + ddlProviderType.SelectedValue + "','" + txtLic.Text + "')";
    }
    else
    {
      qry = "UPDATE tblServiceProvider SET SPStoreName='" + txtStore.Text + "', SPName='" + txtName.Text + "', SPPhone='" + txtPhone.Text + "', SPUserName='" + txtUserName.Text + "', SPPassword='" + enc + "', SPAddress='" + txtAddress.Text + "', SPEmail='" + txtEmail.Text + "', SPTypeId='" + ddlProviderType.SelectedValue + "', SPLic = '" + txtLic.Text + "' WHERE SPID='" + GridView1.SelectedRow.Cells[1].Text + "'";
    }
    int i = ClassHome.setRecords(qry);
    AllClear();
    lblMsg.Text = "Record submitted successfully.";
  }
  protected void AllClear()
  {
    txtStore.Text = "";
    txtName.Text = "";
    txtPhone.Text = "";
    txtUserName.Text = "";
    txtPassword.Text = "";
    txtAddress.Text = "";
    txtEmail.Text = "";
    ddlProviderType.SelectedIndex = 0;
    txtLic.Text = "";
    lblMsg.Text = "";
    txtDriverLic.Text = "";
    txtReference.Text = "";
    btnSubmit.Text = "Submit";
    btnDelete.Visible = false;
  }
  protected void btnDelete_Click(object sender, EventArgs e)
  {
    qry = "DELETE FROM tblServiceProvider WHERE SPID='" + GridView1.SelectedRow.Cells[1].Text + "'";
    int i = ClassHome.setRecords(qry);
    AllClear();
    lblMsg.Text = "Record DELETED successfully.";
  }

  protected void btnView_Click(object sender, EventArgs e)
  {
    FillGrid();
    pnlView.Visible = true;
    pnlTable.Visible = false;
  }
  protected void FillGrid()
  {
    qry = "SELECT SPID AS [ID],SPStoreName AS [Store Name] , SPName AS [Provider Name], SPPhone AS [Phone], SPUserName AS [UserName], SPPassword AS [Password], SPAddress AS [Address], SPEmail AS [Email], SPType AS [Category], SPLic AS [Licence Number], SPDriverLic AS [Driver's Lic], SPReferences AS [References] FROM viewServiceProvider";
    SqlDataReader dr = ClassHome.getRecords(qry);
    GridView1.DataSource = dr;
    GridView1.DataBind();
  }
  protected void btnCancel_Click(object sender, EventArgs e)
  {
    AllClear();

  }

  protected void btnClose_Click(object sender, EventArgs e)
  {
    Response.Redirect("EmployeeDash.aspx");

  }

  protected void btnBack_Click(object sender, EventArgs e)
  {
    AllClear();
    pnlView.Visible = false;
    pnlTable.Visible = true;
  }

  protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
  {
    qry = "SELECT * FROM tblServiceProvider WHERE SPID='" + GridView1.SelectedRow.Cells[1].Text + "'";
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      txtStore.Text= dr.GetValue(1).ToString();
      txtName.Text = dr.GetValue(2).ToString();
      txtPhone.Text = dr.GetValue(3).ToString();
      txtUserName.Text = dr.GetValue(4).ToString();
      txtPassword.Text = dr.GetValue(5).ToString();
      txtAddress.Text = dr.GetValue(6).ToString();
      txtEmail.Text = dr.GetValue(7).ToString();
      ddlProviderType.SelectedValue = dr.GetValue(8).ToString();
      txtLic.Text = dr.GetValue(9).ToString();
      txtDriverLic.Text = dr.GetValue(10).ToString();
      txtReference.Text = dr.GetValue(11).ToString();


      btnSubmit.Text = "Update";
      btnDelete.Visible = true;

      pnlView.Visible = false;
      pnlTable.Visible = true;
    }
    dr.Close();
  }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
    if (ddlSearchCategory.SelectedIndex == 0)
    {
      qry = "SELECT SPID AS [ID],SPStoreName AS [Store Name] , SPName AS [Provider Name], SPPhone AS [Phone], SPUserName AS [UserName], SPPassword AS [Password], SPAddress AS [Address], SPEmail AS [Email], SPType AS [Category], SPLic AS [Licence Number], SPDriverLic AS [Driver's Lic], SPReferences AS [References] FROM viewServiceProvider WHERE SPStoreName LIKE '" + txtSearchCompany.Text + "%'";
    }
    else
    {
      qry = "SELECT SPID AS [ID],SPStoreName AS [Store Name] , SPName AS [Provider Name], SPPhone AS [Phone], SPUserName AS [UserName], SPPassword AS [Password], SPAddress AS [Address], SPEmail AS [Email], SPType AS [Category], SPLic AS [Licence Number], SPDriverLic AS [Driver's Lic], SPReferences AS [References] FROM viewServiceProvider WHERE SPStoreName LIKE '" + txtSearchCompany.Text + "%' AND SPType='" + ddlSearchCategory.SelectedValue + "'";
    }
    SqlDataReader dr = ClassHome.getRecords(qry);
    GridView1.DataSource = dr;
    GridView1.DataBind();
  }

  protected void btnExportExcel_Click(object sender, EventArgs e)
  {
    // Clear all content output from the buffer stream
    Response.ClearContent();
    // Specify the default file name using "content-disposition" RESPONSE header
    Response.AppendHeader("content-disposition", "attachment; filename=ProviderInfo.xls");
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
  public override void VerifyRenderingInServerForm(Control control)
  {
  }
}

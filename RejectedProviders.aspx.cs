using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RejectedProviders : System.Web.UI.Page
{
  String qry;

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      FillGrid();
      qry = "SELECT DISTINCT([SPType]) FROM[tblServiceProviderType]";
      SqlDataReader dr = ClassHome.getRecords(qry);
      ddlSearchCategory.DataSource = dr;
      ddlSearchCategory.DataBind();
      ddlSearchCategory.Items.Insert(0, "-- select --");
    }
  }


  protected void FillGrid()
  {
    qry = "SELECT RejSPID AS [ID],RejSPStoreName AS [Store Name] , RejSPName AS [Provider Name], RejSPPhone AS [Phone], RejSPAddress AS [Address], RejSPEmail AS [Email], SPType AS [Category], RejSPLic AS [Licence Number] FROM viewRejectedSP";
    SqlDataReader dr = ClassHome.getRecords(qry);
    GridView1.DataSource = dr;
    GridView1.DataBind();
  }


  protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
  {

  }
  protected void btnExportExcel_Click(object sender, EventArgs e)
  {
    // Clear all content output from the buffer stream
    Response.ClearContent();
    // Specify the default file name using "content-disposition" RESPONSE header
    Response.AppendHeader("content-disposition", "attachment; filename=RejectedProviders.xls");
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
      qry = "SELECT RejSPID AS [ID], RejSPStoreName AS [Store Name] , RejSPName AS [Provider Name], RejSPPhone AS [Phone], RejSPAddress AS [Address], RejSPEmail AS [Email], SPType AS [Category], RejSPLic AS [Licence Number] FROM viewRejectedSP WHERE RejSPStoreName LIKE '" + txtSearchCompany.Text + "%'";
    }
    else
    {
      qry = "SELECT RejSPID AS [ID], RejSPStoreName AS [Store Name] , RejSPName AS [Provider Name], RejSPPhone AS [Phone], RejSPAddress AS [Address], RejSPEmail AS [Email], SPType AS [Category], RejSPLic AS [Licence Number] FROM viewRejectedSP WHERE RejSPStoreName LIKE '" + txtSearchCompany.Text + "%' AND SPType='" + ddlSearchCategory.SelectedValue + "'";
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
}

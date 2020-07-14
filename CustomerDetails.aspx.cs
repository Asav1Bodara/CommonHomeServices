using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;


public partial class CustomerDetails : System.Web.UI.Page
{
  String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
    if (!IsPostBack)
    {
      if (Session["utype"].ToString() == "QA Dept")
      {
        Response.Redirect("EmployeeDash.aspx");
      }
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
      qry = "INSERT INTO tblCustomer (CustomerName ,CustomerUName, CustomerPass, CustomerEmail ,CustomerPhone, CustomerAddress) VALUES ('" + txtName.Text + "','" + txtUserName.Text + "','" + enc + "','" + txtEmail.Text + "','" + txtPhone.Text + "', '" + txtAddress.Text + "')";
    }
    else
    {
      qry = "UPDATE tblCustomer SET CustomerName='" + txtName.Text + "', CustomerPhone='" + txtPhone.Text + "', CustomerUName='" + txtUserName.Text + "', CustomerPass='" + enc + "', CustomerAddress='" + txtAddress.Text + "', CustomerEmail='" + txtEmail.Text + "' WHERE CustomerId='" + GridView1.SelectedRow.Cells[1].Text + "'";
    }
    int i = ClassHome.setRecords(qry);
    AllClear();
    lblMsg.Text = "Record submitted successfully.";
  }

  protected void AllClear()
  {
    txtName.Text = "";
    txtPhone.Text = "";
    txtUserName.Text = "";
    txtPassword.Text = "";
    txtAddress.Text = "";
    txtEmail.Text = "";
    lblMsg.Text = "";
    btnSubmit.Text = "Submit";
    btnDelete.Visible = false;
  }
  protected void btnDelete_Click(object sender, EventArgs e)
  {
    qry = "DELETE FROM tblCustomer WHERE CustomerId='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
    qry = "SELECT CustomerId AS [ID], CustomerName AS [Customer Name], CustomerUName AS [User Name], CustomerPass AS [Password], CustomerEmail AS [Email ID], CustomerPhone AS [Phone Number], CustomerAddress AS [Address] FROM tblCustomer";
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
    qry = "SELECT * FROM tblCustomer WHERE CustomerId='" + GridView1.SelectedRow.Cells[1].Text + "'";
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      txtName.Text = dr.GetValue(1).ToString();
      txtUserName.Text = dr.GetValue(2).ToString();
      txtPassword.Text = dr.GetValue(3).ToString();
      txtEmail.Text = dr.GetValue(4).ToString();
      txtPhone.Text = dr.GetValue(5).ToString();
      txtAddress.Text = dr.GetValue(6).ToString();

      btnSubmit.Text = "Update";
      btnDelete.Visible = true;

      pnlView.Visible = false;
      pnlTable.Visible = true;
    }
    dr.Close();
  }

    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
    // Clear all content output from the buffer stream
    Response.ClearContent();
    // Specify the default file name using "content-disposition" RESPONSE header
    Response.AppendHeader("content-disposition", "attachment; filename=CustomerDetails.xls");
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
    qry = "SELECT CustomerId AS [ID], CustomerName AS [Customer Name], CustomerUName AS [User Name], CustomerPass AS [Password], CustomerEmail AS [Email ID], CustomerPhone AS [Phone Number], CustomerAddress AS [Address] FROM tblCustomer WHERE CustomerPhone LIKE '" + txtSearchCompany.Text + "%'";
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

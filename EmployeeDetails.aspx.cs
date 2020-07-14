using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployeeDetails : System.Web.UI.Page
{
  String qry;
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      if (Session["utype"].ToString() != "Admin")
      {
        Response.Redirect("EmployeeDash.aspx");
      }
    }
  }

  protected void btnSubmit_Click(object sender, EventArgs e)
  {
    if (btnSubmit.Text == "Submit")
    {
      qry = "INSERT INTO tblEmployee (EmpName,EmpPhone,EmpUserName,EmpPassword,EmpAddress,EmpEmail,EmpTypeID) VALUES ('" + txtName.Text + "','" + txtPhone.Text + "','" + txtUserName.Text + "','" + txtPassword.Text + "','" + txtAddress.Text + "','" + txtEmail.Text + "','" + ddlEmpType.SelectedValue + "')";
    }
    else
    {
      qry = "UPDATE tblEmployee SET EmpName='" + txtName.Text + "', EmpPhone='" + txtPhone.Text + "', EmpUserName='" + txtUserName.Text + "', EmpPassword='" + txtPassword.Text + "', EmpAddress='" + txtAddress.Text + "',  EmpEmail='" + txtEmail.Text + "', EmpTypeID='" + ddlEmpType.SelectedValue + "' WHERE EmpID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
    ddlEmpType.SelectedIndex = 0;
    lblMsg.Text = "";
    btnSubmit.Text = "Submit";
    btnDelete.Visible = false;
  }
  protected void btnDelete_Click(object sender, EventArgs e)
  {
    qry = "DELETE FROM tblEmployee WHERE EmpID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
    qry = "SELECT EmpID AS [ID], EmpName AS [Emp Name], EmpPhone AS [Emp Phone], EmpUserName AS [Emp UserName], EmpPassword AS [Emp Password], EmpAddress AS [Emp Address], EmpEmail AS [Emp Email], EmpType AS [Emp Type] FROM viewEmployee";
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
    qry = "SELECT * FROM viewEmployee WHERE EmpID='" + GridView1.SelectedRow.Cells[1].Text + "'";
    SqlDataReader dr = ClassHome.getRecords(qry);
    if (dr.Read())
    {
      txtName.Text = dr.GetValue(1).ToString();
      txtPhone.Text = dr.GetValue(2).ToString();
      txtUserName.Text = dr.GetValue(3).ToString();
      txtPassword.Text = dr.GetValue(4).ToString();
      txtAddress.Text = dr.GetValue(5).ToString();
      txtEmail.Text = dr.GetValue(6).ToString();
      ddlEmpType.SelectedValue = dr.GetValue(7).ToString();

      btnSubmit.Text = "Update";
      btnDelete.Visible = true;

      pnlView.Visible = false;
      pnlTable.Visible = true;
    }
    dr.Close();
  }

}

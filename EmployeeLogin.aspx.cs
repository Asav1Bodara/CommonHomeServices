using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class EmployeeLogin : System.Web.UI.Page
{
    string query;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
    Session["uname"] = txtName.Text;

    query = "SELECT * FROM viewEmployee WHERE EmpUserName='" + txtName.Text + "' AND EmpPassword='" + txtPass.Text + "'";
        SqlDataReader dr = ClassHome.getRecords(query);
        if (dr.Read())
        {
            Session["utype"] = dr.GetValue(8).ToString(); 
            Response.Redirect("EmployeeDash.aspx");
        }
        else
        {
            lblMsg.Text = "Invalid UserName or Password";
        }
        dr.Close();
    }
}

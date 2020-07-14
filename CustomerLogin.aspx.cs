using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;


public partial class CustomerLogin : System.Web.UI.Page
{
    string query;

    protected void Page_Load(object sender, EventArgs e)
    {
    Session.Timeout = 60;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string password = txtPwd.Text;
        string enc = encryption(password);
        query = "SELECT * FROM tblCustomer WHERE CustomerUName='" + txtName.Text + "' AND CustomerPass='" + enc + "'";
        SqlDataReader dr = ClassHome.getRecords(query);
        if (dr.Read())
        {
        Session["CustName"] = dr.GetValue(1).ToString();
        Session["CustEmail"] = dr.GetValue(4).ToString();
        Session["CustPhone"] = dr.GetValue(5).ToString();
        Session["CustAddress"] = dr.GetValue(6).ToString();
        Session["uname"] = txtName.Text;
        Response.Redirect("Dashboard.aspx");
        }
        else
        {
            lblMsg.Text = "Invalid UserName or Password";
        }
        dr.Close();
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
}

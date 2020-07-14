using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;


public partial class CustomerSignup : System.Web.UI.Page
{
  string qry;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
    string password = txtPassword.Text;
    string enc = encryption(password);
    qry = "INSERT INTO tblCustomer (CustomerName ,CustomerUName,CustomerPass,CustomerEmail,CustomerPhone,CustomerAddress) VALUES ('" + txtName.Text + "', '" + txtUserName.Text + "','" + enc + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtAddress.Text + "')";
    int i = ClassHome.setRecords(qry);
    Response.Redirect("CustomerLogin.aspx");
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

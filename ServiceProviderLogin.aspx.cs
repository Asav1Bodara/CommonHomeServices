using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class ServiceProviderLogin : System.Web.UI.Page
{
    string query;
    protected void Page_Load(object sender, EventArgs e)
    {

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
  protected void btnLogin_Click(object sender, EventArgs e)
    {
    string password = txtPass.Text;
    string enc = encryption(password);
    query = "SELECT * FROM tblServiceProvider WHERE SPUserName='" + txtName.Text + "' AND SPPassword='" + enc+ "'";
    SqlDataReader dr = ClassHome.getRecords(query);
    if (dr.Read())
    {
      Session["ProviderStore"] = dr.GetValue(1).ToString();
      Session["ProviderName"] = dr.GetValue(2).ToString();
      Session["ProviderEmail"] = dr.GetValue(7).ToString();
      Session["ProviderPhone"] = dr.GetValue(3).ToString();
      Session["ProviderAddress"] = dr.GetValue(6).ToString();
      Session["uname"] = txtName.Text;
      Response.Redirect("ServiceProviderDash.aspx");
    }      
    else
        {
            lblMsg.Text = "Invalid UserName or Password";
        }
        dr.Close();
    }
}

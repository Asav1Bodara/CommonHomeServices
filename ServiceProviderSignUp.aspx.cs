using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ServiceProviderSignUp : System.Web.UI.Page
{
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
    qry = "INSERT INTO tblPreServiceProvider (PreSPStoreName ,PreSPName,PreSPPhone,PreSPAddress,PreSPEmail,SPTypeId, PreSPLic, PreDriverLic, PreReferences) VALUES ('" + txtStore.Text + "', '" + txtName.Text + "','" + txtPhone.Text + "','" + txtAddress.Text + "','" + txtEmail.Text + "','" + ddlProviderType.SelectedValue + "','" + txtLic.Text + "','" + txtDriverLic.Text +"','" + txtReferences.Text +"')";
    int i = ClassHome.setRecords(qry);
    AllClear(); 
    lblMsg.ForeColor= System.Drawing.Color.White;
    Response.Redirect("AfterSubmit.aspx");
  }
  protected void AllClear()
  {
    txtStore.Text = "";
    txtName.Text = "";
    txtPhone.Text = "";
    txtAddress.Text = "";
    txtEmail.Text = "";
    ddlProviderType.SelectedIndex = 0;
    txtLic.Text = "";
    lblMsg.Text = "";
  }

    protected void btn(object sender, EventArgs e)
    {
    Panel1.Visible = false;
    Panel2.Visible = true;
    }
}


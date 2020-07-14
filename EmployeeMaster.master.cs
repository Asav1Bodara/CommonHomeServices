using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployeeMaster : System.Web.UI.MasterPage
{
  protected void Page_Load(object sender, EventArgs e)
  {
    Session.Timeout = 50;

    lblUname.ForeColor = System.Drawing.Color.White;

    string uname1 = Convert.ToString(Session["uname"]);
    lblUname.Text = "Welcome" + "  " + uname1;
  }
}

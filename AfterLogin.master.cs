using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AfterLogin : System.Web.UI.MasterPage
{
  protected void Page_Load(object sender, EventArgs e)
  {
    Session.Timeout = 60;

    lblUname.ForeColor = System.Drawing.Color.White;

    if (!IsPostBack)
    {
        string uname1 = Convert.ToString(Session["uname"]);
        lblUname.Text = "Welcome" + "  " + uname1;
    }
  }
}


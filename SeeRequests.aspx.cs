using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

public partial class SeeRequests : System.Web.UI.Page
{
  string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
  protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
  {
    if (e.CommandName == "seeChat")
    {
      Response.Redirect("ChatRecords.aspx?id=" + e.CommandArgument.ToString());

    }
  }
}

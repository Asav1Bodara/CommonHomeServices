using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProviderAppointmentDetails : System.Web.UI.Page
{
  string qry;
  protected void Page_Load(object sender, EventArgs e)
  {

  }
  protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
  {
    if (e.CommandName == "Finalize")
    {
      Response.Redirect("ProviderAppointmentConfirm.aspx?id=" + e.CommandArgument.ToString());

    }
  }
}

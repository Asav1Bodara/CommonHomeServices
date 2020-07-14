<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true" CodeFile="PendingApprovals.aspx.cs" Inherits="PendingApprovals" EnableEventValidation="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <form runat="server">

  <div class="content-wrapper">
        <section class="content">
            <div class="container-fluid">
              <center>
                <br /> <h3> Please review these applicants</h3>
                    <asp:Panel ID="pnlTable" Visible="true" runat="server">
                     Search by Company Name: <asp:TextBox ID="txtSearchCompany" runat="server"></asp:TextBox>
                     Category: <asp:DropDownList ID="ddlSearchCategory" runat="server" DataTextField="SPType" DataValueField="SPType" ></asp:DropDownList>                  
                    <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click" /><br />
                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnApprove" runat="server" Text="Approve" OnClick="btnApprove_Click" />
                                <asp:Button ID="btntemp" runat="server" Text="Reject" OnClick="btntemp_Click"></asp:Button>
                               <ajaxToolkit:ConfirmButtonExtender TargetControlID="btnTemp" ConfirmText="Are you sure?"  ID="ConfirmButtonExtender1" runat="server" />
                                  </td>
                            </tr>
                        </table>
                <asp:Button ID="btnExportExcel" runat="server" Text="Export as Excel" OnClick="btnExportExcel_Click" ></asp:Button>

                    </asp:Panel>
                                      </center>

                  <asp:Panel  ID="Panel1" Visible="false" runat="server">
                    <table>
                      <tr>
                        <th>Enter Reason for rejection:</th>
                        <td>
                          <asp:TextBox ID="txtReason" Rows="2" Columns="17" TextMode="MultiLine" runat="server"></asp:TextBox>                          </td>
                        </tr>
                      <tr>
                      <td><asp:Button ID="btnReject" runat="server" Text="Reject" OnClick="btnReject_Click" />
                        </td>
                      </tr>
                    </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlView" Visible="false" runat="server">
                    <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click" /><br />

                      <br />  <h3>Service Provider Details</h3>
                     <br />
                      <table>
                         
                            <tr>
                                <td colspan="2">
                                    <b>Store Name:&nbsp; </b><asp:Label ID="lblStoreName" runat="server" Text=""></asp:Label>
                                   <br /><b>Owner Name:&nbsp;</b> <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                                    <br /><b>Phone: &nbsp;</b><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                                    <br /><b>E-Mail ID: &nbsp;</b><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                                    <br /><b>Address : &nbsp;</b><asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                  <br /><b>Licence Number:&nbsp;</b><asp:Label ID="lblLic" runat="server" Text=""></asp:Label>
                                    <br /><b>Category:&nbsp;</b><asp:Label ID="lblType" runat="server" Text=""></asp:Label>
                                    <br /><asp:Label ID="lblTypeID" runat="server" Text="" Visible="false" ></asp:Label>
                                 <br /><b>Driver's Licence</b><asp:Label ID="lblDriverLic" runat="server" Text="" ></asp:Label>
                                 <br /><b>References:</b><asp:Label ID="lblReferences" runat="server" Text="" ></asp:Label>
                                </td>
                            </tr>
                        </table>
                      <br /><br />
                     <h3>Generate UserName and Password</h3><br />
                      <table>
                          
                            <tr>
                                <th>
                                    <strong>User Name:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtUserName" MaxLength="20" Placeholder="Enter User Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserName" ErrorMessage="User name must be requireed" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <strong>Password:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtPassword" MaxLength="32" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                  <ajaxToolkit:PasswordStrength ID="PasswordStrength1" TargetControlID="txtPassword" runat="server"></ajaxToolkit:PasswordStrength>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th class="auto-style1">
                                    <strong>Re-Type Password:</strong>
                                </th>
                                <td class="auto-style1">
                                    <asp:TextBox ID="TextRePassword" MaxLength="32" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="TextRePassword" ErrorMessage="Password must be match" ForeColor="Red">*</asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextRePassword" ErrorMessage="Re type password required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                           
                        </table>
                      <br />
                      <table>
                         <tr>
                                <td>
                                    <asp:Button ID="btnApprove1" runat="server" Text="Send Approval E-Mail" OnClick="btnApprove1_Click" />
                                    
                                </td>
                            </tr>
                      </table>

                    </asp:Panel>



            </div>
        </section>
    </div>
                         </form>

</asp:Content>


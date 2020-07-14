<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true" CodeFile="ServiceProviderDetails.aspx.cs" Inherits="ServiceProviderDetails" EnableEventValidation="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content">
            <div class="container-fluid">
                <center>
              <br />
                <h3>Please enter or manage details for Service Providers</h3>

                <form id="form1" runat="server">
                    <br />
                    <asp:Panel ID="pnlTable" runat="server">
                        <table>
                            <tr>
                                <th>
                                    <strong>Store Name:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtStore" MaxLength="20" Placeholder="Enter Store name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtStore" ErrorMessage="Store name must required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <strong>Provider Name:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtName" MaxLength="20" Placeholder="Enter Company name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Provider name must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <strong>Phone Number:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtPhone" MaxLength="10" Placeholder="Enter Phone Number" runat="server"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Invalid phone number" ForeColor="Red" MaximumValue="9999999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone number must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
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
                                   <ajaxToolkit:PasswordStrength ID="PasswordStrength1" TargetControlID="txtPassword"  runat="server"></ajaxToolkit:PasswordStrength>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <strong>Re-Type Password:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="TextRePassword" MaxLength="32" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="TextRePassword" ErrorMessage="Password must be match" ForeColor="Red">*</asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextRePassword" ErrorMessage="Re type password required" ForeColor="Red">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <strong>Address:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtAddress" MaxLength="200" TextMode="MultiLine" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <strong>E-Mail Address:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtEmail" MaxLength="40" Placeholder="Enter E-Mail Address" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter E-Mail ID" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="invalid E-Mail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <strong>Provider Type</strong>
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddlProviderType" runat="server" DataSourceID="SqlDataSource1" DataTextField="SPType" DataValueField="SPTypeId">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [SPType], [SPTypeId] FROM [tblServiceProviderType]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <strong>Licence Number:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtLic" MaxLength="10" Placeholder="Enter Licence Number" runat="server"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtLic" ErrorMessage="Invalid licence number" ForeColor="Red" MaximumValue="9999999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                                </td>
                            </tr>
                           <tr>
                                <th>
                                    <strong>Driver's Licence:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtDriverLic" MaxLength="10" Placeholder="Enter Driver Licence" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                           <tr>
                                <th>
                                    <strong>References:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtReference" MaxLength="10" Placeholder="Enter References" runat="server"></asp:TextBox>
                                  </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                    <asp:Button ID="btnDelete" Visible="false" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click" />
                                   <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" ConfirmText="Are you sure?" TargetControlID="btnDelete" runat="server"></ajaxToolkit:ConfirmButtonExtender>
                                  <asp:Button ID="btnView" runat="server" Text="View" CausesValidation="false" OnClick="btnView_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                                    <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" OnClick="btnClose_Click" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"></asp:ValidationSummary>
                    </asp:Panel>
                    <asp:Panel ID="pnlView" Visible="false" runat="server">
                        <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click" /><br />
                      Search by Company Name: <asp:TextBox ID="txtSearchCompany" runat="server"></asp:TextBox>
                     Category: <asp:DropDownList ID="ddlSearchCategory" runat="server" DataTextField="SPType" DataValueField="SPType" ></asp:DropDownList>                  
                    <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click" /><br />

                      <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
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
                            <asp:Button ID="btnExportExcel" runat="server" Text="Export as Excel" OnClick="btnExportExcel_Click"></asp:Button>

                    </asp:Panel>
                </form>
                </center>
            </div>
        </section>
    </div>

</asp:Content>


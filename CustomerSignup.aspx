<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="CustomerSignup.aspx.cs" Inherits="CustomerSignup" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-login100">
        <div>
            <form>
                <div class="login100-form-avatar">
                    <img src="img/signup.png" />
                </div>
                <span class="login100-form-title p-t-20 p-b-45">Please enter your Details
                </span>
                <center>
				 <table>
          
        <tr>
            <th>
                <strong>Customer Name:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtName" MaxLength="20" Placeholder="Enter Your Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Provider name must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Create user name:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtUserName" MaxLength="20" Placeholder="Enter User Name" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Invalid phone number" ForeColor="Red" MaximumValue="9999999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone number must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                    <strong>Phone Number:</strong>
                                </th>
                                <td>
                                    <asp:TextBox ID="txtPhone" MaxLength="10" Placeholder="Enter Phone Number" runat="server"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPhone" ErrorMessage="Invalid phone number" ForeColor="Red" MaximumValue="9999999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone number must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
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
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
      </table>
						</center>
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>


                <div class="container-login100-form-btn p-t-10">
                    <asp:Button class="login100-form-btn" ID="btnLogin" runat="server" Text="SignUp" OnClick="btnLogin_Click" />

                </div>

            </form>
        </div>
    </div>

    <!--===============================================================================================-->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="js/main.js"></script>
</asp:Content>


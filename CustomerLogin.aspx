<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="CustomerLogin.aspx.cs" Inherits="CustomerLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
		<div class="container-login100" style="background-image: url('images/img-01.jpg');">
				<form>
					<span class="login100-form-title p-t-20 p-b-45">
Welcome Customers	</span>
					<div class="login100-form-avatar">
						<img src="img/login_icon.png" alt="AVATAR">
					</div>

					<span class="login100-form-title p-t-20 p-b-45">
						Please enter your credentials
					</span>
					<center>
				 <table>
            <tr>
                <td><asp:TextBox ID="txtName" PlaceHolder="Enter your user name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name is required" ControlToValidate="txtName" ForeColor="Red">*</asp:RequiredFieldValidator>
					
                </td>
            </tr>
            <tr>
                 <td><asp:TextBox ID="txtPwd" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd" ErrorMessage="Password must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            </tr>
             <tr>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
	
   

      </table>
						</center>
        <br/>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>
					
			
					<div class="container-login100-form-btn p-t-10">
						<asp:Button class="login100-form-btn" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />              

					</div>

					<div class="text-center w-full p-t-25 p-b-230">
						<a href="#" class="txt1">
							Forgot Username / Password?
						</a>
						<br />
						<a href="CustomerSignup.aspx" class="txt1">
							Don't have account? Signup here
						</a>
					</div>
					

					
				</form>
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


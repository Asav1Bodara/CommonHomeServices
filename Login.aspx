<%@ Page Title="" Language="C#"  MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">	
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Creative Button Styles </title>
		<meta name="description" content="Creative Button Styles  - Modern and subtle styles &amp; effects for buttons" />
		<meta name="keywords" content="button styles, css3, modern, flat button, subtle, effects, hover, web design" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="Button_CSS/default.css" />
		<link rel="stylesheet" type="text/css" href="Button_CSS/component.css" />
		<script src="Button_CSS/modernizr.custom.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<br /><br /><br />
	<div style="background-color:dodgerblue">
	<div class="container">
			<!-- Top Navigation -->
			<section>
				<center>
        <h1 style="font-family:Georgia;color:white">Select Your Login Option</h1>
        <br />
    <asp:Button style="font-size:17px; padding:15px;" class="btn btn-1 btn-1d" ID="Button" runat="server" Text="Service Provider Login" OnClick="Button_Click" />
    <br />  <br /><br />
    <asp:Button style="font-size:17px; padding:15px;" class="btn btn-1 btn-1d" ID="Button3" runat="server" Text="Customer Login" OnClick="Button3_Click" />
    <br />  <br /><br />
    <asp:Button style="font-size:17px; padding:15px;" class="btn btn-1 btn-1d" ID="Button1" runat="server" Text="Employee Login" OnClick="Button1_Click" />
				</center>
				
			</section>
			
		</div><!-- /container -->
		</div>


		<script src="js/classie.js"></script>
		<script>
			var buttons7Click = Array.prototype.slice.call( document.querySelectorAll( '#btn-click button' ) ),
				buttons9Click = Array.prototype.slice.call( document.querySelectorAll( 'button.btn-8g' ) ),
				totalButtons7Click = buttons7Click.length,
				totalButtons9Click = buttons9Click.length;

			buttons7Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );
			buttons9Click.forEach( function( el, i ) { el.addEventListener( 'click', activate, false ); } );

			function activate() {
				var self = this, activatedClass = 'btn-activated';

				if( classie.has( this, 'btn-7h' ) ) {
					// if it is the first of the two btn-7h then activatedClass = 'btn-error';
					// if it is the second then activatedClass = 'btn-success'
					activatedClass = buttons7Click.indexOf( this ) === totalButtons7Click-2 ? 'btn-error' : 'btn-success';
				}
				else if( classie.has( this, 'btn-8g' ) ) {
					// if it is the first of the two btn-8g then activatedClass = 'btn-success3d';
					// if it is the second then activatedClass = 'btn-error3d'
					activatedClass = buttons9Click.indexOf( this ) === totalButtons9Click-2 ? 'btn-success3d' : 'btn-error3d';
				}

				if( !classie.has( this, activatedClass ) ) {
					classie.add( this, activatedClass );
					setTimeout( function() { classie.remove( self, activatedClass ) }, 1000 );
				}
			}

			document.querySelector( '.btn-7i' ).addEventListener( 'click', function() {
				classie.add( document.querySelector( '#trash-effect' ), 'trash-effect-active' );
			}, false );
		</script>
    

</asp:Content>


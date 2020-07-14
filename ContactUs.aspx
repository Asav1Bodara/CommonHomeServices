<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <title>Contact Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- section contact -->
  <section id="contact" class="section">
    <div class="container">
      <div class="row">
        <div class="span12">
          <div class="headline">
            <h3><span>Get in touch with us</span></h3>
          </div>
        </div>
        
      </div>
      <div class="row">
        <div class="span6">
          <h4><i class="icon-circled icon-32 icon-envelope"></i> Contact form</h4>

          <!-- start contact form -->

          <form  method="post" role="form" class="contactForm">
            

            <ul class="contact-list">
              <li class="form-group">
                <input type="text" name="name" class="form_input" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                <div class="validation"></div>
                <li class="form-group">
                  <input type="email" class="form_input" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">
                  <div class="validation"></div>
                </li>
                <li class="form-group">
                  <input type="text" class="form_input" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject">
                  <div class="validation"></div>
                </li>

                <li class="form-group">
                  <textarea class="form_textarea" name="message" rows="12" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                  <div class="validation"></div>
                </li>
                <li class="last">
                  <button class="btn btn-large btn-theme" type="submit" id="send">Send a message</button>
                </li>
            </ul>
          </form>
          <!-- end contact form -->

        </div>
        <div class="span6">
          <h4><i class="icon-circled icon-32 icon-user"></i> Get in touch with us</h4>
          <p>
            Feel free to ask if you have any question regarding our services or if you just want to say Hello, we would love to hear from you.
          </p>
          <div class="dotted_line">
          </div>
          <p>
            <span><i class="icon-phone"></i> <strong>Phone:</strong> </span>
          </p>
          <p>
            <span><i class="icon-comment"></i> <strong>Skype:</strong></span>
          </p>
          <p>
            <span><i class="icon-envelope-alt"></i> <strong>Email:</strong> </span>
          </p>
          <div>
            <iframe src="https://www.google.com/maps/d/embed?mid=13FOJ9_3ERSk8usDQQYvYSfqGYKY&msa=0&hl=en&ie=UTF8&t=m&ll=49.34659900000002%2C-89.631958&spn=3.220976%2C3.180542&z=8&output=embed" width="100%" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end section contact -->
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.easing.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/jquery.lettering.js"></script>
  <script src="js/parallax/jquery.parallax-1.1.3.js"></script>
  <script src="js/nagging-menu.js"></script>
  <script src="js/sequence.jquery-min.js"></script>
  <script src="js/sequencejs-options.sliding-horizontal-parallax.js"></script>
  <script src="js/portfolio/jquery.quicksand.js"></script>
  <script src="js/portfolio/setting.js"></script>
  <script src="js/jquery.scrollTo.js"></script>
  <script src="js/jquery.nav.js"></script>
  <script src="js/modernizr.custom.js"></script>
  <script src="js/prettyPhoto/jquery.prettyPhoto.js"></script>
  <script src="js/prettyPhoto/setting.js"></script>
  <script src="js/jquery.flexslider.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Custom Javascript File -->
  <script src="js/custom.js"></script>
  
</asp:Content>


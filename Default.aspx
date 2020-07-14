<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .about{
    font-family:'Times New Roman';
    
    font-style:italic
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <!-- section featured -->
  <section id="featured">

    <!-- sequence slider -->
    <div id="sequence-theme">
      <img class="prev" src="img/bt-prev.png" alt="Previous">
      <img class="next" src="img/bt-next.png" alt="Next">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div id="sequence">
              
              <ul>
                <li class="animate-in">
                  <div class="info letter-container">
                    <h2 class="fade">Facing some home problems?</h2>
                  </div>
                  <h4 class="subtitle">Then you are on the right place</h4>
                  <div class="bottomup">
                    <br /><br />
                      <img src="img/home-1.png" alt="">
                  </div>
                </li>
                <li class="animate-in">
                  <div class="info letter-container">
                    <h2 class="fade">We are here to solve your problems</h2>
                  </div>
                  <h4 class="subtitle">NOUS SOMMES ICI POUR RÉSOUDRE VOS PROBLÈMES</h4>
                  <div class="lefttop">
                                          <br /><br />

                    <img src="img/home-2.png" alt="">
                  </div>
                </li>
                <li class="animate-in">
                  <div class="info letter-container">
                    <h2 class="fade">With certified vendors</h2>
                  </div>
                  <h4 class="subtitle">Avec des fournisseurs certifiés</h4>
                  <div class="righttop">
                                          <br /><br />

                    <img src="img/certi.png" alt="">
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end sequence slider -->
  </section>
  <!-- end featured -->

  <!-- Section about -->
  <section id="about" class="section">
    <div class="gray-shadow">
    </div>
    <div class="container">
      <div class="row">
        <div class="span12">
          <div class="headline">
            <h3><span>What we provide??</span></h3>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="span12">
          <div class="section-intro">
            <p style="font-family:'Times New Roman';font-size:25px;font-style:italic">
             We provide worry-free services for different vendors across the city in ALL conditions. 
               <br /> The vendors are verified to handle every home problems with the care.
                <br />If you are facing any problems with anything in your home, <b>LET US BE YOUR SOLUTION</b>.
            </p>
          </div>
        </div>
      </div>
      <div class="row">
       
        <div class="span12">
          <div class="headline">
            <h3><span>Who we are??</span></h3>
          </div>
          <div class="about">
            <p style="font-size:25px">
            We are city corporation and we verify the vendors across the city and gives all information about them to you. The information you can see is totally verified and trustable. If you are facing any problems with your house amenities then you can find the solution for that here on this website.
            From this website you can directly contact to the vendor and discuss your problem and then they can send you the quote.<p>
             </p>
              </div>
        </div>
      </div>
        <div style="text-align:center">
       <img src="img/thunder-bay.jpg" alt="">
            </div>
    </div>
  </section>
  <!-- end section about -->

  
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style>
      .photos {
          max-height:100%;
          max-width:100%;
          min-height:100%;
          min-width:100%;
      }
    
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="background:DarkCyan">
    <!-- Content Header (Page header) -->
    <div class="content-header" >
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6"">
            <h1>We provide following services</h1>
          </div>
        </div>
      </div>
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
 
    <section class="content container1">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info ">  
              <img class="photos" src="img/services/snow_plow.jpg" />
              <a href="SnowPlow.aspx" class="small-box-footer" style="background: black; "> Snow Plow &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="UnionGas.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/uniongas.jpg" />
Union Gas &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
         
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="Water.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/water.jpg" />
Water &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="Furniture.aspx" class="small-box-footer" style="background:black;"><img class="photos"  src="img/services/furniture.jpg" />
Furniture &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>        
       </div>
        <!-- /.row End of row 1 -->

        <!--Row 2-->
       <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="Plumbing.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/plumbing.jpg" />
Plumbing &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="DumpRun.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/dumprun.jpg" />
Dump Run &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
         
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="Appliances.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/appliances.jpg" />
Appliances &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="Boiler.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/boiler.jpg" />
Boiler &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>        
       </div>   
       <!--Row 2 ended-->
         
        <!--Row 3-->
       <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="Electricity.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/hydro.jpg" />
Hydro and Electricity &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="Exterior.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/exterior.jpg" />
Exterior Problems &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
         
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="Interior.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/interior.jpg" />
Interior and Ventilation &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="Drainage.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/drainage.jpg" />
Drainage &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>        
       </div>   
       <!--Row 3 ended-->
        <!-- Small boxes (Stat box) -->
        <div class="row">
         <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <a href="PestControl.aspx" class="small-box-footer" style="background:black;"><img class="photos" src="img/services/pest_control.jpg" />
Pest Control &nbsp<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>        
       </div>   
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<!-- ./wrapper -->
    
</asp:Content>


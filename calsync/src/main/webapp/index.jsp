<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<!DOCTYPE html>
<html class="no-js"><!--<![endif]--><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"><link href="stylesheets/css.css" rel="stylesheet" type="text/css"><style type="text/css">.gm-style .gm-style-cc span,.gm-style .gm-style-cc a,.gm-style .gm-style-mtc div{font-size:10px}</style><style type="text/css">@media print {  .gm-style .gmnoprint, .gmnoprint {    display:none  }}@media screen {  .gm-style .gmnoscreen, .gmnoscreen {    display:none  }}</style><style type="text/css">.gm-style{font-family:Roboto,Arial,sans-serif;font-size:11px;font-weight:400;text-decoration:none}.gm-style img{max-width:none}</style>
    <meta charset="utf-8">
    <title>CalSync</title>
    <meta name="description" content="">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Google Font -->
    <link href="stylesheets/css_003.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/css_002.css" rel="stylesheet" type="text/css">
    
    <!-- Bootstrap Core CSS -->
    <link href="stylesheets/bootstrap.css" rel="stylesheet" type="text/css">
    
    <!-- Plugins CSS -->
    <link href="stylesheets/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/animate.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/owl.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/owl_002.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/magnific-popup.css" rel="stylesheet" type="text/css">
    
    <!-- Component CSS -->
    <link href="stylesheets/component.css" rel="stylesheet" type="text/css">
    
    <!-- Main CSS -->
    <link href="stylesheets/harshitha.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/switch-style.css" rel="stylesheet" type="text/css">
    
    <!-- Color CSS -->
    <!--<link href="images/css/colors/blue.css" rel="stylesheet" type="text/css">-->
    <!--<link href="images/css/component/colors/blue.css" rel="stylesheet" type="text/css">-->
    
    <!-- Modernizr JS for IE9 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="../images/plugins/modernizr.min.js"></script>
    <![endif]-->
<script style="" src="stylesheets/common.js" charset="UTF-8" type="text/javascript"></script><script src="stylesheets/map.js" charset="UTF-8" type="text/javascript"></script><script src="stylesheets/util.js" charset="UTF-8" type="text/javascript"></script><script src="stylesheets/marker.js" charset="UTF-8" type="text/javascript"></script><script src="stylesheets/onion.js" charset="UTF-8" type="text/javascript"></script><script src="stylesheets/stats.js" charset="UTF-8" type="text/javascript"></script><script src="stylesheets/controls.js" charset="UTF-8" type="text/javascript"></script></head>

<!-- The #page-top ID is part of the scrolling feature - the data-spy and data-target are part of the built-in Bootstrap scrollspy function -->
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top" data-offset="51">

  
    
    <!-- Begin Page Loader -->
    <div style="display: none;" id="page-loader">
        <div class="preload">
            <img src="stylesheets/preloader.gif" alt="Loading">
        </div>
        <!-- //.preload -->
    </div>
    <!-- //End Page Loader -->
    
    
    <!-- Begin Switch Style -->
    <link rel="stylesheet" id="switch_style" href="">
    
    <link rel="stylesheet" id="switch_style_component" href="">
    
    
    
    
    <!-- Begin Intro Section -->
    <section id="intro">
        <div class="intro-body text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 intro-content">
                        <div class="logo">
                            <h1>CS</h1>
                        </div>
                        <!-- //.logo -->
                        
                        <div class="intro-text text-center">
                            <h2>Calender and Events manager</h2>

                            <p class="lead">Responsive Multi-Purpose Application for keeping track of all the events and synchronizing with calender</p>
                        </div>
                        <!-- //.intro-text -->

                        <div class="page-scroll">
                            <a href="#who-we-are" class="btn btn-lg btn-rj">Learn More</a>

                        </div>
			<div class="page-scroll">
				<% 
				UserService userService=UserServiceFactory.getUserService();
				%>
				<a href="<%=userService.createLoginURL(request.getRequestURI()) %>" class="btn btn-lg btn-rj"></i>Login</a>
<% User user = userService.getCurrentUser();
if (user != null) {
                                pageContext.setAttribute("user", user); }
 %>
                        </div>

                        <!-- //.page-scroll -->
                    </div>
                    <!-- //.intro-content -->
                </div>
                <!-- //.row -->
            </div>
            <!-- //.container -->
        </div>
        <!-- //.intro-body -->
    </section>
    <!-- //End Intro Section -->


    <!-- Begin Navbar -->
    <div style="height: 60px;" class="sticky-wrapper is-sticky" id="navigation-sticky-wrapper"><nav style="position: fixed; top: 0px;" id="navigation" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-rj-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
                <a class="navbar-brand" href="#page-top"><span style="color:#EC387D">C</span><span style="text-transform:lowercase">al</span><span style="color:#EC387D">S</span><span style="text-transform:lowercase">ync</span></a>
            </div>
            <!-- //.navbar-header -->
            
            <div class="navbar-collapse collapse navbar-rj-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="page-scroll">
                        <a href="#who-we-are">About</a>
                    </li>
                    
                    <li class="page-scroll">
                        <a href="#why-us">Features</a>
                    </li>
                    
                    <li class="page-scroll">
                        <a href="#our-main-skills">Development</a>
                    </li>
                    
                    
                    <li class="page-scroll">
                        <a href="#our-latest-work">View</a>
                    </li>

		   <li class="page-scroll">
                        <a href="#testimonials">Overview</a>
                    </li>
                                      
                    
                    <li class="page-scroll active">
                        <a href="#keep-in-touch">Code</a>
                    </li>
                    
                   
                </ul>
            </div>
            <!-- //.navbar-collapse -->
        </div>
        <!-- //.container -->
    </nav></div>
    <!-- //End Navbar -->


    <!-- Begin Who We Are Section -->
    <section id="who-we-are" class="section">
        <div class="section-inner">
            <div class="container section-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h2 class="main-title">About</h2>

                            <h3 class="sub-title">What is the application all about?</h3>

                            <span class="section-line"></span>
                        </div>
                        <!-- //.section-title -->
                    </div>
                    <!-- //.col-md-12 -->
                </div>
                <!-- //.row -->

                <div class="row">
                    <div class="col-md-6">
                        <div style="opacity: 1; display: block;" id="carousel-who-we-are" class="owl-carousel owl-theme animated fadeInUp delayp1">
                            <div class="owl-wrapper-outer"><div style="width: 555px;" class="owl-item"><div class="item">
                                <img src="images/who-we-are-image-3.jpg" alt="" class="img-responsive img-rounded">
                            </div></div></div>
                            <!-- //.item -->

                            
                            <!-- //.item -->

                            
                      </div>
                        <!-- //.owl-carousel -->
                    </div>
                    <!-- //.col-md-6 -->

                    <div class="col-md-6">
                        <div style="opacity: 1;" class="who-we-are-text animated fadeInUp delayp3">
                            <h4>A Little About The application</h4>

                            <p> This application contains 2 kinds of users. <br> 
				1.Users who upload events<br>
				2.Users who view events			
	</p>

                            <div class="page-scroll">
                                <a href="#why-us" class="btn btn-lg btn-rj">Read More</a>
                            </div>
                            <!-- //.page-scroll -->
                        </div>
                        <!-- //.who-we-are-text -->
                    </div>
                    <!-- //.col-md-6 -->
                </div>
                <!-- //.row -->
            </div>
            <!-- //.section-content -->
        </div>
        <!-- //.section-inner -->
    </section>
    <!-- //End Who We Are Section -->


    <!-- Begin Fun Fact Section -->
    <section id="fun-fact" class="section section-bgimage-yes">
        <div class="section-inner">
            <div class="section-overlay"></div>
            
            <div class="container section-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h2 class="main-title">Fun Facts</h2>

                            <h3 class="sub-title">Some Of The Facts about events in UCSB</h3>

                            <span class="section-line"></span>
                        </div>
                        <!-- //.section-title -->
                    </div>
                    <!-- //.col-md-12 -->
                </div>
                <!-- //.row -->

                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-3 text-center">
                        <div style="opacity: 1;" class="counter-item not-right-column top-column animated fadeInUp delayp1">
                            

                            <div class="inner-content">
                                <span class="number" data-from="2200" data-to="70" data-refresh-interval="10">70</span>
                            </div>
                            <!-- //.inner-content -->

                            <p>Programs</p>
                        </div>
                        <!-- //.counter-item -->
                    </div>
                    <!-- //.col-xs-6 col-sm-6 col-md-3 -->

                    <div class="col-xs-6 col-sm-6 col-md-3 text-center">
                        <div style="opacity: 1;" class="counter-item not-right-column top-column animated fadeInUp delayp1">
                           

                            <div class="inner-content">
                                <span class="number" data-from="330" data-to="2780" data-refresh-interval="10">2780</span>
                            </div>
                            <!-- //.inner-content -->

                            <p>Posters</p>
                        </div>
                        <!-- //.counter-item -->
                    </div>
                    <!-- //.col-xs-6 col-sm-6 col-md-3 -->

                    <div class="col-xs-6 col-sm-6 col-md-3 text-center">
                        <div style="opacity: 1;" class="counter-item not-right-column animated fadeInUp delayp1">
                          

                            <div class="inner-content">
                                <span class="number" data-from="13300" data-to="23051" data-refresh-interval="10">23051</span>
                            </div>
                            <!-- //.inner-content -->

                            <p>Enrollment</p>
                        </div>
                        <!-- //.counter-item -->
                    </div>
                    <!-- //.col-xs-6 col-sm-6 col-md-3 -->

                    <div class="col-xs-6 col-sm-6 col-md-3 text-center">
                        <div style="opacity: 1;" class="counter-item animated fadeInUp delayp1">
                           

                            <div class="inner-content">
                                
                            </div> 
<br>
                            <!-- //.inner-content -->

                            <p>Events!??!<br> Too many</p>
                        </div>
                        <!-- //.counter-item -->
                    </div>
                    <!-- //.col-xs-6 col-sm-6 col-md-3 -->
                </div>
                <!-- //.row -->
            </div>
            <!-- //.section-content -->
        </div>
        <!-- //.section-inner -->
    </section>
    <!-- //End Fun Fact Section -->


    <!-- Begin Why Us Section -->
    <section id="why-us" class="section">
        <div class="section-inner">
            <div class="container section-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h2 class="main-title">Application features</h2>

                            <h3 class="sub-title">6 Major application features</h3>

                            <span class="section-line"></span>
                        </div>
                        <!-- //.section-title -->
                    </div>
                    <!-- //.col-md-12 -->
                </div>    
                <!-- //.row -->

                <!-- Begin Content Boxes -->
                <div class="row">
                    <div class="col-sm-4 col-md-4">
                        <div style="opacity: 1;" class="content-boxes style-two top-column clearfix animated flipInY delayp1">
                                                     
                            <div class="content-boxes-text">
                                <h4 style="color:#1ABC9C">Login</h4>
                                
                                <p>Two kinds of users can login
<br>1- Event creater 
<br>2- Event viewer 
</p>
                            </div>
                            <!-- //.content-boxes-text -->
                        </div>
                        <!-- //.content-boxes -->
                    </div>
                    <!-- //.col-sm-4 col-md-4 -->

                    <div class="col-sm-4 col-md-4">
                        <div style="opacity: 1;" class="content-boxes style-two top-column clearfix animated flipInY delayp1">
                          
                            
                            <div class="content-boxes-text">
                                <h4 style="color:#1ABC9C">ADD EVENT</h4>
                                
                                <p>The event creater can add events into the event list. The events then appear on the calender of events of the university
</p>
                            </div>
                            <!-- //.content-boxes-text -->
                        </div>
                        <!-- //.content-boxes -->
                    </div>
                    <!-- //.col-sm-4 col-md-4 -->

                    <div class="col-sm-4 col-md-4">
                        <div style="opacity: 1;" class="content-boxes style-two top-column clearfix animated flipInY delayp1">
                     
                            <div class="content-boxes-text">
                                <h4 style="color:#1ABC9C">Calender View</h4>
                                
                                <p>The events can be viewed in the calender and the events are alined in the calender according to date and time</p>
                            </div>
                            <!-- //.content-boxes-text -->
                        </div>
                        <!-- //.content-boxes -->
                    </div>
                    <!-- //.col-sm-4 col-md-4 -->
                </div>
                <!-- //.row -->

                <div class="row">
                    <div class="col-sm-4 col-md-4">
                        <div style="opacity: 1;" class="content-boxes style-two bottom-column not-right-column clearfix animated flipInY delayp1">
                        
                            <div class="content-boxes-text">
                                <h4 style="color:#1ABC9C">Sync </h4>
                                
                                <p>The events viewing user can synchronize the application with their google account</p>
                            </div>
                            <!-- //.content-boxes-text -->
                        </div>
                        <!-- //.content-boxes -->
                    </div>
                    <!-- //.col-sm-4 col-md-4 -->

                    <div class="col-sm-4 col-md-4">
                        <div style="opacity: 1;" class="content-boxes style-two bottom-column not-right-column clearfix animated flipInY delayp1">
                         
                            <div class="content-boxes-text">
                                <h4 style="color:#1ABC9C">Suggestions</h4>
                                
                                <p>The application suggests users about the events they can attend when they are free based on synchronization with their google account</p>
                            </div>
                            <!-- //.content-boxes-text -->
                        </div>
                        <!-- //.content-boxes -->
                    </div>
                    <!-- //.col-sm-4 col-md-4 -->

                    <div class="col-sm-4 col-md-4">
                        <div style="opacity: 1;" class="content-boxes style-two bottom-column clearfix animated flipInY delayp1">
                          
                            
                            <div class="content-boxes-text">
                               <h4 style="color:#1ABC9C">Mark-Up</h4>
                                
                                <p>The events the user is interested in attending can be marked up and individual user can view the events they have marked-up</p>
                            </div>
                            <!-- //.content-boxes-text -->
                        </div>
                        <!-- //.content-boxes -->
                    </div>
                    <!-- //.col-sm-4 col-md-4 -->
                </div>
                <!-- //End Content Boxes -->      
            </div>
            <!-- //.section-content -->
        </div>
        <!-- //.section-inner -->
    </section>
    <!-- //End Why Us Section -->


    <!-- Begin Our Main Skills Section -->
    <section id="our-main-skills" class="section section-bgimage-yes">
        <div class="section-inner">
            <div class="section-overlay"></div>

            <div class="container section-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="main-title">Application development</h3>

                            <h3 class="sub-title">Tools and Languages used for development</h3>

                            <span class="section-line"></span>
                        </div>
                        <!-- //.section-title -->
                    </div>
                    <!-- //.col-md-12 -->
                </div>
                <!-- //.row -->
                
                <div class="row">
                    <div class="col-md-5">
                        <div style="opacity: 1;" class="bar-chart-text animated flipInX delayp1">
                            <p class="lead" style="color:#1ABC9C">
                                The application included the knowledge of 
                            
                            <p>
                              =======>
                            </p>
                        </div>
                        <!-- //.bar-chart-text -->
                    </div>
                    <!-- //.col-md-5 -->
                    
                    <div class="col-md-7">
                        
                        <!-- Begin Bar Chart -->
                        <div style="opacity: 1;" class="bar-chart animated flipInX delayp1">
                            <div style="width: 529.55px;" class="bar-chart-item" data-percent="85">
                                <p>Java</p>
                            </div>
                            <!-- //.bar-chart-item -->

                            <div style="width: 467.25px;" class="bar-chart-item" data-percent="75">
                                <p>Web Design</p>
                            </div>
                            <!-- //.bar-chart-item -->

                            <div style="width: 623px;" class="bar-chart-item" data-percent="100">
                                <p>Google App engine</p>
                            </div>
                            <!-- //.bar-chart-item -->

                            <div style="width: 560.7px;" class="bar-chart-item" data-percent="60">
                                <p>Google APIs</p>
                            </div>
                            <!-- //.bar-chart-item -->

                            <div style="width: 373.8px;" class="bar-chart-item" data-percent="90">
                                <p>Data store, Memcache, Task queues</p>
                            </div>
                            <!-- //.bar-chart-item -->

                            <div style="width: 467.25px;" class="bar-chart-item" data-percent="50">
                                <p>Git</p>
                            </div>
                            <!-- //.bar-chart-item -->

                            <div class="bar-chart-legend clearfix">
                                <div class="legend legend-left">
                                    <p>Little</p>
                                </div>
                                <!-- //.legend -->

                                <div class="legend legend-left">
                                    <p>Moderate</p>
                                </div>
                                <!-- //.legend -->

                                <div class="legend legend-right">
                                    <p>High</p>
                                </div>
                                <!-- //.legend -->

                                <div class="legend legend-right">
                                    <p>Very high</p>
                                </div>
                                <!-- //.legend -->
                            </div>
                            <!-- //.bar-chart-legend -->
                        </div>
                        <!-- //End Bar Chart -->
                    </div>
                    <!-- //.col-md-7 -->
                </div>
                <!-- //.row -->
            </div>
            <!-- //.section-content -->
        </div>
        <!-- //.section-inner -->
    </section>
    <!-- //End Our Main Skills Section -->


<!-- Begin Our Latest Work Section -->
    <section id="our-latest-work" class="section">
        <div class="section-inner">
            <div class="container section-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h2 class="main-title">Application View</h2>

                            <h3 class="sub-title">Gist of how the application looks like</h3>

                            <span class="section-line"></span>
                        </div>
                        <!-- //.section-title -->
                    </div>
                    <!-- //.col-md-12 -->
                </div>
                <!-- //.row -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="filter-portfolio">
                            <ul class="list-unstyled">
                                <li class="active">
                                    <a href="#" data-filter="*" class="btn btn-rj disabled">All</a>
                                </li>

                                <li>
                                    <a href="#" data-filter=".identity" class="btn btn-rj">Identity</a>
                                </li>

                                <li>
                                    <a href="#" data-filter=".logo" class="btn btn-rj">Logo</a>
                                </li>

                                <li>
                                    <a href="#" data-filter=".illustration" class="btn btn-rj">Illustration</a>
                                </li>
                            </ul>
                        </div>
                        <!-- //.filter-portfolio -->
                    </div>
                    <!-- //.col-md-12 -->
                </div>
                <!-- //.row -->

                <div class="row">
                    <div class="col-md-12">
                        <div style="position: relative; width: 1140px; height: 785.001px;" class="popup-portfolio">
                            <div style="position: absolute; left: 0px; top: 0px;" class="portfolio-item grow illustration logo">
                                <div class="inner-content">
                                    <div class="portfolio-content">
                                        <div class="portfolio-detail">
                                            <a href="images/portfolio-image-7.jpg" title="Login page">
                                                <div class="portfolio-text">
                                                    <h4>Login Page</h4>

                                                    
                                                </div>
                                                <!-- //.portfolio-text -->
                                            </a>
                                        </div>
                                        <!-- //.portfolio-detail -->
                                    </div>
                                    <!-- //.portfolio-content -->

                                    <img src="images/portfolio-image-7.jpg" alt="" class="img-responsive">
                                </div>
                                <!-- //.inner-content -->
                            </div>
                            <!-- //.portfolio-item -->

                            <div style="position: absolute; left: 385px; top: 0px;" class="portfolio-item grow identity">
                                <div class="inner-content">
                                    <div class="portfolio-content">
                                        <div class="portfolio-detail">
                                            <a href="images/portfolio-image-7.jpg" title="Project Title 2 ">
                                                <div class="portfolio-text">
                                                    <h4>Project Title 2</h4>

                                                    
                                                </div>
                                                <!-- //.portfolio-text -->
                                            </a>
                                        </div>
                                        <!-- //.portfolio-detail -->
                                    </div>
                                    <!-- //.portfolio-content -->

                                    <img src="images/portfolio-image-7.jpg" alt="" class="img-responsive">
                                </div>
                                <!-- //.inner-content -->
                            </div>
                            <!-- //.portfolio-item -->

                            <div style="position: absolute; left: 770px; top: 0px;" class="portfolio-item grow logo identity">
                                <div class="inner-content">
                                    <div class="portfolio-content">
                                        <div class="portfolio-detail">
                                            <a href="images/portfolio-image-7.jpg" title="Project Title 3 ">
                                                <div class="portfolio-text">
                                                    <h4>Project Title 3</h4>

                                                 
                                                </div>
                                                <!-- //.portfolio-text -->
                                            </a>
                                        </div>
                                        <!-- //.portfolio-detail -->
                                    </div>
                                    <!-- //.portfolio-content -->

                                    <img src="images/portfolio-image-7.jpg" alt="" class="img-responsive">
                                </div>
                                <!-- //.inner-content -->
                            </div>
                            <!-- //.portfolio-item -->

                            <div style="position: absolute; left: 0px; top: 261px;" class="portfolio-item grow logo">
                                <div class="inner-content">
                                    <div class="portfolio-content">
                                        <div class="portfolio-detail">
                                            <a href="images/portfolio-image-7.jpg" title="Project Title 4 ">
                                                <div class="portfolio-text">
                                                    <h4>Project Title 4</h4>
S
                                                </div>
                                                <!-- //.portfolio-text -->
                                            </a>
                                        </div>
                                        <!-- //.portfolio-detail -->
                                    </div>
                                    <!-- //.portfolio-content -->

                                    <img src="images/portfolio-image-7.jpg" alt="" class="img-responsive">
                                </div>
                                <!-- //.inner-content -->
                            </div>
                            <!-- //.portfolio-item -->

                            <div style="position: absolute; left: 385px; top: 261px;" class="portfolio-item grow logo illustration">
                                <div class="inner-content">
                                    <div class="portfolio-content">
                                        <div class="portfolio-detail">
                                            <a href="images/portfolio-image-7.jpg" title="Project Title 5">
                                                <div class="portfolio-text">
                                                    <h4>Project Title 5</h4>

                                                  
                                                </div>
                                                <!-- //.portfolio-text -->
                                            </a>
                                        </div>
                                        <!-- //.portfolio-detail -->
                                    </div>
                                    <!-- //.portfolio-content -->

                                    <img src="images/portfolio-image-7.jpg" alt="" class="img-responsive">
                                </div>
                                <!-- //.inner-content -->
                            </div>
                            <!-- //.portfolio-item -->

                            <div style="position: absolute; left: 770px; top: 261px;" class="portfolio-item grow identity">
                                <div class="inner-content">
                                    <div class="portfolio-content">
                                        <div class="portfolio-detail">
                                            <a href="images/portfolio-image-7.jpg" title="Project Title 6">
                                                <div class="portfolio-text">
                                                    <h4>Project Title 6</h4>

                                             
                                                </div>
                                                <!-- //.portfolio-text -->
                                            </a>
                                        </div>
                                        <!-- //.portfolio-detail -->
                                    </div>
                                    <!-- //.portfolio-content -->

                                    <img src="images/portfolio-image-7.jpg" alt="" class="img-responsive">
                                </div>
                                <!-- //.inner-content -->
                            </div>
                            <!-- //.portfolio-item -->

                            <div style="position: absolute; left: 0px; top: 523px;" class="portfolio-item grow logo">
                                <div class="inner-content">
                                    <div class="portfolio-content">
                                        <div class="portfolio-detail">
                                            <a href="images/portfolio-image-7.jpg" title="Project Title 7 ">
                                                <div class="portfolio-text">
                                                    <h4>Project Title 7</h4>

                                                   
                                                </div>
                                                <!-- //.portfolio-text -->
                                            </a>
                                        </div>
                                        <!-- //.portfolio-detail -->
                                    </div>
                                    <!-- //.portfolio-content -->

                                    <img src="images/portfolio-image-7.jpg" alt="" class="img-responsive">
                                </div>
                                <!-- //.inner-content -->
                            </div>
                            <!-- //.portfolio-item -->

                            <div style="position: absolute; left: 385px; top: 523px;" class="portfolio-item grow illustration">
                                <div class="inner-content">
                                    <div class="portfolio-content">
                                        <div class="portfolio-detail">
                                            <a href="images/portfolio-image-7.jpg" title="Project Title 8 ">
                                                <div class="portfolio-text">
                                                    <h4>Project Title 8</h4>

                                                </div>
                                                <!-- //.portfolio-text -->
                                            </a>
                                        </div>
                                        <!-- //.portfolio-detail -->
                                    </div>
                                    <!-- //.portfolio-content -->

                                    <img src="images/portfolio-image-7.jpg" alt="" class="img-responsive">
                                </div>
                                <!-- //.inner-content -->
                            </div>
                            <!-- //.portfolio-item -->

                            <div style="position: absolute; left: 770px; top: 523px;" class="portfolio-item grow illustration">
                                <div class="inner-content">
                                    <div class="portfolio-content">
                                        <div class="portfolio-detail">
                                            <a href="images/portfolio-image-7.jpg" title="Project Title 9 ">
                                                <div class="portfolio-text">
                                                    <h4>Project Title 9</h4>
 
                                                </div>
                                                <!-- //.portfolio-text -->
                                            </a>
                                        </div>
                                        <!-- //.portfolio-detail -->
                                    </div>
                                    <!-- //.portfolio-content -->

                                    <img src="images/portfolio-image-7.jpg" alt="" class="img-responsive">
                                </div>
                                <!-- //.inner-content -->
                            </div>
                            <!-- //.portfolio-item -->
                        </div>
                        <!-- //.popup-portfolio -->
                    </div>
                    <!-- //.col-md-12 -->
                </div>
                <!-- //.row -->
            </div>
            <!-- //.section-content -->
        </div>
        <!-- //.section-inner -->
    </section>
    <!-- //End Our Latest Work Section -->


    <!-- Begin Testimonials Section -->
    <section id="testimonials" class="section section-bgimage-yes">
        <div class="section-inner">
            <div class="section-overlay"></div>

            <div class="container section-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h2 class="main-title">Overview</h2>

                            <h3 class="sub-title">The project overview</h3>

                            <span class="section-line"></span>
                        </div>
                        <!-- //.section-title -->
                    </div>
                    <!-- //.col-md-12 -->
                </div>    
                <!-- //.row -->


                <div class="row">
                    <div class="col-sm-4 col-md-4" style="color:white">
                        <div class="funny-boxes float-shadow not-right-column text-center">
                         

                            <div style="opacity: 1;" class="funny-boxes-text animated flipInY delayp1">
                                <h4 style="">Motivation</h4>

                                <p>Lack of medium to share information across departments and manual checking of events.</p>
                            </div>
                            <!-- //.funny-boxes-text -->
                        </div>
                        <!-- //.funny-boxes -->
                    </div>
                    <!-- //.col-sm-4 col-md-4 -->

                    <div class="col-sm-4 col-md-4" style="color:white">
                        <div class="funny-boxes float-shadow not-right-column text-center">
                     
                            <div style="opacity: 1;" class="funny-boxes-text animated flipInY delayp1">
                                <h4>Solution</h4>

                                <p>Develpment of application that allows synchronizing calender to keep track of all events.</p>
                            </div>
                            <!-- //.funny-boxes-text -->
                        </div>
                        <!-- //.funny-boxes -->
                    </div>
                    <!-- //.col-sm-4 col-md-4 -->

                    <div class="col-sm-4 col-md-4" style="color:white">
                        <div class="funny-boxes float-shadow text-center">
                       

                            <div style="opacity: 1;" class="funny-boxes-text animated flipInY delayp1">
                                <h4>Design Model</h4>

                                <p>Design is based on the type of user-user may either view event or create event.</p>
                            </div>
                            <!-- //.funny-boxes-text -->
                        </div>
                        <!-- //.funny-boxes -->
                    </div>
                    <!-- //.col-sm-4 col-md-4 -->
                </div>
                <!-- //.row -->
            </div>
            <!-- //.section-container -->
        </div>
        <!-- //.section-inner -->
    </section>
    <!-- //End Testimonials Section -->
  


    

    <!-- Begin Keep In Touch Section -->
    <section id="keep-in-touch" class="section section-bgimage-yes">
        <div class="section-inner">
            <div class="section-overlay"></div>

            <div class="container section-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="main-title">Code link</h3>

                            <h4 class="sub-title">Click the link below to view the source code</h4>
			<br>
                            <span class="section-line"></span>
<br><br>
				  <div class="page-scroll">
                    
                        </div><a href="https://github.com/harshithachidanand/cs263w16"  class="btn btn-lg btn-rj">Github link</a>
                        </div>
                        <!-- //.section-title -->
                    </div>
                    <!-- //.col-md-12 -->
                </div>    
                <!-- //.row -->

            </div>
            <!-- //.section-content -->
        </div>
        <!-- //.section-inner -->
    </section>
    <!-- //End Keep In Touch Section -->


    <!-- Begin Footer -->
    <footer class="footer">

       <!-- Begin Copyright -->
        <div id="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
				
                        <p style="text-align:center">Copyright © 2016- All wrongs reserved </p>
                    </div>
                    <!-- //.col-md-12 -->
                </div>
                <!-- //.row -->
            </div>
            <!-- //.container -->
        </div>
        <!-- //End Copyright -->
    </footer>
    <!-- //End Footer -->

    
    <!-- Plugins JS -->
    <script src="stylesheets/jquery_006.js"></script>
    <script src="stylesheets/bootstrap.js"></script>
    <script src="stylesheets/detectmobilebrowser.js"></script>
    <script src="stylesheets/smartresize.js"></script>
    <script src="stylesheets/jquery_004.js"></script>
    <script src="stylesheets/jquery_008.js"></script>
    <script src="stylesheets/jquery_009.js"></script>
    <script src="stylesheets/jquery.js"></script>
    <script src="stylesheets/jquery_002.js"></script>
    <script src="stylesheets/jquery_003.js"></script>
    <script src="stylesheets/owl.js"></script>
    <script src="stylesheets/isotope.js"></script>
    <script src="stylesheets/jquery_007.js"></script> 
    <script src="stylesheets/jquery_005.js"></script>
    
    <!-- Main JS -->
    <script src="stylesheets/main.js"></script>
    <script src="stylesheets/switch-style.js"></script>
    
    <!-- Animation JS (Optional) -->
    <script src="stylesheets/animation.js"></script>
    
    <!-- Component JS -->
    <script src="stylesheets/bar-chart.js"></script>
    <script src="stylesheets/countdown.js"></script>
    <script src="stylesheets/counters.js"></script>
    <script src="stylesheets/pie-chart.js"></script>
    <script src="stylesheets/portfolio.js"></script>
    <script src="stylesheets/animation_002.js"></script>
    
    <!-- Map JS -->
    <script src="stylesheets/js"></script>
    <script src="stylesheets/map_002.js"></script>



</body></html>

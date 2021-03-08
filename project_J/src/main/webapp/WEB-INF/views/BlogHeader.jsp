<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Made Three</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
		<link href="resources/css/freelancer.css" rel="stylesheet">
		<link href="resources/css/freelancer.min.css" rel="stylesheet">

        <link rel="stylesheet" href="resources/css/slick.css"> 
        <link rel="stylesheet" href="resources/css/slick-theme.css">
        <link rel="stylesheet" href="resources/css/animate.css">
        <link rel="stylesheet" href="resources/css/iconfont.css">
        <link rel="stylesheet" href="resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/css/bootstrap.css">
        <link rel="stylesheet" href="resources/css/magnific-popup.css">
        <link rel="stylesheet" href="resources/css/bootsnav.css">

		<link href="resources/css/Blog.css" rel="stylesheet">


        <!--For Plugins external css-->
        <link rel="stylesheet" href="resources/css/plugins.css" />

        <!--Theme custom css -->
        <link rel="stylesheet" href="resources/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="resources/css/responsive.css" />

		<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
		<link href="resources/css/Login.css" rel="stylesheet">
		<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
		
		
        <!-- JS includes -->
        <script src="resources/js/vendor/jquery-1.11.2.min.js"></script>
		<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
        <script src="resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

        <script src="resources/js/vendor/bootstrap.min.js"></script>

        <script src="resources/js/jquery.magnific-popup.js"></script>
        <!--<script src="resources/js/jquery.easypiechart.min.js"></script>-->
        <script src="resources/js/jquery.easing.1.3.js"></script>
        <!--<script src="resources/js/slick.js"></script>-->
        <script src="resources/js/slick.min.js"></script>
        <script src="resources/js/js.isotope.js"></script>
        <script src="resources/js/jquery.collapse.js"></script>
        <script src="resources/js/bootsnav.js"></script>

        <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

        <script src="resources/js/plugins.js"></script>
        <script src="resources/js/main.js"></script>
        
        <!-- Write -->
        <script src="resources/js/jqBootstrapValidation.js"></script>
        
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse" data-offset="100">



        <div class="culmn">
            <!--Home page style-->


            <nav class="navbar navbar-default bootsnav navbar-fixed no-background white">

                <!-- Start Top Search -->
                <div class="top-search">
                    <div class="container">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                        </div>
                    </div>
                </div>
                <!-- End Top Search -->


                <div class="container"> 
                    <div class="attr-nav">
                        <ul>
                            <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                        </ul>
                    </div> 

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="BlogMain" id="BlogName">
                        	<c:out value="${blogVO.account}"/>님의 블로그
                        </a>

                    </div>
                    <!-- End Header Navigation -->

                    <!-- navbar menu -->
                    <div class="collapse navbar-collapse" id="navbar-menu">


                        <ul class="nav navbar-nav navbar-right">
                            <li class="line"><a href="Main">HOME</a></li>

	                            <li><a href="Login">LOGIN</a></li>
	                            <li><a href="Join">JOIN</a></li>

	                        	<li><a href="<c:url value='/Mypage' />">MYPAGE</a></li>
	                        	<li><a href="BlogMain">MYBLOG</a></li>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div> 
            </nav>
         </div>    <!-- Header .culmn close tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 2022.12.18 -->
<c:set var="cpath" value="${ pageContext.request.contextPath }"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
	<title>engToy</title>

  	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
  	<meta name="description" content="">
  	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<!-- stylesheets css -->
	<link rel="stylesheet" href="/engToy/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/engToy/resources/css/custom.css">
    <link rel="stylesheet" type="/engToy/resources/text/css" href="/engToy/resources/loaders.css"/>
  	<link rel="stylesheet" href="/engToy/resources/css/magnific-popup.css">
	<link rel="stylesheet" href="/engToy/resources/css/animate.min.css">
	<link rel="stylesheet" href="/engToy/resources/css/font-awesome.min.css">
  	<link rel="stylesheet" href="/engToy/resources/css/nivo-lightbox.css">
<!--   	? -->
  	<link rel="stylesheet" href="/engToy/resources/css/nivo_themes/default/default.css">
  	<link rel="stylesheet" href="/engToy/resources/css/hover-min.css">
<!--   	? -->
    <link rel="stylesheet" href="/engToy/resources/css/contact-input-style.css">
    
    <!-- -- -->
    <link rel="stylesheet" href="/engToy/resources/css/join.css">
    <link rel="stylesheet" href="/engToy/resources/css/login.css">
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/checkout/">


	<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	
	    <!-- Favicons -->
	<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
	<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#712cf9">
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    </head>
    <body>
     <div class="loader loader-bg">
        <div class="loader-inner ball-pulse-rise">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    <!------------Static navbar ------------>
    <nav class="navbar navbar-default top-bar affix" data-spy="affix" data-offset-top="250" >
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">SimpleWord</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          <c:choose>
          	<c:when test="${login != null}">
          		<li><a href="/engToy/">Home</a></li>
		        <li><a href="${cpath}/login/logout">Logout</a></li>
		        <li><a href="#location">TestGame</a></li>
		        <li><a href="#hotels">Rank</a></li>
		        <li><a href="#contact-sec">Mypage</a></li> 
          	
          	</c:when>
          	<c:otherwise>
		     	<li><a href="/engToy/">Home</a></li>
		        <li><a href="#" data-toggle="modal" data-target="#exampleModalCenter">Login</a></li>
		        <li><a href="${cpath}/join/joinForm?mode=nomal">Join</a></li>
		        <li><a href="#location">TestGame</a></li>
		        <li><a href="#hotels">Rank</a></li>
		        <li><a href="#contact-sec">Mypage</a></li>           
          	</c:otherwise>
          	
          </c:choose>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
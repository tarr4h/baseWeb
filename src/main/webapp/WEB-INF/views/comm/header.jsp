<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>	
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1.0, user-scalable=0">
<meta name="format-detection" content="telephone=no">
<title>HANSOL C&C</title>

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Nanum+Pen+Script&display=swap" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

<!-- common.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/web.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mob.css">

<style>

</style>
<!-- favico -->
<link rel="short icon" href="#">

<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>

	$(() => {
		let userAgent = navigator.userAgent;

		if(userAgent.match(/iPhone/i)){
			$(".phDirect").css('display', 'flex');
		}
		if(userAgent.match(/Android/i)){
			$(".phDirect").css('display', 'flex');
		}

		
	})
</script>

</head>
<body>

<!-- header -->
<header>
	<div class="container-fluid p-0">
		<nav class="navbar navbar-expand-lg navbar-dark bg-tar-colorize fixed-top py-3 custom-hd-height">
		  <a class="navbar-brand text-light font-bold1" href="<c:url value='/' />">HANSOL C&C</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon text-light"></span>
		  </button>
		  <div class="collapse navbar-collapse pt-3" id="navbarNavDropdown">
		    <ul class="navbar-nav ml-auto">
		      <li class="nav-item board1
		      <c:if test="${page.equals('board/board1') }">
		        	active
	          </c:if>
		      ">
		        <a class="nav-link" href="${pageContext.request.contextPath}/board/page?param=board/board1">INTRODUCE</a>
		      </li>
		      <li class="nav-item board2
		      <c:if test="${page.equals('board/board2') }">
		        	active
	          </c:if>
		      ">
		        <a class="nav-link" href="<c:url value='/board/page?param=board/board2'/>">GUIDANCE</a>
		      </li>
			  <li class="nav-item
			  <c:if test="${page.equals('board/qnaBoard') }">
		        	active
	          </c:if>
			  ">
				<a class="nav-link" href="<c:url value='/board/page?param=board/qnaBoard'/>">Q&A</a>
			  </li>
			  <li class="nav-item
			  <c:if test="${page.equals('board/boardMain') }">
		        	active
	          </c:if>
			  ">
				<a class="nav-link" href="<c:url value='/board/page?param=board/boardMain'/>">CONTACT-US</a>
			  </li>
		    </ul>
		  </div>
		</nav>
	</div>
</header>

<section>
<form:hidden path="carId" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<title>View Cars Page</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<title>Cars List</title>
<link rel="stylesheet" href="/css/car.css">

<style>

	.container-fluid h1 {
	font-family: 'Poppins';
	text-align: center;
	}
	
</style>
</head>

<body>
<%@ include file="nav_bar.jsp"%>

<div class="container-fluid">

				<c:url var="get_search_url" value="search"/>
				<form action="${get_search_url}" id="myform" method="get" class="form-inline text-right" style="padding:20px;">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" value="" name="keyword" />
						<input type="submit" value="Search" class="btn btn-info"/>
					</form>
					
	<h1>Find The Car For You.</h1>
			<c:if test="${not empty error_message}">
				<p style="text-align: center">${error_message}</p>
			</c:if>

			<c:if test="${empty all_cars}">
				<sec:authorize access="hasRole('Administrator')">
					<span style="text-align: center"> No Cars are added yet. </span>
				</sec:authorize>
				<sec:authorize access="hasRole('Users')">
					<span style="text-align: center"> Please click on Add button to add Cars to the site.
					</span>
					<a href="post_car" style="text-align: center">
						<button class="btn btn-primary">Post A Car For Sale</button>
					</a>
				</sec:authorize>
			</c:if>
	
<div class="car-row">
	
	<c:if test="${not empty all_cars}">
	<%
	int i = 1;
	%>
	<c:forEach items="${all_cars}" var="car">

		<div class="car-card">
			<img class="card-image" src="/images/${car.carphoto}">
		<sec:authorize access="hasRole('Administrator')">
			<div class="dropdown">
  				<button class="dropbtn">Edit</button>
  				<div class="dropdown-content">
    				<a href="/edit?id=${car.carId}"">Update</a>
    				<a href="/delete?id=${car.carId}">Delete</a>
  				</div>
			</div>
		</sec:authorize>

				<h4 class="card-text">
					<b>${car.carModel}</b>
				</h4>
				<p class="card-text">${car.make}</p>
				<p class="card-text">${car.price}</p>
				
				<div style="text-align: center;">
				<a href="car_detail?id=${car.carId}">
					<button class="btn">View Details</button>
				</a>
				</div>

		</div>
	<%
	i++;
	%>
	</c:forEach>
	
	</c:if>
</div>
</div>
</body>
</html>
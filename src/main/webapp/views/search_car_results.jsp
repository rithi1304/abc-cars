<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Search Results Page</title>
<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<!--  Access the Static Resources without using spring URL -->
<link rel="stylesheet" href="/css/car.css">

<style>
 .text-center {
 font-family: 'Poppins';
 text-align: center;
}

input[type="submit"] {
	font-family: 'Poppins';
	background-color: #219ebc;
	color: white;
	border: none;
	border-radius: 15px;	
}
input[type="submit"]:hover {
	transition: all ease 0.3s;
	background-color: #caf0f8;
} 

 input[type="search"] {
	font-family: 'Poppins';
	border-radius: 15px;	
}
.text-danger {
  color: #c9184a;
  text-align: center;
}
</style>
</head>

<body>

	<%@ include file="nav_bar.jsp"%>

	<div>
		<h2 class="text-center">Search Car Results.</h2>
		<!--  Search Car Lists  -->

		<c:url var="get_search_url" value="search" />
		<form action="${get_search_url}" id="myform" method="get"
			class="form-inline text-right" style="padding: 20px;">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" value="${keyword}" name="keyword" /> <input
				type="submit" value="Search" class="btn btn-info" />

		</form>

		<c:if test="${empty search_cars}">
			<div>
				<h4 class="text-danger text-center">No Matching Item Found.</h4>
				<h5 class="text-danger text-center">Please try with another keyword.</h5>
			</div>
		</c:if>

		<c:if test="${not empty search_cars}">

			<%
			int i = 1;
			%>
			<div class="car-row">
				<c:forEach var="car" items="${search_cars}">

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

			</div>
			
		</c:if>
	</div>
</body>
</html>
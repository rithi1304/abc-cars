<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Car Detail Page</title>
<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">

<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  -->

<script src="/js/custom.js"></script>

<style>

.container-fluid {
	font-family: 'Poppins';
}

.form-horizontal {
margin-left: 100px;
}
  
.container-fluid hr {
	color: black;
}
.form-group .col-sm-8 {
	margin-top: 7px;
}

.car-img {
   margin-left: 50px;
}

.col-sm-8 input[type="number"] {
	width: 30%;
	padding: 10.5px;
	border-radius: 15px;
}

.form-group .btn-success {
	border: none;
	border-radius: 15px;
	background-color: #2dc653;
	color:white;
}

.form-group .btn-success:hover {
    background-color: #6ede8a;
	color: white;
	transition: all ease 0.2s;
}

.form-group .btn-danger {
	border: none;
	border-radius: 15px;
	background-color: #e01e37;
	color:white;
}

.form-group .btn-danger:hover {
    background-color: #ff4d6d;
	color: white;
	transition: all ease 0.2s;
}

</style>
</head>

<body>

	<%@ include file="nav_bar.jsp"%>

	<div class="container-fluid bg-1">
	
		<div class="row">
		<h2 class="margin text-center">Your Car</h2>

			<div class="col-md-8">

				<form:form class="form-horizontal">

					<div class="car-img">
						<div class="col-sm-8"><img src="/images/${car.carphoto}" width="400px"></div>
					</div>
					
					<div class="form-group">
						<label for="id" class="control-label col-sm-4">ID </label>
						<div class="col-sm-8">${car.carId}</div>
					</div>


					<div class="form-group">
						<label for="make" class="control-label col-sm-4">Car Make
						</label>
						<div class="col-sm-8">${car.make}</div>
					</div>

					<div class="form-group">
						<label for="model" class="control-label col-sm-4">Car
							Model </label>
						<div class="col-sm-8">${car.carModel}</div>
					</div>

					<div class="form-group">
						<label for="color" class="control-label col-sm-4">Color </label>
						<div class="col-sm-8">${car.color}</div>
					</div>

					<div class="form-group">
						<label for="reg" class="control-label col-sm-4">Reg No </label>
						<div class="col-sm-8">${car.registrationNo}</div>
					</div>
					
					<div class="form-group">
						<label for="regy ear" class="control-label col-sm-4">Year </label>
						<div class="col-sm-8">${car.registrationYear}</div>
					</div>

					<div class="form-group">
						<label for="price" class="control-label col-sm-4">Price </label>
						<div class="col-sm-8">${car.price}</div>
					</div>

					<hr/>

					<div class="form-group">
						<label for="price" class="control-label col-sm-4"> <img
							src="/images/${user.userphoto}" width="60px" alt="..."></label>
						
						<div class="col-sm-8" style="padding: 20px;">
							<form action="car_detail?id=${car.carId}" method="post">
								<input type="hidden" name="id" value="${car.carId}" /> <input
									type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> 
				<input type="number" placeholder="Enter Bid Price" name="bitprice" min="500" max="90000000"/>

								<div class="form-group" style="padding: 20px;">
									<input type="submit" value="Bid Car" class="btn btn-success">
									<a href="/view_cars" class="btn btn-danger">Go Back</a>
								</div>

							</form>
						</div>

					</div>

					<script>
						function goBack() {
							window.history.back();
						}
					</script>

				</form:form>

			</div>

			<div class="col-md-3 bg-3">
				<h4> Current Bidding Price!</h4><br/>
			<c:forEach var="car_bidding" items="${bidinfo}">
				
				<div class="card mb-3 card bg-info" style="padding:10px;">
				
					<div class="row" >
						<div class="col-md-6">
							<img class="card-img-top"
							src="/images/${user.userphoto}" width="30px" class="rounded-circle"
							class="mr-3" alt="...">
							<p>${car_bidding.bidderName}</p>
						</div>
						<div class="col-md-6">
							<div class="card-body">
								<p class="card-head"><small class="text-muted">${car_bidding.bid_date_time}</small></p>
								<p class="card-text">Bidded Price: ${car_bidding.bidderPrice}</p>
						
							</div>
						</div>
					</div>
				</div>
				
				<hr/>
			</c:forEach>

			</div>
		</div>
	</div>



</body>
</html>

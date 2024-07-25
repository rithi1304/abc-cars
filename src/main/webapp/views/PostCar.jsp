<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Post Car Page</title>
 <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<style>

	.container {
	font-family : 'Poppins';
	}
	
	.container h2 {
	margin-left: 15px;
	margin-bottom: 10px;
	}
	
	.car-up input[type="file"] {
	font-family: 'Poppins';
	 margin-bottom: 15px;
	}

 	.container .form-group input {
	 font-family: 'Montserrat';
	 }
	 
 	.container .btn {
	 font-size: 15px;
	 padding: 15px;
	 border: none;
	 box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	 background-color: #03045e;
	 border-radius: 25px;
	 margin-bottom: 10px;
	 }
	 
	 .container .btn:hover {
	 color: white;
	 background-color: caf0f8;
	 transition: all ease 0.3s;
	 }
	 
</style>

</head>

<body>
    <%@ include file="nav_bar.jsp"%>
		
	<div class="container">

		<div class="row">

			<h2>Fill up your car details.</h2>
		</div>

		<div class="row">

			<div class="col-md-6">

				<form:form action="save_car" method="post" modelAttribute="car" enctype="multipart/form-data">

					<input type="hidden" value="${_csrf.token}" />
						<form:hidden path="carId" />
					
					<c:if test="${car.carId>0}">
						<div class="form-group">
							<img src="/images/${car.carphoto}" width="200px">
							<form:hidden path="carphoto" />
						</div>
					</c:if>

					<div class="car-up">
						<label for="carphoto">Upload Car Photo:</label> 
						<input type="file" name="file" />
					</div>

					<div class="form-group">
						<label for="carModel">Car Model</label>
						<form:input path="carModel" class="form-control" required="true" />
					</div>

					<div class="form-group">
						<label for="make">Car Make</label>
						<form:input path="make" class="form-control" required="true" />
					</div>


					<div class="form-group">
						<label for="color">Car Color</label>
						<form:input path="color" class="form-control" required="true" />
					</div>
					
					<div class="form-group">
						<label for="color">Registration No.</label>
						<form:input path="registrationNo" class="form-control" required="true" />
					</div>

					<div class="form-group">
						<label for="registrationYear">Year</label>
						<form:input path="registrationYear" class="form-control" required="true" />
					</div>

					<div class="form-group">
						<label for="price">Car Price</label>
						<form:input path="price" class="form-control" required="true" />
					</div>

					<input type="submit" value="Post Car" class="btn btn-primary" />

				</form:form>
			</div>
		</div>

	</div>
</body>
</html>
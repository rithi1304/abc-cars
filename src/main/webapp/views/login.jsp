<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Login Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<!--  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<%@ page isELIgnored="false" %>

<link href="/css/sign_in.css" rel="stylesheet" />
<style>
	.container {
	font-family: 'Poppins';
	}
	
	.row .col-md-4 {
	padding: 40px;
	}

	.col-md-4 .btn {
	border: none;
	background-color: #c1d3fe;
	color: #66666e;
	padding: 15px;
	border-radius: 25px;
	margin-left: 128px;
	font-size: 15px;
	box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);
	}
	
	.col-md-4 .btn:hover {
	background-color: #edf2fb;
	color: #66666e;
	transition: all ease 0.3s;
	}
	
	.form-group input{
	font-family: 'Montserrat';
	background-color: white;
	}
	
</style>
</head>

<body >

<%@ include file="nav_bar.jsp"%>

	<!-- First Container -->
	<div class="container">
	
	<h3 class="text-center">Log in </h3>
		<div class="row" >

			<div class="col-md-4"></div>

			<div class="col-md-4" style="background-color: #e2eafc; padding-top: 30px; padding-bottom: 20px; border-radius: 10px; margin-bottom: 20px; margin-top: 20px;">

				<c:if test="${error_string != null}">

					<div class="alert alert-danger">
						${error_string}
					</div>

				</c:if>

				<c:url var="post_url" value="/login" />
				<form action="${post_url}" method="post">

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<div class="form-group">

						<label for="username">User Name:</label>
						<input type="text" name="username" id="username" value="" class="form-control"></input>
					</div>

					<div class="form-group">
						<label for="password">Password:</label> 
						<input type="password" name="password" id="password" value="" class="form-control"></input>
					</div>
					
					<div>
					<p>If you don't have an account, <a href="register_form">register</a> first
					</div>
					<div>
					<input type="submit" name="Login" value="Login" class="btn btn-primary"></input>
					</div>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>

	</div>
<%@ include file="footer.jsp"%>

</body>
</html>

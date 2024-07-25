<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<link rel="stylesheet" href="/css/header.css"> 

</head>

<body>

<div class="topnav">

	<sec:authorize access="!isAuthenticated()">
 		<a class="active" href="#home">Home</a>
 	 	<a href="/aboutUs">About us</a>
  		<a href="/contactUs">Contact us</a>
  		<a href="/login" class="split">Login</a>
		<a href="/register_form" class="split">Register</a>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">

		<sec:authorize access="hasRole('Users')">
			<a class="link" href="/view_cars">Used Cars</a>
			<a class="link" href="/post_car">Sell Your Car</a>
			<a class="profile" href="/profile">
            <img  src="images/user_icon.jpg" alt="User Profile">
            John Doe
          </a>
		</sec:authorize>

		<sec:authorize access="hasRole('Administrator')">
			<a href="/view_cars">Car Management </a>
			<a href="users">User Management</a>
		</sec:authorize>
		
		
		<form action="logout" method="post" style="padding:7px; float: right;">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<Button type="submit" name="Logout" value="Logout" class="btn">Logout</Button>
		</form>
	</sec:authorize>
				
</div>

</body>
</html>

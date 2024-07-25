<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">

<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/nav_bar.css">

<style>
	.navbar {
		background: #8d99ae;
		padding-left: 10px;
		font-family: 'Poppins', sans-serif;
	}
	
	.navbar-inverse .navbar-nav>li>a {
		color: 	#FFFFFF;
		font-size:20px;
		margin-top: 10px;
	}
	
	.navbar-inverse .navbar-nav>li>a:hover {
		color: #2b2d42;
	}

</style>

</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-inverse">
		<div class="container">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"> <img src="/images/logo-transparent-png.png"
					width="120px" />
				</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-left">

					<sec:authorize access="!isAuthenticated()">
						<li><a class="link"  href="/home">Home</a></li>
						<li><a class="link" href="/aboutUs">About us</a></li>
						<li><a class="link" href="/contactUs">Contact us</a></li>
					</sec:authorize>


					<sec:authorize access="isAuthenticated()">

						<sec:authorize access="hasRole('Users')">
							<li><a class="link" href="/view_cars">Used Cars</a></li>
							<li><a class="link" href="/post_car">Sell Car</a></li>
						</sec:authorize>

						<sec:authorize access="hasRole('Administrator')">
							<li><a class="link" href="/view_cars">Car Management </a></li>
							<li><a class="link" href="users">User Management</a></li>

						</sec:authorize>

					</sec:authorize>
				</ul>

				<ul class="nav navbar-nav navbar-right">

					<sec:authorize access="!isAuthenticated()">
						<li><a class="link" href="/login">Login</a></li>
						<li><a class="link" href="/register_form">Register</a></li>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">

						<c:if test="${not empty user}">
							<li class="profile"><a href="/profile"> 
									<c:choose>
										<c:when test="${empty user.userphoto}">
											<img src="images/user_icon.jpg" alt="User Profile">
										</c:when>
										<c:otherwise>
											<img src="/images/${user.userphoto}" alt="User Profile">
										</c:otherwise>
									</c:choose>
            						${user.userName}									
							</a></li>
						</c:if>

					</sec:authorize>

				</ul>
			</div>

		</div>
	</nav>

</body>
</html>



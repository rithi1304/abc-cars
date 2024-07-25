<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Edit Profile Page</title>
<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<!--  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<style>
	.container {
	font-family: 'Poppins';
	}
	
	.container .pro-img{
	margin-left: 475px;
	}

	.container h3 {
	font-family: 'Poppins';
	text-align: center;
	}
	
	.form-group label{
	margin-left: 330px;
	}
	
	.container .form-control {
	margin-left: 330px;
	} 
	
	.user-pro input[type="file"]{
	font-family: 'Poppins';
	margin-left: 480px;
	} 
	
	 .user-pro label[for="userphoto"] {
	 margin-top: 10px;
	 font-family: 'Poppins';
	 margin-left: 510px;
	 }
	 
	 .form-group .form-control {
	 font-family: 'Montserrat';
	 }
	 
	 .form-group input {
	 width: 45%;
	 }
	 
	 .container .btn {
	 font-size: 15px;
	 padding: 15px;
	 margin-left: 550px;
	 border: none;
	 box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	 background-color: #03045e;
	 border-radius: 20px;
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
		<h3>Edit Profile</h3>
		<form:form action="update_profile" method="post" modelAttribute="user" enctype="multipart/form-data">

			<input type="hidden" value="${_csrf.token}" />
				<form:hidden path="id" />
				
		<div class="pro-img">
			<c:choose>
				<c:when test="${empty user.userphoto}">
					<img src="images/user_icon.jpg" alt="User Profile"  width="200px">
				</c:when>
				<c:otherwise>
					<img src="/images/${user.userphoto}" alt="User Profile" width="200px">
					<form:hidden path="carphoto" />
				</c:otherwise>
			</c:choose>
			
		</div>
			<div class="user-pro">
				<label for="userphoto">Upload User Photo:</label> 
				<input type="file" name="file" />
			</div>			

			<div class="form-group">
				<label for="name">Name</label>
				<form:input path="name" class="form-control" required="true" />
			</div>


			<div class="form-group">
				<label for="User name">User Name</label>
				<form:input path="userName" class="form-control" required="true" />
			</div>

			<div class="form-group">
				<label for="phone">Phone</label>
				<form:input path="phone" class="form-control" required="true" />
			</div>
			
			<div class="form-group">
				<label for="address">Password</label>
				<form:input path="address" class="form-control" required="true" />
			</div>
			
			<div class="form-group">
				<label for="Password">Password</label>
				<form:input path="password" class="form-control" required="true" />
			</div>

			<input type="submit" value="submit" class="btn btn-primary" />

		</form:form>
	</div>	

</body>
</html>
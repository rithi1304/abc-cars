<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Edit User Page</title>
<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>  -->

<style>
	.container {
	font-family: 'Poppins';
	}
	
	.container h2 {
	font-family: 'Poppins';
	}
	
	 .user-img label[for="userphoto"] {
	 margin-top: 10px;
	 }
	 
	 .user-img input[type="file"]{
	margin-bottom: 10px;
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

		<h2>Edit User</h2>
		<form:form action="s_user" method="post" modelAttribute="euser" enctype="multipart/form-data">

			<div class="form-group">
				<form:hidden path="id" />
			</div>
			
			<c:choose>
				<c:when test="${empty euser.userphoto}">
					<img src="images/user_icon.jpg" alt="User Profile"  width="180px">
				</c:when>
				<c:otherwise>
					<img src="/images/${euser.userphoto}" alt="User Profile" width="180px">
				</c:otherwise>
			</c:choose>
			
			<div class="user-img">
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
				<label for="address">Address</label>
				<form:input path="address" class="form-control" required="true" />
			</div>
			
			<div class="form-group">
				<label for="Password">Password</label>
				<form:input path="password" class="form-control" required="true" />
			</div>


			<input type="submit" value="save" class="btn btn-primary" />

		</form:form>

	</div>
	
</body>
</html>
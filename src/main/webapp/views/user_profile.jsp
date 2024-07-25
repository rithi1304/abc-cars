<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>User Profile Page</title>
<!--  Access the Static Resources without using spring URL -->
<link rel="stylesheet" href="/css/profile.css">

</head>

<body>

	<%@ include file="nav_bar.jsp"%>

	<div class="card main-profile">
		<h2>Your Profile</h2>
		<div class="profile1">
			<c:choose>
				<c:when test="${empty user.userphoto}">
					<img src="images/user_icon.jpg" alt="User Profile"  width="100" height="100">
				</c:when>
				<c:otherwise>
					<img src="/images/${user.userphoto}" width="100" height="100" alt="User Profile">
				</c:otherwise>
				
			</c:choose>
<hr align="center">
			<div class="name">${user.userName}</div>
		</div>

		<div class="sidenav-url">
			<sec:authorize access="isAuthenticated()">
				<div class="url">
					<form action="logout" method="post" style="padding: 7px;">
					  <input  type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" /> 
					   <input type="submit" name="Logout" value="Logout" class="btn btn-primary"></input>		
					</form>
		</div>
			</sec:authorize>
			<div class="url">
				<a href="/profile_edit?id=${user.id}">Edit</a>
			</div>
		</div>
	</div>
	<!-- End -->

	<!-- Main -->
	<div class="main">
		
		<div class="card">
			<div class="card-body">
				<i class="fa fa-pen fa-xs edit"></i>
				<table>
					<tbody>
						<tr>
							<td>Name</td>
							<td>${user.name}</td>
						</tr>
						<tr>
							<td>Phone</td>
							<td>${user.phone}</td>
						</tr>
						<tr>
							<td>Address</td>
							<td>${user.address}</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
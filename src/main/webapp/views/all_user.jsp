<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<script src="/js/custom.js"></script>
<title>User List Page</title>

<style>
.container-fluid {
	font-family: 'Poppins';
}

.text-center {
    margin-bottom: 20px;
}
.container-fluid .table {
	width: 80%;
	margin-left: 150px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}

.table tr:nth-child(even) {
    background-color: #f2f2f2;
}

.table tr:nth-child(odd) {
    background-color: #ffffff; 
}

.table .btn-info {
	border: none;
	border-radius: 15px;
	background-color: #2dc653;
	color:white;
}

.table .btn-info:hover {
    background-color: #6ede8a;
	color: white;
	transition: all ease 0.2s;
}

.table .btn-danger {
	margin-left: 10px;
	border: none;
	border-radius: 15px;
	background-color: #e01e37;
	color:white;
}

.table .btn-danger:hover {
    background-color: #ff4d6d;
	color: white;
	transition: all ease 0.2s;
}

</style>
</head>

<body>

	<%@ include file="nav_bar.jsp"%>

	<div class="container-fluid bg-1">
		<div>
			<h2 class="text-center">List Of Users Registered.</h2>
			<div class="row">
				<div class="col-md-12">
					<c:if test="${not empty userlists}">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Sno.</th>
									<th>User Photo</th>
									<th>Full Name</th>
									<th>User Name</th>
									<th>Phone</th>
									<th>Address</th>
									<th>Password</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<%
								int i = 1;
								%>
								<c:forEach var="user" items="${userlists}">

									<tr>
										<td><%=i%></td>
										<td>
											<c:choose>
												<c:when test="${empty user.userphoto}">
													<img src="images/user_icon.jpg" alt="User Profile"
														width="100" height="100">
												</c:when>
												<c:otherwise>
													<img src="/images/${user.userphoto}" width="100"
														height="100" alt="User Profile">
												</c:otherwise>
											</c:choose>
										</td>
										<td>${user.name}</td>
										<td>${user.userName}</td>
										<td>${user.phone}</td>
										<td>${user.address}</td>
										<td>${user.password}</td>

										<td><a href="/user_edit?id=${user.id}">
												<button class="btn btn-info">Edit</button>
										</a> <a href="/user_delete?id=${user.id}">
												<button class="btn btn-danger">Delete</button>
										</a></td>
									</tr>
									<%
									i++;
									%>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>

<head>

<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	 <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<title>Contact Us Page</title>

<style>
.jumbotron {
 		background-color: #e8f5ff !important;
 		font-family: 'Poppins';	
 }
 .form-control {
 font-family: 'Montserrat';
 font-size:15px;
 }
 .text-center {
  padding-left: 70px;
  font-family: 'Montserrat';
  color: #01497c;
 }
 .pull-right {
  margin-right: 667px;
 }
 .pull-right:hover {
 transition: all ease 0.3s;
 }
</style>

</head>

<body>

	<%@ include file="nav_bar.jsp"%>

	<!-- First Container -->
	<div class="container-fluid contactus">
		<div class="jumbotron">

				<div class="row">
					<h2 class="text-center">CONTACT FORM</h2>
				</div>
				
				<div class="row">
					<div class="col-sm-5">
						<p>We would love to hear from you! If you have any questions, feedback, or inquiries, feel free to get in touch with us.</p>
						<p>
							<span class="glyphicon glyphicon-map-marker"></span> Hyd, India
						</p>
						<p>
							<span class="glyphicon glyphicon-phone"></span> +91 2 123456
						</p>
						<p>
							<span class="glyphicon glyphicon-envelope"></span>
							inquiry@abcars.com
						</p>
					</div>
					<div class="col-sm-7 slideanim">
						<div class="row">
							<div class="col-sm-6 form-group">
								<input class="form-control" id="name" name="name"
									placeholder="Name" type="text" required>
							</div>
							<div class="col-sm-6 form-group">
								<input class="form-control" id="email" name="email"
									placeholder="Email" type="email" required>
							</div>
						</div>
						<textarea class="form-control" id="comments" name="comments"
							placeholder="Comment" rows="5"></textarea>
						<br>
						<div class="row">
							<div class="col-sm-12 form-group">
								<button class="btn btn-default pull-right" type="submit">Send</button>
							</div>
						</div>
					</div>
				</div>

		</div>
	</div>

<%@ include file="footer.jsp"%>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<title>Home Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	 <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
	<!--  Access the Static Resources without using spring URL -->
	<link rel="stylesheet" href="/css/main.css">
	<link rel="stylesheet" href="/css/home.css">
	
	<style>
		  a.btn  {
			border: none;
			background: black;
			padding: 30px:
			
		}
		  a.btn:hover {
			color: white;
			background: #B6BBCF;
			transition: all ease 0.3s;
		}
		
	</style>


</head>

<body class="bg">

    <%@ include file="nav_bar.jsp"%>

 <div id="Home" class="header section-padding-1">
      <div class="container  header-container flex-row">
       <div class="header-right">
          <img src="images/car-png-39068.png" alt="Photo of car" />
        </div>
        <div class="header-left flex-col">
          <h4>Want to profit by selling your car?</h4>
          <h1>
            <span>
              <span class="title-small">Start</span> your journey
              <span class="title-small">with ABC Cars. </span> Hit the road
              <span class="title-small"> in style.</span>
            </span>
          </h1>

          <a class="btn btn-primary" href="/register_form">
            Explore now.
          </a>
        </div>
      </div>
    </div>
	   
    
    <%@ include file="footer.jsp"%>

</body>
</html>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
	<title>About Us Page</title>
	
    <style>
    
 		.jumbotron {
 		background-color: #e8f5ff !important;
 		
 		}
 		
        .jumbotron .head {
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Poppins', sans-serif;
        }
        .jumbotron h3 {
            font-family: 'Poppins', sans-serif;
            color: #c9184a;
            font-size: 30px;
        }
        
        p {
            font-family: 'Montserrat';
        }

        .jumbotron .btn-primary {
       		padding: 15px;
            background-color: #03045e;
            color: white;
            margin-top: 50px;
            margin-left: 550px;
            font-family: 'Poppins',sans-serif;
            border-radius: 15px;
            border: none;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
       .jumbotron .btn-primary:hover {
            background-color: #e5989b;
            transition: all ease 0.3s;
        }
        
    </style>
</head>

<body>

    <%@ include file="nav_bar.jsp"%>

    <div class="container-fluid aboutus">
        <div class="jumbotron">
            <div class="head"><h2><b>Welcome to ABC Cars Pte Ltd.</b></h2></div>
            <p class="lead"> – your trusted destination for all your used car needs! At ABC Cars, we believe in
                providing a seamless and enjoyable experience for both buyers and sellers in the dynamic world of
                pre-owned vehicles.</p>

            <hr class="my-4">
            <h3>Our Vision:</h3>
            <p>Envisioned as a premier Used Car Sales Portal, ABC Cars aims to redefine the way you buy and sell cars.
                We strive to create a platform that not only connects buyers with their dream cars but also empowers
                sellers to showcase their vehicles with confidence.</p>

            <hr class="my-5">
            <h3>Who we are:</h3>
            <p>ABC Cars Pte Ltd is a team of dedicated professionals committed to revolutionizing the used car market.
                With a passion for technology and a deep understanding of the automotive industry, we bring you a
                user-friendly portal that caters to the diverse needs of car enthusiasts and sellers alike.</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="/register_form" role="button">Join Us Now!</a>
            </p>
        </div>
    </div>

    <%@ include file="footer.jsp"%>

</body>

</html>

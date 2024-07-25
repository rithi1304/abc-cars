<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Privacy Policy</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1, h2, h3 {
            color: #333;
        }

        p {
            line-height: 1.6;
            color: #555;
        }

        .section {
            margin-bottom: 20px;
        }

        .btn-container {
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<%@ include file="nav_bar.jsp"%>


    <header>
        <h1>Privacy Policy</h1>
    </header>

    <div class="section">
        <h2>1. Introduction</h2>
        <p>This Privacy Policy describes how we collect, use, and disclose your personal information when you use our website or services.</p>
    </div>

    <div class="section">
        <h2>2. Information We Collect</h2>
        <p>We may collect information such as...</p>
    </div>

    <!-- Add more detailed sections -->

    <div class="section">
        <h2>3. How We Use Your Information</h2>
        <p>We use your information for...</p>
    </div>

    <!-- Add more detailed sections -->

    <div class="section">
        <h2>4. Your Choices and Controls</h2>
        <p>You can control...</p>
    </div>

    <!-- Add more detailed sections -->

    <div class="section">
        <h2>5. Security Measures</h2>
        <p>We take the following security measures to protect your information...</p>
    </div>

    <!-- Add more detailed sections -->

    <div class="section">
        <h2>6. Changes to This Privacy Policy</h2>
        <p>We may update our Privacy Policy...</p>
    </div>

    <!-- Add more detailed sections -->

    <div class="section">
        <h2>7. Contact Us</h2>
        <p>If you have any questions about this Privacy Policy, please contact us at:</p>
        <address>
            Your Company Name<br>
            Street Address<br>
            City, State, ZIP<br>
            Email: info@example.com
        </address>
    </div>

    <div class="btn-container">
        <a class="btn" href="#section1">Section 1</a>
        <a class="btn" href="#section2">Section 2</a>
        <!-- Add more buttons for other sections -->
    </div>
    	<%@ include file="footer.jsp"%>

</body>
</html>

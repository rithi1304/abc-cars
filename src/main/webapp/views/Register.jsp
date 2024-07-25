<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page isELIgnored="false"%>

<html>

<head>
<title>Register Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/sign_up.css">

<style>
.contact .form .field input{
border: none;
}

</style>

</head>

	<body>

		<%@ include file="nav_bar.jsp"%>
		
 <div id="Contact" class="contact flex-col container section-padding-2">
      <div class="title">
      <c:if test="${register_success != null}">
					<div class="alert alert-success">
						<p>${register_success}
							Click <a href="login"> Sign In</a> to use our portal...
						</p>
					</div>
				</c:if>
        <h2>Sign up</h2>
      </div>

<form:form action="register_process" method="post" modelAttribute="user">
      <div class="form">
        <div class="field">
         <label for="name"><b>Enter your full name</b></label> 
					<form:input path="name" placeholder="Enter your full name" required="true" /> 
        </div>

        <div class="field">
         <label for="userName"><b>Username</b></label> 
					<form:input path="userName" minlength="3" maxlength="13"  placeholder="Enter Username" required="true" /> 

        </div>

        <div class="field">
         <label for="Phone"><b>Phone</b></label> 
					<form:input path="phone" placeholder="Enter Phone number" required="true" />

        </div>

        <div class="field">
         <label for="address"><b>Address</b></label> 
					<form:input path="address" placeholder="Enter Address" required="true" />
					
        </div>

        <div class="field">
          <label for="psw"><b>Password</b></label> 
					<form:input path="password" placeholder="Enter your password" required="true" />
					
        </div>

        <div class="field">
        </div>

        <div class="field accept">
          <input type="checkbox" id="accept" />
          <label class="extra-small" for="accept">
            I accept the terms
          </label>
        </div>
        <input type="submit" value="Register" />
      </div>
      
</form:form>
    </div>

		<%@ include file="footer.jsp"%>
</body>
</html>

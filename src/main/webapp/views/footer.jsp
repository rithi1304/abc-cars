<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/main_navbar.css">

<style>

.footer {
	background-color: var(--bg-color);
	font-family: 'Montserrat';
}

.footer-con {
	display: flex;
	flex-direction: column;
	gap: calc(1vw + 1em); 
}

ul {
   list-style-type: none;
	}
	
.above-footer {
	display:flex;
}


.above-footer .logo img {
	width: 120px;
}

.above-footer .links {
    display: flex;
}

.above-footer .links li {
	padding-top: 40px;
	padding-left: 20px;
}

.above-footer .links li a {
	font-size: var(--extra-samll-font-size);
}


.social {
	gap: calc(1.2vw + 0.2rem);
}

.social svg {
	height: 33px;
	cursor: pointer;
}

.below-footer {
	justify-content: space-between;
	flex-wrap: wrap;
}

.below-footer p, .below-footer .links a {
	color: var(--heading-color);
	font-size: var(--extra-samll-font-size);
	margin-left:20px;
}

.below-footer .links {
	gap: 1.8em;
	flex-wrap: wrap;
}

.line {
	background-color: rgba(40, 41, 56, 0.55);
	height: 1.33px;
	width: 100%;
}

@media screen and (max-width: 960px) {
	.above-footer .links {
		gap: calc(2vw + 0.3rem);
	}
}

@media screen and (max-width: 590px) {
	.above-footer {
		flex-direction: column;
		gap: calc(2vw + 1rem);
	}
	.above-footer .links {
		flex-direction: column;
	}
	.below-footer {
		flex-direction: column-reverse;
		gap: calc(2vw + 1rem);
	}
}
</style>

</head>
<body>

	<div class="footer">
		<div class="footer-con container section-padding-3">
			<div class="above-footer flex-row">
				<a class="logo flex-row"> <img src="/images/logo-transparent-png.png" alt="Logo" /></a>
				<ul class="links flex-row">
					<li><a class="link" href="/home">Home</a></li>
					<li><a class="link" href="/aboutUs">About us</a></li>
					<li><a class="link" href="/contactUs">Contact us</a></li>
				</ul>
			</div>

			<div class="line"></div>

			<div class="below-footer flex-row">
				<div class="links flex-row">
					<a href="/privarcy">Privacy Policy</a> <a href="#">Terms of Service</a> <a
						href="#">Cookies Settings</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

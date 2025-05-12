<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Σύνδεση Χρήστη | MedicalAppointments</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" href="main_styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="Ραντεβού Clinic: Διαχειριστείτε ραντεβού, εγγραφές ιατρών και ασθενών εύκολα και γρήγορα.">
<meta name="keywords" content="Ραντεβού Clinic, διαχείριση ιατρών, εγγραφή ασθενών, ιατρικό dashboard, υγεία">
<meta name="robots" content="index, follow">
<meta http-equiv="content-language" content="el">
<meta name="geo.region" content="GR">
<meta name="geo.placename" content="Greece">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Ραντεβού Clinic - Διαχείριση Ιατρών & Ασθενών">
<meta name="twitter:description" content="Εύκολη διαχείριση ραντεβού και εγγραφών για ιατρούς και ασθενείς.">
<meta name="twitter:image" content="https://www.rantevouclinic.gr/images/logo.jpg">
<meta name="twitter:site" content="@RantevouClinic">



<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Cascadia+Code:ital,wght@0,200..700;1,200..700&family=Comfortaa:wght@300..700&family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
	rel="stylesheet">

<style type="text/css">
.bg-primary {
	background-color: #6556FE !important;
}


.comfortaa-<uniquifier> {
  font-family: "Comfortaa", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
}


::selection {
	background-color: #6556FE;
	color: white;
}

.form-control:focus::placeholder {
	color: white;
}

.form-control:hover::placeholder {
	color: white;
}

.form-control::placeholder {
	transition: all 90ms;
}

#main_logo {
	transition: all 90ms ease-in;
}

#main_logo:hover {
	opacity: 0.7;
	scale: 1.05;
	cursor: pointer;
		transition: all 90ms ease-out;
}
body {
	opacity: 0;
	transition: opacity 0.8s ease-in;
}

body.loaded {
	opacity: 1;
}
body {
	background: linear-gradient(-45deg, #6556FE 0%, #aba4f5 35%, #6556FE 70%);
	background-size: 400% 400%;

	animation: gradient 8s ease infinite;
	height: 100vh;
	font-family: 'Comfortaa', sans-serif;
	
}

@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}
input[type=text] {

    background-color: white;
    background-image: url('person-fill.svg');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding-left:  35px;
    opacity: 0.8;
}

input[type=password] {

    background-color: white;
    background-image: url('shield-lock.svg');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding-left:  35px;
    opacity: 0.8;
}

/* Animations */

@keyframes spin {
  
  from {
    transform: rotate( 0deg );
  }
  
  to {
    transform: rotate( 360deg );
  }
}

/* Global */

html {

  overflow: hidden;
}



/* Space */

.space {
  position: absolute;
  width: 400vw;
  height: 400vh;
  top: 50%;
  left: 50%;
  margin-top: -200vh;
  margin-left: -200vw;
  animation: spin 240s linear infinite;
  background-size: 240px;
  backface-visibility: visible;
  
  /* Had to base64 SVG background for FF compatibility */
  background-image: url(data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8yIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDI0MCAyNDAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDI0MCAyNDAiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxyZWN0IHg9IjEwNiIgeT0iOTAiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIyIiBoZWlnaHQ9IjIiLz48cmVjdCB4PSI3NCIgeT0iNjMiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIyMyIgeT0iNjYiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSI1MCIgeT0iMTEwIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iNjMiIHk9IjEyOCIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjxyZWN0IHg9IjQ1IiB5PSIxNDkiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSI5MiIgeT0iMTUxIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iNTgiIHk9IjgiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIxNDciIHk9IjMzIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMiIgaGVpZ2h0PSIyIi8+PHJlY3QgeD0iOTEiIHk9IjQzIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iMTY5IiB5PSIyOSIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjxyZWN0IHg9IjE4MiIgeT0iMTkiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIxNjEiIHk9IjU5IiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iMTM4IiB5PSI5NSIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjxyZWN0IHg9IjE5OSIgeT0iNzEiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIzIiBoZWlnaHQ9IjMiLz48cmVjdCB4PSIyMTMiIHk9IjE1MyIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjIiIGhlaWdodD0iMiIvPjxyZWN0IHg9IjEyOCIgeT0iMTYzIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iMjA1IiB5PSIxNzQiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIxNTIiIHk9IjIwMCIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjxyZWN0IHg9IjUyIiB5PSIyMTEiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIyIiBoZWlnaHQ9IjIiLz48cmVjdCB5PSIxOTEiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIxMTAiIHk9IjE4NCIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjwvc3ZnPg==);
}

@keyframes fadeInUp {
  0% {
    transform: translateY(100%);
    opacity: 0;
  }
  100% {
    transform: translateY(0%);
    opacity: 1;
  }
}

#login_but {
	transition: all 90ms ease-in;
	outline: solid #6556FE;
}

#login_but:hover {
	color: white;
	scale: 1.03;
	background-color: #1b1744;
		outline: solid #1b1744;
			transition: all 90ms ease-out;

}

.sticky-bottom {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  z-index: 9999;
 /* Makes sure it's on top of everything else */

}
a {
	text-decoration: none !important;
	color: white;
	transition: all 90ms ease-in;
}
a:hover {

	opacity:0.7;
	transition: all 90ms ease-out;
}
</style>
<script type="text/javascript" src="js/jquery.1.11.1.js"></script>
<script>
	window.addEventListener('load', function() {
		document.body.classList.add('loaded');
	});
</script>
</head>
<body class="bg-light">
<div class="space">

</div>

	<div class="d-flex align-items-center  vh-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-7">
					<div class="card  shadow p-2 rounded-5">
						<div class="row justify-content-center">
							<div class="col-auto">
								<img id="main_logo" onclick="location.reload();"
									src="png_doctor_app_logo.png" alt="Doctor App Logo"
									class="img-fluid p-3" style="width: 150px;">
							</div>
						</div>
						<div
							class="card-header  bg-primary text-center text-white shadow rounded-4"
							style="	background: linear-gradient(-55deg, #aba4f5 0%, #6556FE 35%,#6556FE 65%,#aba4f5 100%);
							text-shadow: 0 0 10px #1b1744, 0 0 20px #1b1744;">
							<div class="fs-4">
								<b>Σύνδεση</b> Χρήστη
							</div>
						</div>
						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="mb-3">
									<label class="form-label">Όνομα Χρήστη *</label> <input
										type="text" name="username" class="form-control rounded-4"
										required placeholder="Όνομα Χρήστη">
								</div>
								<div class="mb-4">
									<label class="form-label">Κωδικός *</label> <input
										type="password" name="password" class="form-control rounded-4"
										required placeholder="Κωδικός">
								</div>
								<div class="row justify-content-center">
									<div class="col-12">
										<button id="login_but" type="submit"
											class="btn text-center shadow rounded-5 w-100">
											<b>ΣΥΝΔΕΣΗ</b>
										</button>
									</div>
								</div>
							</form>

							<%

							if (request.getParameter("error") != null) {
							%>
							<div class="alert alert-danger mt-3">Λάθος στοιχεία!
								Προσπάθησε ξανά.</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			<div class=" text-center text-white mt-5 mb-3">
				<div class="fs-6">© 2025 Filippos Obrijanu. All rights
					reserved.</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-auto">
					<img
						src="unipi_logo1.png" alt="Doctor App Logo"
						class="img-fluid" style="width: 60px;">
				</div>
			</div>
			
			<div class=" sticky-bottom">
			<div class="row text-white justify-content-center p-3" style="background-color: #1b1744; font-size: 0.8rem;">
					<div class="col-auto">
					<div><a href="https://www.unipi.gr">Unipi Website</a></div>
					</div>
					<div class="col-auto">
					<div><a href="contact.jsp">Επικοινωνία</a></div>
					</div>
				</div>
			</div>
			</div>
			
		</div>
<script src="preventRightClick.js"></script>

</body>
</html>
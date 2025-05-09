<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page session="true"%>

<html>
<head>

<title>Τα Ραντεβού Μου | Ραντεβού Clinic</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="shortcut icon" href="favicon.ico" />

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
::selection {
	background-color: #6556FE;
	color: white;
}

.bg-primary {
	background-color: #6556FE !important;
}

.comfortaa-
























<
uniquifier
>
{
font-family
























:












 












"
Comfortaa
























"
,
sans-serif
























;
font-optical-sizing
























:












 












auto
























;
font-weight
























:












 












<
weight
>
;
font-style
























:












 












normal
























;
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
	background-image:
		url(data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8yIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDI0MCAyNDAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDI0MCAyNDAiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxyZWN0IHg9IjEwNiIgeT0iOTAiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIyIiBoZWlnaHQ9IjIiLz48cmVjdCB4PSI3NCIgeT0iNjMiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIyMyIgeT0iNjYiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSI1MCIgeT0iMTEwIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iNjMiIHk9IjEyOCIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjxyZWN0IHg9IjQ1IiB5PSIxNDkiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSI5MiIgeT0iMTUxIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iNTgiIHk9IjgiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIxNDciIHk9IjMzIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMiIgaGVpZ2h0PSIyIi8+PHJlY3QgeD0iOTEiIHk9IjQzIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iMTY5IiB5PSIyOSIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjxyZWN0IHg9IjE4MiIgeT0iMTkiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIxNjEiIHk9IjU5IiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iMTM4IiB5PSI5NSIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjxyZWN0IHg9IjE5OSIgeT0iNzEiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIzIiBoZWlnaHQ9IjMiLz48cmVjdCB4PSIyMTMiIHk9IjE1MyIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjIiIGhlaWdodD0iMiIvPjxyZWN0IHg9IjEyOCIgeT0iMTYzIiBmaWxsPSIjRkZGRkZGIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIi8+PHJlY3QgeD0iMjA1IiB5PSIxNzQiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIxNTIiIHk9IjIwMCIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjxyZWN0IHg9IjUyIiB5PSIyMTEiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIyIiBoZWlnaHQ9IjIiLz48cmVjdCB5PSIxOTEiIGZpbGw9IiNGRkZGRkYiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiLz48cmVjdCB4PSIxMTAiIHk9IjE4NCIgZmlsbD0iI0ZGRkZGRiIgd2lkdGg9IjEiIGhlaWdodD0iMSIvPjwvc3ZnPg==);
}

.btn {
	outline: solid #6556FE;
	transition: all 90ms ease-in;
}

.btn:hover {
	color: white;
	scale: 1.02;
	background-color: #1b1744;
	outline: solid #1b1744;
	transition: all 90ms ease-out;
}

#backbtn {
	transition: all 90ms;
	background-color: #1b1744;
	color: white;
	outline: none;
	transition: all 90ms ease-in;
}

a {
	text-decoration: none !important;
	color: white;
	transition: all 90ms ease-in;
}

#backbtn:hover {
	background-color: white;
	color: black;
	outline: solid #6556FE;
	transition: all 90ms ease-out; a { outline : none;
	color: black;
	transition: all 90ms ease-out;
}
}
</style>
<script>
	window.addEventListener('load', function() {
		document.body.classList.add('loaded');
	});
</script>
   <script>
        window.addEventListener('load', function() {
            fetch('ViewAppointmentsServlet')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('appointmentsList').innerHTML = data;
                })
                .catch(error => {
                    console.error('Σφάλμα κατά τη φόρτωση των ραντεβού:', error);
                    document.getElementById('appointmentsList').innerHTML = '<li class="list-group-item rounded-4 shadow-sm mb-2 text-danger">Υπήρξε σφάλμα κατά τη φόρτωση των ραντεβού.</li>';
                });
            document.body.classList.add('loaded');
        });
    </script>
</head>
<body class="bg-light">
<div class="space"></div>

<div class="d-flex align-items-center vh-100">
		<div class="container mt-5">
			<div class="card shadow p-4 rounded-5">
				<div class="d-flex justify-content-end">
				<a href="dashboard.jsp">
					<button id="backbtn" class="btn  text-center shadow rounded-5 mb-3 "
						style="width: 8rem;">
						 <b>ΠΙΣΩ</b>
						
					</button>
					</a>
				</div>

				<div class="alert text-white shadow rounded-4 fs-4"
					style="background: linear-gradient(55deg, #6556FE 0%, #6556FE 25%, #aba4f5 45%);  text-shadow: 0 0 10px #1b1744, 0 0 20px #1b1744;">
					<b>Τα Ραντεβού μου</b>


				</div>
            <ul id="appointmentsList" class="list-group mt-3">
                <li class="list-group-item rounded-4 shadow">Φόρτωση ραντεβού...</li>
            </ul>
			    


			</div>
			<div class=" text-center text-white mt-5 mb-3">
				<div class="fs-6">© 2025 Filippos Obrijanu. All rights
					reserved.</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-auto">
					<img src="unipi_logo1.png" alt="Doctor App Logo" class="img-fluid"
						style="width: 60px;">
				</div>
			</div>
		</div>
	</div>
	<script>
  document.addEventListener('contextmenu', function(e) {
    e.preventDefault();

  });
</script>
</body>
</html>

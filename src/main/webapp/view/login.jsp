<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>

<!-- AdminLTE 3 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/admin-lte@3.1.0/dist/css/adminlte.min.css">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body class="hold-transition login-page">
	<div class="login-box">

		<div class="card card-outline card-primary">
			<div class="card-header text-center">
				<p class="h1">
					<b>Chaucherita</b>
				</p>
				<div>
					<img src="../imgs/Logo.jpg" alt="" width="100" height="100"
						style="visibility: hidden;">
				</div>
			</div>
			<div class="card-body">
				<form action="../LoginController?rute=login" method="post">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Usuario"
							name="username">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="Clave"
							name="password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">

						<div class="col-12">
							<button type="submit" class="btn btn-primary btn-block">Iniciar
								sesion</button>
						</div>

					</div>
				</form>


				<p class="mb-0 text-center">
					<a href="../LoginController?rute=newPerson">Registrarse</a>
				</p>
			</div>

		</div>

	</div>
</body>


</html>
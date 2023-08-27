<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Dashboard</title>

<!-- AdminLTE 3 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/admin-lte@3.1.0/dist/css/adminlte.min.css" />

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>

<body class="hold-transition sidebar-mini dark-mode">
	<div class="wrapper">
		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-dark">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#"><i class="fas fa-bars"></i></a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<a href="#" class="brand-link text-center"> <span
				class="brand-text font-weight-light">Chaucherita <i
					class="fa-solid fa-dollar-sign"></i>
			</span>
			</a>
			<hr />
			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-credit-card"></i>
								<p>Cuentas</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-coins"></i>
								<p>Movimientos</p>
						</a></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Lista de cuentas</h1>
						</div>
					</div>
				</div>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid py-2">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#exampleModal">Agregar cuenta</button>
				</div>

				<div class="container-fluid">
					<div class="row">
						<c:forEach items="${accounts}" var="account">
							<div class="col-md-4">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">${account.name}</h5>
										<p class="card-text">$ ${account.money}</p>
										<a href="AccountManagerController?rute=newMovement"
											class="btn btn-primary">Crear movimiento</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Versión</b> 1.0.0
			</div>
			<strong>&copy; 2023 Chaucherita</strong>
		</footer>
	</div>
	<!-- ./wrapper -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Agregar cuenta</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AccountManagerController?rute=saveAccount"
						method="post" autocomplete="off">
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="Nombre de cuenta" name="name" />
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-user"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="Numero de cuenta" name="number" />
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-address-card"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="Dinero de cuenta" name="money" />
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-money-bill"></span>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">Aceptar</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">
								Cancelar</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE 3 -->
	<script
		src="https://cdn.jsdelivr.net/npm/admin-lte@3.1.0/dist/js/adminlte.min.js"></script>
</body>
</html>

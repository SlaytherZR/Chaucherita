<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>

<!-- AdminLTE 3 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/admin-lte@3.1.0/dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">


<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body class="hold-transition sidebar-mini dark-mode">
	<div class="wrapper">
		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-dark">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#">Home <span
						class="sr-only">(current)</span></a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item mr-3">Usuario: <c:out
						value="${userLoggedIn.name}" /></li>
				<li class=""><a href="LoginController?rute=logout">Salir</a></li>
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
			<hr>
			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item"><a
							href="AccountManagerController?rute=dashboard" class="nav-link">
								<i class="nav-icon fas fa-credit-card"></i>
								<p>Cuentas</p>
						</a></li>
						<li class="nav-item"><a
							href="AccountManagerController?rute=listMovements"
							class="nav-link"> <i class="nav-icon fas fa-coins"></i>
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
							<h1>Lista de movimientos</h1>
						</div>
					</div>
				</div>
			</section>


			<!-- Main content -->
			<section class="content">

				<div class="container-fluid mb-3">
					<div class="row">
						<div class="col-4">
							<form action="AccountManagerController?rute=listByMonth"
								method="post">
								<select name="month" class="form-control" required>
									<option value="">Selecionar mes</option>
									<option value="1">Enero</option>
									<option value="2">Febrero</option>
									<option value="3">Marzo</option>
									<option value="4">Abril</option>
									<option value="5">Mayo</option>
									<option value="6">Junio</option>
									<option value="7">Julio</option>
									<option value="8">Agosto</option>
									<option value="9">Septiembre</option>
									<option value="10">Octubre</option>
									<option value="11">Noviembre</option>
									<option value="12">Diciembre</option>
								</select> <span>
									<button type="submit" class="btn btn-primary mt-4">Aplicar
										Filtro</button>
								</span>
							</form>
						</div>
						<div class="col-4">
							<form action="AccountManagerController?rute=listByAccount"
								method="post">
								<select name="account" class="form-control" required>
									<option value="">Selecionar cuenta</option>

									<c:forEach items="${accounts}" var="account">
										<option value="${account.id}">${account.name}</option>>
								</c:forEach>
								</select> <span>
									<button type="submit" class="btn btn-primary mt-4">Aplicar
										Filtro</button>
								</span>
							</form>
						</div>
						<div class="col-4">
							<form action="AccountManagerController?rute=listByCategory"
								method="post">
								<select name="category" class="form-control" required>
									<option value="">Selecionar catergoría</option>
									<option value="Income">Ingreso</option>
									<option value="Expense">Gasto</option>
								</select> <span>
									<button type="submit" class="btn btn-primary mt-4">Aplicar
										Filtro</button>
								</span>
							</form>
						</div>
					</div>

				</div>

				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<table id="example1"
										class="table table-bordered table-striped ">
										<thead>
											<tr>
												<th>Id</th>
												<th>Cantidad</th>
												<th>categoría</th>
												<th>fecha</th>
												<th>Descripción</th>
												<th>Cuenta</th>
											</tr>
										</thead>
										<tbody>


											<c:forEach items="${movements}" var="movement">

												<tr>
													<td scope="row" class="text-center">${movement.id}</td>
													<td class="text-center">${movement.amount}</td>
													<td class="text-center">${movement.category}</td>
													<td class="text-center">${movement.date}</td>
													<td class="text-center">${movement.description}</td>
													<td class="text-center">${movement.account.name}</td>
												</tr>

											</c:forEach>


										</tbody>
									</table>
								</div>

							</div>
						</div>
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
					<form action="" method="post" autocomplete="off">
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="Nombre de cuenta" name="username">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-user"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="Numero de cuenta" name="password">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-address-card"></span>
								</div>
							</div>
						</div>
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="Dinero de cuenta" name="password">
							<div class="input-group-append">
								<div class="input-group-text">
									<span class="fas fa-money-bill"></span>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success">Aceptar</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
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
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
</body>

</html>
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
			<hr />
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

										<button class="btn btn-primary" data-toggle="modal"
											data-target="#exampleModal2" data-id="${account.id}">Crear
											movimiento</button>
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


	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Agregar
						Movimiento</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- cantidad, categoría, fecha, descripción y cuenta -->
					<form action="AccountManagerController?rute=saveMovement"
						method="post" autocomplete="off">
						<input type="hidden" id="accountId" name="accountId">
						<div class="input-group mb-3">
							<input name="amount" type="text" class="form-control"
								placeholder="Cantidad">
						</div>
						<div class="input-group mb-3">
							<input name="description" type="text" class="form-control"
								placeholder="Descripción">
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="category"
								id="flexRadioDefault1" value="Ingreso"> <label
								class="form-check-label" for="flexRadioDefault1">
								Ingreso</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="category"
								id="flexRadioDefault2" value="Gasto"> <label
								class="form-check-label" for="flexRadioDefault2">Gasto</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="category"
								id="flexRadioDefault3" value="Transferencia"><label
								class="form-check-label" for="flexRadioDefault3">
								Transferencia</label>
						</div>
						<div class="input-group mb-3" id="tranfer"
							style="visibility: hidden;">
							<select name="idDestinationAccount" class="form-control">
								<option value="">Selecionar destino</option>

								<c:forEach items="${accounts}" var="account">
									<c:if test="${account.id != accountId}">
										<option value="${account.id}">${account.name}</option>>
									</c:if>
								</c:forEach>


							</select>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">Aceptar</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
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

	<script>
		$(document).ready(
				function() {
					// Capturar el clic del botón en cada tarjeta de cuenta
					$('.btn-primary[data-target="#exampleModal2"]').on('click',
							function() {
								// Obtener el ID de la cuenta desde el atributo data-id
								var accountId = $(this).data('id');

								// Actualizar el valor del campo oculto en el modal
								$('#accountId').val(accountId);

								// Restablecer las opciones del formulario (si es necesario)
								// Esto podría incluir establecer valores predeterminados y limpiar campos

								// Mostrar el modal
								$('#exampleModal2').modal('show');
							});

					// Agregar un oyente de eventos para cambiar la visibilidad del campo de transferencia
					$('input[name="flexRadioDefault"]').on('change',
							function() {
								if (this.id === 'flexRadioDefault3') {
									$('#tranfer').css('visibility', 'visible');
								} else {
									$('#tranfer').css('visibility', 'hidden');
								}
							});
				});
	</script>
	<script>
		$(document).ready(
				function() {
					const transferCheckbox1 = document
							.getElementById("flexRadioDefault1");
					const transferCheckbox2 = document
							.getElementById("flexRadioDefault2");
					const transferCheckbox3 = document
							.getElementById("flexRadioDefault3");

					transferCheckbox3.addEventListener("change", function() {
						const transferSelect = document
								.getElementById("tranfer");
						if (this.checked) {
							transferSelect.style.visibility = "visible";
						} else {
							transferSelect.style.visibility = "hidden";
						}
					});

					transferCheckbox1.addEventListener("change", function() {
						const transferSelect = document
								.getElementById("tranfer");
						transferSelect.style.visibility = "hidden";

					});

					transferCheckbox2.addEventListener("change", function() {
						const transferSelect = document
								.getElementById("tranfer");
						transferSelect.style.visibility = "hidden";

					});

				});
	</script>
</body>
</html>

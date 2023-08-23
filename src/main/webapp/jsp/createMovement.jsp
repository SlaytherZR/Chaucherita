<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Movimiento</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous"/>
    <!--<link
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css"
        /> -->
    <link rel="stylesheet" href="../styles/styles.css"/>
    <script>
        function toggleSelect() {
            var selectElement = document.getElementById("selectTransf");
            var radioElement = document.getElementById("radioTransferencia ");

            selectElement.disabled = !radioElement.checked;
        }
    </script>
</head>
<body>
<div class="container-fluid ">
    <div class="row">
        <div class="col-2 d-flex align-items-center justify-content-center colorMI border border-black full-height">
            <!-- Contenido centrado vertical y horizontalmente en la primera columna -->
            <div class="colorBtn confBtn" disabled>Crear Movimiento</div>
        </div>
        <div class="col-10">
            <!-- Contenido de la segunda columna dividido en 3 filas -->
            <!-- Header -->
            <div class="row">
                <div class="col-10 d-flex justify-content-around">
                    <!-- Header -->
                    <img src="../imgs/Logo.jpg" alt="logoChau" class="logos">
                    <div>
                        <span>Usuario: <c:out value="${userLoggedIn.name}"/></span> <img
                            src="../imgs/Usuario.png" alt="logoUser" class="logos">
                    </div>
                </div>
                <div class="col-2 d-flex align-items-center">
                    <a class="no-underline colorBtn confBtn">Regresar</a>
                </div>
            </div>
            <!-- FORMULARIO -->
            <div class="row">
                <form class="col-10" action="AccountManagerController?rute=saveMovement"
                      method="POST">
                    <div class="row">
                        <div class="col"></div>
                        <div class="col border border-black">
                            <!-- Combo Box -->
                            <div class="text-center">
                                <h3>Elija una opcion</h3>
                                <div class="">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio"
                                               name="flexRadioDefault" id="radioGasto" checked> <label
                                            class="form-check-label" for="radioGasto">Gasto</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio"
                                               name="flexRadioDefault" id="radioIngreso"> <label
                                            class="form-check-label" for="radioIngreso">Ingreso</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio"
                                               name="flexRadioDefault" id="radioTransferencia"
                                               onchange="toggleSelect()"> <label
                                            class="form-check-label" for="radioTransferencia">Transferencia</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col"></div>
                    </div>

                    <div class="row">
                        <div class="col contBody border border-black">
                            <!-- Contenido -->
                            <div class="contBody2">
                                <h3>Información de la Cuenta</h3>
                                <div class="contLog">
                                    <div class="d-flex inputConf2">
                                        <span class="m-3">Cantidad: </span> <input type="text"
                                                                                   class="inputConf p-2 ms-2 colorMI"
                                                                                   id="cantidad" name="money"
                                                                                   placeholder="Digite la cantidad...">
                                    </div>

                                    <div class="d-flex inputConf2">
                                        <div class="row align-items-center">
                                            <span class="col m-2">Cuenta de Destino: </span>
                                            <div class=" col d-flex align-items-center">
                                                <c:forEach items="${accounts}" var="account">
                                                    <select class="col-12" id="selectTransf" disabled>
                                                        <option value="${account.id}">${account.name}</option>
                                                    </select>
                                                </c:forEach>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="d-flex inputConf2">
                                        <span class="m-3">Descripcion:</span> <input type="text"
                                                                                     class="inputConf p-2 ms-2 colorMI"
                                                                                     id="descripcion"
                                                                                     name="description"
                                                                                     placeholder="Mensaje de descripcion...">
                                    </div>
                                    <input type="submit" class="no-underline colorBtn confBtn confBtn2"
                                           value="Crear Movimiento">
                                </div>

                            </div>
                        </div>


                    </div>
                </form>
                <!-- FOOTER -->
                <div class="row">
                    <div class="col">
                        <span class="d-flex justify-content-center">Integrantes:</span>
                        <ul class=" d-flex justify-content-around mb-0">
                            <li class="list-inline-item">Rafael Piedra</li>
                            <li class="list-inline-item">Revelo Kevin</li>
                            <li class="list-inline-item">Torres Jeremy</li>
                            <li class="list-inline-item">Slayther Zamora</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    toggleSelect();
</script>

</body>
</html>
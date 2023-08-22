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
            crossorigin="anonymous"
    />
    <!--<link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/styles.css"
    /> -->
    <link rel="stylesheet" href="../styles/styles.css" />
    <script>
        function toggleSelect() {
            var selectElement = document.getElementById("selectTransf");
            var radioElement = document.getElementById("radioTransferencia ");

            selectElement.disabled = !radioElement.checked;

        }
    </script>

</head>
<body>
<body>
<div class="container-fluid ">
    <div class="row">
        <div class="col-2 d-flex align-items-center justify-content-center colorMI border border-black full-height">
            <!-- Contenido centrado vertical y horizontalmente en la primera columna -->
            <button class="btn btn-secondary colorBtn confBtn">Crear Movimiento</button>
        </div>
        <div class="col-10">
            <!-- Contenido de la segunda columna dividido en 3 filas -->
            <div class="row">
                <div class="col d-flex justify-content-around">
                    <!-- Header -->
                    <img src="../imgs/Logo.jpg" alt="logoChau" class="logos">
                    <div>
                        <span>Usuario: ...</span>
                        <img src="../imgs/Usuario.png" alt="logoUser" class="logos">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col"></div>
                <div class="col border border-black">
                    <!-- Combo Box -->
                    <div class="text-center">
                        <h3>Elija una opcion</h3>
                        <div class="">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="radioGasto" checked>
                                <label class="form-check-label" for="radioGasto">Gasto</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="radioIngreso" >
                                <label class="form-check-label" for="radioIngreso">Ingreso</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="radioTransferencia" onchange="toggleSelect()">
                                <label class="form-check-label" for="radioTransferencia">Transferencia</label>
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
                                <span class="m-3">Cantidad: </span>
                                <input type="text" class="inputConf p-2 ms-2 colorMI" id="cantidad" name="cantidad" placeholder="Digite la cantidad...">
                            </div>

                            <div class="d-flex inputConf2">
                                <div class="row align-items-center">
                                    <span class="col m-2">Cuenta de Destino: </span>
                                    <div class=" col d-flex align-items-center">

                                        <select class="col-12" id="selectTransf" disabled>
                                            <option value="opcion1">Cuenta 1</option>
                                            <option value="opcion2">Cuenta 2</option>
                                            <option value="opcion3">Cuenta 3</option>
                                        </select>

                                    </div>
                                </div>

                            </div>
                            <div class="d-flex inputConf2">
                                <span class="m-3">Descripcion:</span>
                                <input type="text" class="inputConf p-2 ms-2 colorMI" id="descripcion" name="descripcion" placeholder="Mensaje de descripcion...">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    toggleSelect();
</script>

</body>
</html>
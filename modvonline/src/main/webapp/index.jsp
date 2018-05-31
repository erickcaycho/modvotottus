<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <html lang="es">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge">

            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="icon" href="./assets/favicon.ico">

            <title>Sigesu - Tottus</title>

            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                crossorigin="anonymous">

            <!-- Custom styles for this template -->
            <link href="./assets/css/main.css" rel="stylesheet">
        </head>

        <body>
            <nav class="navbar navbar-dark fixed-top flex-md-nowrap p-0 shadow">
                <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">
                    <img src="./assets/images/logo-tottus.png" width="105px" height="24px" />
                </a>
                <div class="navbar-title">Sistema de Gestion de Supermercados</div>
                <ul class="navbar-nav px-3">
                    <li class="nav-item text-nowrap">
                        <a class="nav-link" href="#">Usuario: karencita</a>
                    </li>
                </ul>
            </nav>

            <div class="container-fluid">
                <div class="row">
                    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                        <div class="sidebar-sticky">
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">
                                        <span data-feather="home"></span>
                                        Ventas
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <span data-feather="file"></span>
                                        Apertuta / Cierre Caja
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <span data-feather="shopping-cart"></span>
                                        Venta Presencial
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <span data-feather="users"></span>
                                        Anomalías de Caja
                                    </a>
                                </li>
                            </ul>


                        </div>
                    </nav>

                    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                        <!--  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                      <h1 class="h2">Paleta de Colores</h1>
                      <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-1">
                          <button class="btn btn-sm btn-outline-secondary btn-primary">Buscar</button>
                        </div>
                      </div>
                    </div>
                    <div class="color-E1E03F">#E1E03F</div>
                    <div class="color-417505">#417505</div>
                    <div class="color-89AC62">#89AC62</div>
                    <div class="color-78B800">#78B800</div>
                    <div class="color-7ED321">#7ED321</div>
                    <div class="color-F5F7FA">#F5F7FA</div> -->
                        <form method="GET" action="consultar/basica">
                            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

                                <div class="input-group mb-3">
                                    <input name="codigoProducto" type="text" class="form-control" placeholder="Escribe aqui el producto a consultar">
                                    <div class="input-group-append">
                                        <input class="btn btn-outline-secondary" type="submit" value="consultar">
                                    </div>
                                </div>
                            </div>
                        </form>


                        <div class="container">

                            <c:choose>

                                <c:when test="${modo=='MODO_VACIO'}">

                                    <h1>No se encontro algun producto relacionado a la consulta!</h1>
                                </c:when>

                                <c:when test="${modo=='MODO_CONSULTA'}">
                                    <div class="row">


                                        <div class="card-deck mb-4 text-center">

                                            <c:forEach var="producto" items="${productos}">
                                                <div class="col-4 col-md">
                                                    <div class="card mb-4 box-shadow">
                                                        <div class="card-header">
                                                            <img src="/assets/images/leche.jpg" class="img-thumbnail">
                                                            <h4 class="my-0 font-weight-normal">${producto.codigoProducto}</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <h1 class="card-title pricing-card-title">S/.${producto.precioUnitario}</h1>
                                                            <!-- <ul class="list-unstyled mt-3 mb-4">
                              <li>10 users included</li>
                              <li>2 GB of storage</li>
                              <li>Email support</li>
                              <li>Help center access</li>
                            </ul> -->
                                                            <p class="card-text">${producto.descripcion}
                                                            </p>
                                                        </div>
                                                        <button type="button" class="btn btn-lg btn-block btn-outline-primary">Agregar</button>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>

                                    </div>
                                </c:when>
                            </c:choose>

                        </div>


                        <footer class="pt-4 my-md-5 pt-md-5 border-top">
                            <div class="row">
                                <div class="col-12 col-md">
                                    <img class="mb-2" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="24" height="24">
                                    <small class="d-block mb-3 text-muted">© 2017-2018</small>
                                </div>
                                <div class="col-6 col-md">
                                    <h5>Features</h5>
                                    <ul class="list-unstyled text-small">
                                        <li>
                                            <a class="text-muted" href="#">Cool stuff</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Random feature</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Team feature</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Stuff for developers</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Another one</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Last time</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-6 col-md">
                                    <h5>Resources</h5>
                                    <ul class="list-unstyled text-small">
                                        <li>
                                            <a class="text-muted" href="#">Resource</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Resource name</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Another resource</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Final resource</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-6 col-md">
                                    <h5>About</h5>
                                    <ul class="list-unstyled text-small">
                                        <li>
                                            <a class="text-muted" href="#">Team</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Locations</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Privacy</a>
                                        </li>
                                        <li>
                                            <a class="text-muted" href="#">Terms</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </footer>
                    </main>
                </div>


            </div>

        </body>

        </html>
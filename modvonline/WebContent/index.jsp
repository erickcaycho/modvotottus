<%--
  Created by IntelliJ IDEA.
  User: ecaycho
  Date: 26/05/2018
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico">

    <link href="http://mottie.github.io/tablesorter/css/theme.default.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://mottie.github.io/tablesorter/css/theme.jui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

    <script type="text/javascript" src="https://mottie.github.io/tablesorter/dist/js/jquery.tablesorter.min.js"></script>
    <script type="text/javascript" src="https://mottie.github.io/tablesorter/dist/js/jquery.tablesorter.widgets.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.tablesorter.pager.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
    <script src="${pageContext.request.contextPath}/js/jquery.session.js"></script>
	

<script type = "text/javascript" language = "javascript">

    $(document).ready(function() {


    });
</script>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="cabecera col align-self-start">
            <img src="${pageContext.request.contextPath}/images/logo.png" class="img-fluid" alt="Logo Tecsup">
            <label class="cabecera-texto">MÓDULO VENTA ONLINE 2.0</label>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div style="padding: 0px" class="col-md-9 col-sm-8 header-secondary-nav hidden-xs hidden-sm">
	        <nav class="menunav navbar navbar-expand-lg navbar-light justify-content-end">
	            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	            <div class="collapse navbar-collapse" id="navbarNav">
	                <ul class="navbar-nav">
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">Menú 1</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">Menú 2</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">Menú 3</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">Cerrar sesión</a>
	                    </li>
	                </ul>
	            </div>
	        </nav>
	    </div>
	    <div style="padding: 0px; margin-top:18px;text-align: right;" class="col-md-3 col-sm-12 col-xs-12 collect-selector-area bl-sesion-usuario">
	        Bienvenido: Erick Caycho
	        <!-- 
	        <div class="dropdown">
			  <button class="sesion-usuario btn dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    Bienvenido: Erick Caycho
			  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
				<a class="sesion-usuario dropdown-item" href="#">Últimas búsquedas</a>
				<div class="dropdown-divider"></div>
				<a class="sesion-usuario dropdown-item" href="#">Cerrar sesión</a>
			  </div>
			</div>
			 -->
	    </div>
    </div>



    <div class="row border-subtitulo">
        <label class="subtitulo">Búsqueda básica</label>
    </div>
    <div class="row">
        <fieldset>
            <label class="texto-informativo">Seleccione los campos obligatorios <span class="obligatorio">(*)</span></label>
        </fieldset>
    </div>

    <div class="row">
    </div>


    <div class="row">
    </div>
</div>


<footer class="footer">
    <div class="container-footer">
        <p class="text-muted">&copy; Lima - 2018</p>
    </div>
</footer>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ecaycho
  Date: 24/04/2017
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <!--
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    -->

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

    <script type="text/javascript" src="https://mottie.github.io/tablesorter/dist/js/jquery.tablesorter.min.js"></script>
    <script type="text/javascript" src="https://mottie.github.io/tablesorter/dist/js/jquery.tablesorter.widgets.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.tablesorter.pager.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!--
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu-responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    -->


    <script type = "text/javascript" language = "javascript">
        $(document).ready(function() {

            //Primer active li activado (menú: Cursos con programación)
            $(".menunav li:first").addClass("active");

            $('.menunav li').click(function() {
                $(this).siblings('li').removeClass('active');
                $(this).addClass('active');
            });

            //ModalValidData
            $( "#dialog" ).dialog({
                autoOpen: false,
                modal: true,
                buttons: {
                    Cerrar: function() {
                        $(this).dialog( "close" );
                    }
                }
            });

            //ModalLoadData
            $( "#dialog_dataload" ).dialog({
                autoOpen: false,
                modal: true,
                open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
                closeOnEscape: false
            });

            $( ".widget input[type=submit], .widget a, .widget button" ).button();




            $("#myDummyTable").tablesorter({
                theme: 'jui',
                widgets: ['zebra', 'columns', 'uitheme'],
                resort: true,
                tabIndex: true,
                headers: {
                    2: { sorter: "text" }
                },

                sortInitialOrder: "asc",
                sortReset: false,
                sortRestart: false,

            });


            $( "#guardarCurso" ).click(function() {


            });

        });
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="cabecera col align-self-start">
            <img src="${pageContext.request.contextPath}/images/logo.png" class="img-fluid" alt="Logo Tecsup">
            <label class="cabecera-texto">MÓDULO WEBADMIN 2.0</label>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <nav class="menunav navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd; width: 100%;">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/webadmin/detallecurso/3003/${codprogramaintegral_sesion}/${sede_sesion}/${subsede_sesion}">Regresar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/webadmin/">Cerrar Sesión</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>

    <div class="row bl-sesion-usuario">
        <label class="sesion-usuario">Bienvenido(a): Erick Caycho Ponce</label>
    </div>

    <c:choose>
        <c:when test="${not empty mensaje}">
            <c:choose>
                <c:when test="${mensaje=='Ok'}">
                    <div class="alert alert-success" role="alert">
                        <strong>Los cambios fueron guardados correctamente. <br/>  <a href="/" class="alert-link">Regresar</a></strong>
                    </div>
                </c:when>
                <c:when test="${mensaje=='Error'}">
                    <div class="alert alert-danger" role="alert">
                        <strong>Ha ocurrido un error en el sistema. Reportar error a Mesa de Ayuda <br/> <a href="/" class="alert-link">Regresar</a></strong>
                    </div>
                </c:when>
            </c:choose>
        </c:when>
    </c:choose>

    <div class="row border-subtitulo">
        <fieldset>
            <label class="texto-informativo">Complete los campos obligatorios <span class="obligatorio">(*)</span></label>
        </fieldset>
    </div>

    <div class="row">
        <div class="col-md-12">
                <h2><c:out value="${curso.nombre}"></c:out></h2>
        </div>

        <div class="col-md-12">
            <section>
                <p class="contenido-section"><c:out value="${curso.introduccion}"></c:out></p>
            </section>

            <section>
                <h2>Objetivos</h2>
                <p><ul class="contenido-section"><li><c:out value="${curso.objetivo}" escapeXml="false"></c:out></li></ul></p>
            </section>

            <section>
                <h2>Duraci&oacute;n</h2>
                <p class="contenido-section"><c:out value="${curso.numeroHoras} horas"></c:out></p>
            </section>

            <section>
                <h2>Requisitos</h2>
                <p class="contenido-section">
                    <c:choose>
                        <c:when test = "${curso.requisitos==null}">
                            <label>No tiene requisito</label>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${curso.requisitos}"></c:out>
                        </c:otherwise>
                    </c:choose>
                </p>
            </section>

            <section>
                <h2>Área Venta <span class="obligatorio">(*)</span></h2>
                <fieldset>
                    <label class="texto-informativo">Seleccione el área de interés: <span class="obligatorio">(*)</span></label>
                </fieldset>
                <select name="area" class="form-control">
                    <option>--Seleccione--</option>
                    <c:forEach var="item_m" items="${arealista_modulo}">
                        <option value="${item_m.codigo}" ${item_m.codigo == curso.areaVenta ? 'selected' : ''}> ${item_m.nombre}</option>
                    </c:forEach>
                </select>
            </section>

            <section>
                <div class="row">
                    <div class="col-md-2">
                        <h2>Publicar en Web <span class="obligatorio">(*)</span></h2>

                        <label class="radio-control custom-control custom-radio">
                            <input name="publicar" type="radio" class="custom-control-input" value="1" ${moduloestado=='1'?'checked':''}>
                            <span class="custom-control-indicator"></span>
                            <span class="custom-control-description">Si</span>
                        </label>

                        <label class="radio-control custom-control custom-radio">
                            <input name="publicar" type="radio" class="custom-control-input" value="0" ${moduloestado=='0'?'checked':''}>
                            <span class="custom-control-indicator"></span>
                            <span class="custom-control-description">No</span>
                        </label>
                    </div>
                </div>
            </section>

            <section>
                <h2>Temario <span class="obligatorio">(*)</span></h2>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Unidad</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${obtenerListaUnidades}" var="obtenerListaUnidades">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test = "${obtenerListaUnidades.unidadFormacion==null}">
                                        <label style="color:red;">Texto vacío</label>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${obtenerListaUnidades.unidadFormacion}" escapeXml="false"></c:out>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </section>


            <section>
                <div class="div_button_enviar">
                    <c:choose>
                        <c:when test = "${curso.estado == '0'}">
                            <button class="ui-button ui-widget ui-corner-all btn_enviar" >Guardar</button>
                        </c:when>
                        <c:otherwise>
                            <button class="ui-button ui-widget ui-corner-all btn_enviar" disabled>Guardar</button>
                        </c:otherwise>
                    </c:choose>
                 </div>
            </section>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="container-footer">
        <p class="text-muted">&copy; TI Tecsup Lima - 2017</p>
    </div>
</footer>
</body>

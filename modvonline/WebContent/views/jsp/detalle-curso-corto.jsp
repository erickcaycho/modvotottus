<%--
  Created by IntelliJ IDEA.
  User: ecaycho
  Date: 4/12/2017
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Curso Corto</title>
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

    <script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>

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

            CKEDITOR.replace( 'infoAdicional' );

            $( "#dialog" ).dialog({
                autoOpen: false,
                modal: true,
                buttons: {
                    Cerrar: function() {
                        $(this).dialog( "close" );
                    }
                }
            });

            $( "#dialog-mensajeconfirmacion" ).dialog({
                autoOpen: false,
                modal: true,
                open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
                closeOnEscape: false,
                buttons: {
                    "Regresar": function() {
                        $( this ).dialog( "close" );
                        window.location.href = "/webadmin/";
                    },
                    "Cancelar": function() {
                        $( this ).dialog( "close" );
                    }
                }
            });

            //ConfirmarAccion
            $( "#dialog-confirm" ).dialog({
                resizable: false,
                autoOpen: false,
                modal: true,
                open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); },
                closeOnEscape: false,
                buttons: {
                    "Aceptar": function() {
                        $( this ).dialog( "close" );
                        $("#formProgramaIntegral").submit();
                    },
                    "Cancelar": function() {
                        $( this ).dialog( "close" );
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

            var msg = "<c:out value='${mensaje}'/>";

            if(msg=="Ok"){

                $("#etiquetaMensajeConfirmacion").addClass("alert alert-success");
                $("#mensajeConfirmacion").html("Se ha guardado correctamente los cambios.");
                $("#dialog-mensajeconfirmacion").dialog("open");

            }

            if(msg=="Error"){

                $("#etiquetaMensajeConfirmacion").removeClass("alert alert-success");
                $("#etiquetaMensajeConfirmacion").addClass("alert alert-danger");
                $("#mensajeConfirmacion").html("Ha ocurrido un error en el sistema. Reportar error a Mesa de Ayuda ");
                $("#dialog-mensajeconfirmacion").dialog("open");
            }


            $( "#guardarCurso" ).click(function() {

                if($("#area").val()== "" || $("#area").val()=="--Seleccione--"){

                    $("#area").css("border", "#ff0000 solid 1px");

                    $("#etiquetaMensaje").addClass("alert alert-danger");
                    $("#mensaje").html("Seleccione los campos obligatorios (*): "+'<br/>'+"- Área Venta");
                    $("#dialog").dialog("open");

                }else if($("#urlpardot1").val()==""){

                    $("#area").css("border", "#ced4da solid 1px");

                    $("#urlpardot1").css("border", "red solid 1px");
                    $("#etiquetaMensaje").addClass("alert alert-danger");
                    $("#mensaje").html("Seleccione los campos obligatorios (*): "+'<br/>'+"- Formulario Contáctanos");
                    $("#dialog").dialog("open");

                }else if($("#urlpardot2").val()==""){

                    $("#urlpardot1").css("border", "#ced4da solid 1px");

                    $("#urlpardot2").css("border", "red solid 1px");
                    $("#etiquetaMensaje").addClass("alert alert-danger");
                    $("#mensaje").html("Seleccione los campos obligatorios (*): "+'<br/>'+"- Formulario Inscripción");
                    $("#dialog").dialog("open");

                }
                /*
                 else if($("#file2").val() == ""){

                 $("#urlpardot2").css("border", "#ced4da solid 1px");

                 $("#file2").css("border", "red solid 1px");
                 $("#etiquetaMensaje").addClass("alert alert-danger");
                 $("#mensaje").html("Seleccione los campos obligatorios (*): "+'<br/>'+"- Adjuntar imagen Big Banner");
                 $("#dialog").dialog("open");

                 }
                 */
                else{

                    /*
                     $("#file2").css("border", "#ced4da solid 1px");
                     */

                    if($("#file2").val() != ""){
                        uploadFormData();
                    }

                    $("#dialog-confirm").dialog("open");
                    //$("#formProgramaIntegral").submit();

                }

                return false;

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
                        <a class="nav-link" href="/webadmin/">Regresar</a>
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
                        <strong>Los cambios fueron guardados correctamente. <br/>  <a href="/webadmin/" class="alert-link">Regresar</a></strong>
                    </div>
                </c:when>
                <c:when test="${mensaje=='Error'}">
                    <div class="alert alert-danger" role="alert">
                        <strong>Ha ocurrido un error en el sistema. Reportar error a Mesa de Ayuda <br/> <a href="/webadmin/" class="alert-link">Regresar</a></strong>
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
        <form id="formProgramaIntegral" method="POST" action="/webadmin/detallecurso" modelAttribute="curso">
            <div class="col-md-12">
                <h2>
                    <input name="codTipoCurso" value="${codTipoCurso_sesion}" type="hidden">
                    <input name="codigo" value="${codigo_sesion}" type="hidden">
                    <input name="sede" value="${sede_sesion}" type="hidden">
                    <input name="subsede" value="${subsede_sesion}" type="hidden">
                    <input name="responsable" value="${responsable_sesion}" type="hidden">

                    <c:out value="${curso.nombre}"></c:out>

                </h2>
            </div>

            <div class="col-md-12">

                <section>
                    <p class="contenido-section"><c:out value="${curso.introduccion}"></c:out></p>
                </section>

                <section>
                    <h2>Objetivos</h2>
                    <ul class="contenido-section"><li><c:out value="${curso.objetivo}" escapeXml="false"></c:out></ul>
                </section>

                <section>
                    <h2>Requisitos</h2>
                    <p class="contenido-section">
                        <c:choose>
                            <c:when test = "${curso.requisitos==null}">
                                <label style="color:red;">Texto vacío</label>
                            </c:when>
                            <c:otherwise>
                                <c:out value="${curso.requisitos}"></c:out>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </section>

                <section>
                    <h2>Duración</h2>
                    <p class="contenido-section">
                        <c:choose>
                            <c:when test = "${curso.duracion==null}">
                                <label style="color:red;">Texto vacío</label>
                            </c:when>
                            <c:otherwise>
                                <c:out value="${curso.duracion} horas"></c:out>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </section>

                <section>
                    <h2>Área Venta</h2>
                    <fieldset>
                        <label class="texto-informativo">Seleccione el área de interés: <span class="obligatorio">(*)</span></label>
                    </fieldset>
                    <select id="area" name="areaVenta" class="form-control">
                        <option>--Seleccione--</option>
                        <c:forEach var="item" items="${arealista}">
                            <option value="${item.codigo}" ${item.codigo == codArea ? 'selected' : ''}> ${item.nombre}</option>
                        </c:forEach>
                    </select>
                </section>
                <section>
                    <div class="row">
                        <div class="col-md-2">
                            <h2>Publicar en Web <span class="obligatorio">(*)</span></h2>

                            <label class="radio-control custom-control custom-radio">
                                <input name="estado" type="radio" class="custom-control-input" value="1" ${estado_sesion=='1'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">Si</span>
                            </label>

                            <label class="radio-control custom-control custom-radio">
                                <input name="estado" type="radio" class="custom-control-input" value="0" ${estado_sesion=='0'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">No</span>
                            </label>
                        </div>

                        <div class="col-md-2">
                            <h2>¿Es nuevo programa?</h2>
                            <label class="radio-control custom-control custom-radio">
                                <input name="flagNuevoPrograma" type="radio" class="custom-control-input" value="1" ${nuevo_sesion=='1'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">Si</span>
                            </label>

                            <label class="radio-control custom-control custom-radio">
                                <input name="flagNuevoPrograma" type="radio" class="custom-control-input" value="0" ${nuevo_sesion=='0'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">No</span>
                            </label>
                        </div>

                        <div class="col-md-2">
                            <h2>¿Es nueva versión?</h2>
                            <label class="radio-control custom-control custom-radio">
                                <input name="flagNuevaVersion" type="radio" class="custom-control-input" value="1" ${version_sesion=='1'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">Si</span>
                            </label>

                            <label class="radio-control custom-control custom-radio">
                                <input name="flagNuevaVersion" type="radio" class="custom-control-input" value="0" ${version_sesion=='0'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">No</span>
                            </label>
                        </div>

                        <div class="col-md-2">
                            <h2>¿Tiene descuento?</h2>
                            <label class="radio-control custom-control custom-radio">
                                <input name="flagDescuento" type="radio" class="custom-control-input" value="1" ${descuento_sesion=='1'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">Si</span>
                            </label>

                            <label class="radio-control custom-control custom-radio">
                                <input name="flagDescuento" type="radio" class="custom-control-input" value="0" ${descuento_sesion=='0'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">No</span>
                            </label>
                        </div>

                        <div class="col-md-2">
                            <h2>¿Requiere evaluación?</h2>
                            <label class="radio-control custom-control custom-radio">
                                <input name="flagReqEvaluacion" type="radio" class="custom-control-input" value="1" ${reqevaluacion_sesion=='1'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">Si</span>
                            </label>

                            <label class="radio-control custom-control custom-radio">
                                <input name="flagReqEvaluacion" type="radio" class="custom-control-input" value="0" ${reqevaluacion_sesion=='0'?'checked':''}>
                                <span class="custom-control-indicator"></span>
                                <span class="custom-control-description">No</span>
                            </label>
                        </div>
                    </div>
                </section>

                <section>
                    <h2>Temario</h2>
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
                    <h2>Programación de Pago</h2>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Fecha Inicio</th>
                            <th>Fecha Fin</th>
                            <th>Fecha Cierre</th>
                            <th>Horario</th>
                            <th>Estado</th>
                            <th>Responsable</th>
                            <th>Precio</th>

                            <th>Capacidad</th>
                            <th>Cantidad Inscritos</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test = "${empty obtenerCalendarioCursoCorto}">
                                <tr>
                                    <td colspan="9">No tiene programación de pagos activada</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${obtenerCalendarioCursoCorto}" var="obtenerCalendarioCursoCorto">
                                    <tr>
                                        <td>${obtenerCalendarioCursoCorto.fechaInicio}</td>
                                        <td>${obtenerCalendarioCursoCorto.fechaFin}</td>
                                        <td>${obtenerCalendarioCursoCorto.fechaCierre}</td>
                                        <td>${obtenerCalendarioCursoCorto.horario}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test = "${obtenerCalendarioCursoCorto.estado == 'A'}">
                                                    ACTIVO
                                                </c:when>
                                                <c:otherwise>
                                                    PENDIENTE
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${obtenerCalendarioCursoCorto.responsable}</td>
                                        <td>${obtenerCalendarioCursoCorto.precio}
                                            <c:choose>
                                                <c:when test = "${obtenerCalendarioCursoCorto.moneda == 'S/.'}">
                                                    Soles al contado
                                                </c:when>
                                                <c:otherwise>
                                                    Dólares al contado
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${obtenerCalendarioCursoCorto.capacidad}</td>
                                        <td>${obtenerCalendarioCursoCorto.cantidadInscritos}</td>

                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>



                        </tbody>
                    </table>
                </section>

                <section>
                    <h2>Calendario de Pago</h2>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Nro. Cuota</th>
                            <th>Monto</th>
                            <th>Fecha de Pago</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test = "${empty obtenerCalendarioPago}">
                                    <tr>
                                        <td colspan="3">No tiene calendario de pago programado</td>
                                    </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${obtenerCalendarioPago}" var="obtenerCalendarioPago">
                                    <tr>
                                        <td>${obtenerCalendarioPago.numcuota}</td>
                                        <td>${obtenerCalendarioPago.moneda} ${obtenerCalendarioPago.montocuota}</td>
                                        <td>${obtenerCalendarioPago.fechapago}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </section>

                <section>
                    <h2>Formularios Pardot</h2>

                    <div class="bl-contenido">
                        <label>Ingrese la URL del formulario Solicita más información <span class="obligatorio">(*)</span></label>
                        <input id="urlpardot1" name="formContacto" class="form-control" value="${formcontacto_sesion}">
                    </div>

                    <div class="bl-contenido">
                        <label>Ingrese la URL del formulario Inscribirme <span class="obligatorio">(*)</span></label>
                        <input id="urlpardot2" name="formInscripcion" class="form-control" value="${forminscripcion_sesion}">
                    </div>

                </section>

                <section>
                    <h2>Vídeo en YouTube</h2>
                    <label>Ingrese el código del vídeo de YouTube</label>
                    <input name="codVideo" class="form-control" value="${video_sesion}">
                </section>

                <section>
                    <h2>Big banner del Curso Corto</h2>

                    <input id="file2" name="imgBigBanner" type="file" value="${imgbanner_sesion}">
                    <c:choose>
                        <c:when test="${empty imgbanner_sesion}">
                            <div id="result"></div>
                        </c:when>
                        <c:otherwise>
                            <div id="result" style="padding-top: 20px;">
                                <img src="/uploads/${imgbanner_sesion}" width="20%">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </section>
                <section>
                    <h2>Ingrese información adicional: </h2>
                    <textarea id="infoAdicional" name="infoAdicional">
                        <c:out escapeXml="false" value="${infoadicional_sesion}"/>
                    </textarea>
                </section>

                <section>
                    <div class="div_button_enviar">
                        <button class="ui-button ui-corner-all ui-widget btn_enviar" id="guardarCurso">Guardar</button>
                    </div>
                </section>
            </div>
        </form>
    </div>
</div>

<!-- Mensajes de alertas -->
<div id="dialog" class="mensaje_alerta" title="Sistemas Tecsup">
    <div id="etiquetaMensaje"><label id="mensaje"></label></div>
</div>

<!-- Mensaje de LoadData -->
<div id="dialog_dataload" class="modal_popup" title="Sistemas Tecsup">
    <div>
        <label><span style="font-size: 14px;">Cargando resultados</span></label>
    </div>
    <div style="text-align: center">
        <img src="${pageContext.request.contextPath}/images/Spinner.gif" width="80px" />
    </div>
</div>

<!--Mensaje de prevención confirmación -->
<div id="dialog-confirm" title="Sistemas Tecsup">
    <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>¿Está seguro de guardas sus cambios?</p>
</div>

<!--Mensaje de confirmación Ok-->
<div id="dialog-mensajeconfirmacion" class="mensaje_alerta" title="Sistemas Tecsup">
    <div id="etiquetaMensajeConfirmacion"><label id="mensajeConfirmacion"></label></div>
</div>


<footer class="footer">
    <div class="container-footer">
        <p class="text-muted">&copy; TI Tecsup Lima - 2017</p>
    </div>
</footer>
</body>
</html>

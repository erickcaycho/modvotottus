<%--
  Created by IntelliJ IDEA.
  User: ecaycho
  Date: 12/12/2017
  Time: 16:40
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
    <title>Detalle Área Venta</title>
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
                        window.location.href = "/webadmin/obtenerareas";
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
                        $("#formGuardarArea").submit();
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

                if ($('#chkcurso').is(":checked"))
                {
                    $("#escurso").val(1);
                }else{
                    $("#escurso").val(0);
                }

                if ($('#chkdiplomado').is(":checked"))
                {
                    $("#esdiplomado").val(1);
                }else{
                    $("#esdiplomado").val(0);
                }

                if ($('#chkescuela').is(":checked"))
                {
                    $("#esescuela").val(1);
                }else{
                    $("#esescuela").val(0);
                }

                if ($('#chkintegral').is(":checked"))
                {
                    $("#esintegral").val(1);
                }else{
                    $("#esintegral").val(0);
                }

                if ($('#chkseminario').is(":checked"))
                {
                    $("#esseminario").val(1);
                }else{
                    $("#esseminario").val(0);
                }

                if ($('#chksimposio').is(":checked"))
                {
                    $("#essimposio").val(1);
                }else{
                    $("#essimposio").val(0);
                }

                if ($('#chkvirtual').is(":checked"))
                {
                    $("#esvirtual").val(1);
                }else{
                    $("#esvirtual").val(0);
                }

                $("#dialog-confirm").dialog("open");
                    //$("#formProgramaIntegral").submit();
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
                        <a class="nav-link" href="/webadmin/obtenerareas">Regresar</a>
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
                        <strong>Los cambios fueron guardados correctamente. <br/>  <a href="/webadmin/obtenerareas" class="alert-link">Regresar</a></strong>
                    </div>
                </c:when>
                <c:when test="${mensaje=='Error'}">
                    <div class="alert alert-danger" role="alert">
                        <strong>Ha ocurrido un error en el sistema. Reportar error a Mesa de Ayuda <br/> <a href="/webadmin/obtenerareas" class="alert-link">Regresar</a></strong>
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
        <form id="formGuardarArea" method="POST" action="/webadmin/detallearea" modelAttribute="area">
            <div class="container-fluid">
                <div class="bl-cuerpo row">
                    <div class="col-md-12">
                        <section>
                            <h2>Área Venta seleccionada: <c:out value="${area.nombre}"></c:out></h2>

                            <div class="row">
                                <div class="col-md-2">
                                    <h2>Publicar área venta <span class="obligatorio">(*)</span></h2>

                                    <label class="radio-control custom-control custom-radio">
                                        <input name="estado" type="radio" class="custom-control-input" value="1" ${area.estado=='1'?'checked':''}>
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Si</span>
                                    </label>

                                    <label class="radio-control custom-control custom-radio">
                                        <input name="estado" type="radio" class="custom-control-input" value="0" ${area.estado=='0'?'checked':''}>
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">No</span>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <table id="myDummyTable" class="tablesorter" border="0" cellpadding="0" cellspacing="1">
                                    <thead>
                                    <tr>
                                        <th class="bl-cab th-menu">CURSO CORTO</th>
                                        <th class="bl-cab th-menu">DIPLOMADO</th>
                                        <th class="bl-cab th-menu">EQUIPO PESADO</th>
                                        <th class="bl-cab th-menu">INTEGRAL</th>
                                        <th class="bl-cab th-menu">SEMINARIO</th>
                                        <th class="bl-cab th-menu">SIMPOSIO</th>
                                        <th class="bl-cab th-menu">VIRTUAL</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="bl-td">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" id="chkcurso" type="checkbox" value="1" ${area.esCurso=='1'?'checked':''}>
                                                </label>
                                            </td>
                                            <td class="bl-td">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" id="chkdiplomado" type="checkbox" value="1" ${area.esDiplomado=='1'?'checked':''}>
                                                </label>
                                            </td>
                                            <td class="bl-td">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" id="chkescuela" type="checkbox" value="1" ${area.esCursoEscuelaOp=='1'?'checked':''}>
                                                </label>
                                            </td>
                                            <td class="bl-td">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" id="chkintegral" type="checkbox" value="1" ${area.esIntegral=='1'?'checked':''}>
                                                </label>
                                            </td>
                                            <td class="bl-td">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" id="chkseminario" type="checkbox" value="1" ${area.esSeminario=='1'?'checked':''}>
                                                </label>
                                            </td>
                                            <td class="bl-td">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" id="chksimposio" type="checkbox" value="1" ${area.esSimposio=='1'?'checked':''}>
                                                </label>
                                            </td>
                                            <td class="bl-td">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" id="chkvirtual" type="checkbox" value="1" ${area.esVirtual=='1'?'checked':''}>
                                                </label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <input id="escurso" name="esCurso" type="hidden">
                                <input id="esdiplomado" name="esDiplomado" type="hidden">
                                <input id="esescuela" name="esCursoEscuelaOp" type="hidden">
                                <input id="esintegral" name="esIntegral" type="hidden">
                                <input id="esseminario" name="esSeminario" type="hidden">
                                <input id="essimposio" name="esSimposio" type="hidden">
                                <input id="esvirtual" name="esVirtual" type="hidden">

                            </div>
                        </section>
                        <section>
                            <div class="div_button_enviar">
                                <button class="ui-button ui-corner-all ui-widget btn_enviar" id="guardarCurso">Guardar</button>
                            </div>
                        </section>
                    </div>

                </div>
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

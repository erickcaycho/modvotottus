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

                // *** SORT OPTIONS ***
                // These are detected by default,
                // but you can change or disable them
                // these can also be set using data-attributes or class names
                headers: {
                    // set "sorter : false" (no quotes) to disable the column
                    // 0: { sorter: "text" },
                    2: { sorter: "text" }
                },
                // sortList: [ [0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0] ],
                sortInitialOrder: "asc",
                sortReset: false,
                sortRestart: false,

            });


            var select = $("#sede"), options = '';
            var fselect = $("#familia"), foptions = '';


            $('#sede').append("<option value=''>-- Seleccione --</option>");
            $('#subsede').append("<option value=''>-- Seleccione --</option>");
            $('#familia').append("<option value=''>-- Seleccione --</option>");


            console.log('Cargando select ...');
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/obtenersedes",
                success: function(response){

                    console.log('carga obtenersedes');
                    for(var i=0;i<response.length; i++){
                        options += "<option value='"+response[i].codSede+"'>"+ response[i].nombre +"</option>";
                    }
                    select.append(options);
                    console.log('sale de obtenersedes');
                },
                error: function(e){
                    console.log('Error: ' + e);
                }
            });

            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/familias",
                success: function(response){

                    console.log('carga las familias');
                    for(var i=0;i<response.length; i++){
                        foptions += "<option value='"+response[i].codigo+"'>"+ response[i].nombre +"</option>";
                    }
                    fselect.append(foptions);
                    console.log('sale de familias');
                },
                error: function(e){
                    console.log('Error: ' + e);
                }
            });


            $("#sede").on('change', function() {
                var codsede = this.value;
                var select = $("#subsede"), options = '';

                $( "#subsede" ).empty();
                $('#subsede').append("<option value=''>-- Seleccione --</option>");
                $('#familia').prop('selectedIndex',0);

                console.log(codsede);
                console.log('entra');

                if(codsede != ""){
                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/obtenersubsede/"+codsede,
                        success: function(response){

                            console.log('carga');
                            for(var i=0;i<response.length; i++){
                                options += "<option value='"+response[i].codsubsede+"'>"+ response[i].nombre +"</option>";
                            }
                            select.append(options);
                            console.log('sale');
                        },
                        error: function(e){
                            console.log('Error: ' + e);
                        }
                    });
                }
            });


            $( "#buscarCurso" ).click(function() {

                if($("#sede").val()== "" || $("#subsede").val()== "" || $("#familia").val()== ""){

                    if($("#sede").val()== ""){
                        console.log("entra ...");
                        $("#sede").css("border", "red solid 1px");
                    }else{
                        $("#sede").css("border", "#ced4da solid 1px");
                    }

                    if($("#subsede").val()== ""){
                        $("#subsede").css("border", "red solid 1px");
                    }else{
                        $("#subsede").css("border", "#ced4da solid 1px");
                    }

                    if($("#familia").val()== ""){
                        $("#familia").css("border", "red solid 1px");
                    }else{
                        $("#familia").css("border", "#ced4da solid 1px");
                    }

                    $("#etiquetaMensaje").addClass("alert alert-danger");
                    $("#mensaje").html("Seleccione los campos obligatorios (*)");
                    $("#dialog").dialog("open");
                    return false;
                }

                $("#sede").css("border", "#ced4da solid 1px");
                $("#subsede").css("border", "#ced4da solid 1px");
                $("#familia").css("border", "#ced4da solid 1px");

                var tipoCurso=  $( "#familia option:selected" ).val();
                var sede=$("#sede option:selected").val();
                var subsede=$("#subsede option:selected").val();

                var items =[];

                /*ModalLoadData*/
                $("#dialog_dataload").dialog("open");

                if(tipoCurso != ""){
                    $('#myDummyTable tbody').empty();

                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/obtenercursosnoprogramados/"+tipoCurso+"/"+sede+"/"+subsede,
                        success: function(response){

                            $("#dialog_dataload").dialog("close");

                            if ($.trim(response)){
                                console.log('[Inicio v1] ....');
                                $.each(response,function (key,val) {
                                    var row = $("<tr><td>"+val.codigo+"</td><td>"+val.nombre+"</td><td>"+val.areaAcademica+"</td>" +
                                        "<td>"+val.nombreSede+"</td><td>"+val.nombreSubsede+"</td><td>"+val.responsable+"</td>" +
                                        "<td><a href='${pageContext.request.contextPath}/detallecurso/"+tipoCurso+"/"+val.codigo+"/"+val.sede+"/"+val.subsede+"' target='_blank'>Editar</a></td></tr>");

                                    $("#myDummyTable tbody").append(row);
                                });

                                $("#myDummyTable").trigger("updateAll");

                                $("#myDummyTable").tablesorterPager({
                                    container: $(".pager"),
                                    ajaxUrl: null,
                                    ajaxProcessing: function(ajax) {
                                        if (ajax && ajax.hasOwnProperty('data')) {
                                            // return [ "data", "total_rows" ];
                                            return [ajax.data, ajax.total_rows];
                                        }
                                    },
                                    output: '{startRow} to {endRow} ({totalRows})',
                                    updateArrows: true,
                                    page: 0,
                                    size: 10,
                                    fixedHeight: true,
                                    removeRows: false,
                                    cssNext: '.next',
                                    cssPrev: '.prev',
                                    cssFirst: '.first',
                                    cssLast: '.last',
                                    cssGoto: '.gotoPage',
                                    cssPageDisplay: '.pagedisplay',
                                    cssPageSize: '.pagesize',
                                    cssDisabled: 'disabled'
                                });
                            }else{

                                var row = $("<tr class='odd ui-state-default'><td colspan='7'>No hay resultados para la búsqueda</td></tr>");
                                $("#myDummyTable tbody").append(row);

                                console.log('Vacío');

                                $("#etiquetaMensaje").removeClass("alert alert-danger");
                                $("#etiquetaMensaje").addClass("alert alert-info");
                                $("#mensaje").html("No se encontraron resultados");
                                $("#dialog").dialog("open");

                                return false;
                            }

                        },
                        error: function(e){
                            console.log('Error: ' + e);
                        }
                    });
                }else{
                    $('#myDummyTable tbody').empty();
                }
            });

            $( "#btnEditar" ).click(function() {
                console.log('obtener id curso');
                alert($(this).attr("value"));
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
                        <a class="nav-link" href="${request.contextPath}/webadmin/">Cursos con programación</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="${request.contextPath}/webadmin/sin-programacion">Cursos sin programación</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${request.contextPath}/webadmin/obtenerareas">Áreas Venta</a>
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

    <div class="row border-subtitulo">
        <label class="subtitulo">Buscar cursos sin programación</label>
    </div>
    <div class="row">
        <fieldset>
            <label class="texto-informativo">Seleccione los campos obligatorios <span class="obligatorio">(*)</span></label>
        </fieldset>
    </div>

    <div class="row">
        <div class="etiqueta-inicio">
            <label>Sede (*): </label>
            <select id="sede" class="form-control"></select>
        </div>

        <div class="etiqueta">
            <label>Subsede (*): </label>
            <select id="subsede" class="form-control"></select>
        </div>

        <div class="etiqueta">
            <label>Familia de Curso (*): </label>
            <select id="familia" class="form-control"></select>
        </div>

        <div class="etiqueta-buttom">
            <button id="buscarCurso" class="ui-button ui-corner-all ui-widget">Buscar</button>
        </div>
    </div>

    <div class="row">
        <table id="myDummyTable" class="tablesorter" border="0" cellpadding="0" cellspacing="1">
            <thead>
            <tr>
                <th class="th-menu">CÓDIGO</th>
                <th class="th-menu">NOMBRE DE CURSO</th>
                <th class="th-menu">ÁREA ACADÉMICA</th>
                <th class="th-menu">SEDE</th>
                <th class="th-menu">SUBSEDE</th>
                <th class="th-menu">RESPONSABLE</th>
                <th class="th-menu">ACCIÓN</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <div class="row">
        <!-- pager -->
        <div class="pager">
            <img src="http://mottie.github.com/tablesorter/addons/pager/icons/first.png" class="first"/>
            <img src="http://mottie.github.com/tablesorter/addons/pager/icons/prev.png" class="prev"/>
            <span class="pagedisplay"></span> <!-- this can be any element, including an input -->
            <img src="http://mottie.github.com/tablesorter/addons/pager/icons/next.png" class="next"/>
            <img src="http://mottie.github.com/tablesorter/addons/pager/icons/last.png" class="last"/>
            <select class="pagesize" title="Select page size">
                <option selected="selected" value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="40">40</option>
            </select>
        </div>
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

<footer class="footer">
    <div class="container-footer">
        <p class="text-muted">&copy; TI Tecsup Lima - 2017</p>
    </div>
</footer>
</body>
</html>

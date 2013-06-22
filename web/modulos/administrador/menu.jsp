
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>        
<link rel="stylesheet" type="text/css" href="../../Recursos/Estilos/menu/menu.css"/>
<script type="text/javascript" src="../../Recursos/JavaScript/JsMenu/jquery-latest.js"></script>    
<title>Menu Prinsipal Administrador</title>
<ul id="menu">
	<li>Carga academica</li>
                <ul>
                        <li><a href="../../AdministradorController?opt=13" target="body" >Reporte CargaDocente</a></li> 
                        <li><a href="#" target="body"></a></li>
                        <li><a href="#" target="body"></a></li>
                </ul>
	<li>Personal</li>
                <ul>
                        <li><a href="../../AdministradorController?opt=7" target="body">Docente</a></li>
                        <li><a href="../../AdministradorController?opt=41" target="body">Trabajadores</a></li>
                </ul>
        <li>Pabellones</li>
        
                <ul>
                        <li><a href="../../AdministradorController?opt=41" target="body"></a></li>
<!--                    <li><a href="contenido/administrador_encargado_form_add.jsp" target="body">Agregar Nuevo Encargado</a></li>-->
                </ul>
          <li>Area  </li>
                <ul>
                    <li><a href="../../AdministradorController?opt=1" target="body">Facultades</a></li>
                        <li><a href="../../AdministradorController?opt=4" target="body">Carreras</a></li>
                </ul>
          <li><a href="../../index.jsp">Salir</a> </li>
	
</ul>
<script type="text/javascript">
    $("#menu > li").click(function(){

            if(false == $(this).next().is(':visible')) {
                    $('#accordion > ul').slideUp(300);
            }
            $(this).next().slideToggle(300);
    });

    $('#menu > ul:eq(0)').show();

</script>
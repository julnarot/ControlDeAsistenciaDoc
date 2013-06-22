
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>        
<link rel="stylesheet" type="text/css" href="../../Recursos/Estilos/menu/menu.css"/>
<script type="text/javascript" src="../../Recursos/JavaScript/JsMenu/jquery-latest.js"></script>    
<title>Menu Prinsipal Administrador</title>
<ul id="menu">
	<li>Asistencia</li>
                <ul>
                        <li><a href="#" target="body" >Reporte CargaDocente</a></li> 
                        <li><a href="#" target="body">Reporte Salones</a></li>
                        <li><a href="#" target="body">Reporte Asistencias</a></li>
                        <li><a href="#" target="body"></a></li>
                </ul>
	<li>Datos Personales</li>
                <ul>
                        <li><a href="#">Configuracion de Cuenta</a></li>
                        <li><a href="#">Historial</a></li>
                </ul>
        
        
	
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
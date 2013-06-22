<%-- 
    Document   : administrador_encargado_form_add
    Created on : 03/03/2013, 09:02:49 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../../../Recursos/Estilos/Jstyle.css"/>
    </head>
    <body>
        <h1>Encargado</h1>
        
        <div id="DivformEncargado" >
             <form name="" action="../../../AdministradorController" id="FormReg">
               
               <p>Nombres</p>
               <input type="text" name="NombresJ" value="" placeholder="Johan Ricardo" required=""/>
               </br>
               <p>Apellidos</p>
                <input type="text" name="ApellidosJ" value="" placeholder="" required=""/>
                </br> 
                <p>Email</p>
                <input type="email" name="EmailJ" value="" required=""/>
                </br>
                <p>Numero Telefonico</p>
                <input type="text" name="NumTelJ" value="" required="" maxlength="10"/>
                </br>
	 </br> </br>                
                <input type="hidden" name="opt" value="40" />
                <center>
               <input type="submit" value="Guardar" />         
               <a target="body" href="../../../AdministradorController?opt=41">
               <input type="button" value="Cancelar" /></a>                
                </center>
                </form>
            </div>
    </body>
</html>

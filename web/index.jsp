<%-- 
    Document   : index
    Created on : 18-feb-2013, 9:34:36
    Author     : User07
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="Recursos/Estilos/Jstyle.css"/>
        
    <body>
        <h1>Hello World!</h1>
        <a href="modulos/administrador/contenido/administrador_main.jsp">ir a administrador </a></br>
        <a href="modulos/administrador/indexFrame.jsp">ir a Carga docente </a>
        
        <form name="" action="IndexController" id="FormReg">
               <p>Usuario<input type="text" name="AliasJ" value="" placeholder="admin" required/> </p>
               
               <p>Clave  <input type="password" name="ClaveJ" value="" placeholder="123" required=""/>
               
               </p>              
                <input type="hidden" name="opt" value="1" />
                <center>
               <input type="submit" value="Ingresar" />   
               <input type="button" onclick="var gos= confirm('¿Salir de Esta Pagina?');if (gos== true) {   window.close(); };" value="Salir"/>    
                </center>
                </form>
    </body>
</html>

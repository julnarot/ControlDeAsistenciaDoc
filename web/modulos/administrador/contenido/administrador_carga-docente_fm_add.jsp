<%--

    Document   : fm_carga-docente
    Created on : 20/02/2013, 12:12:38 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../../Recursos/Estilos/Jstyle.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>formulario de Carga docente</h1>
         <div id="DivformCargaDoc" >
             <form name="" action="../../../AdministradorController" id="FormReg">
               <p>id</p><input type="text" name="CargaDocenteIDJ" value="" /> 
                </br> 
               <p>Docente</p>
               <input type="text" name="DocenteIDJ" value="" placeholder="Johan Ricardo" required=""/>
               </br>
               <p>Curso</p>
                <input type="text" name="CursoIDJ" value="" placeholder="Matematica I" required=""/>
                </br> 
                <p>Grupo</p>
                <input type="text" name="GrupoIDJ" value="" required=""/>
                </br>                
               
               <p>Periodo</p>
               <select  name="PeriodoIDJ" >
                   <option selected value="PER001">2013-1</option>
                   
                </select></br>
             
		
	 </br> </br>                
                <input type="hidden" name="opt" value="14" />
                <center>
               <input type="submit" value="Guardar" />         
                    <a target="body" href="../../../AdministradorController?opt=13">
               <input type="button" value="Cancelar" /></a>                
                </center>
                </form>
            </div>
    </body>
</html>

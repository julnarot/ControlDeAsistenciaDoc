<%-- 
    Document   : administrador_encargado_report
    Created on : 03/03/2013, 09:01:18 PM
    Author     : JONATAN
--%>
<%@page import="upeu.rrhh.model.Encargado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../../../Recursos/Estilos/Jstyle.css"/>
        <script type="text/javascript" src="../../../Recursos/JavaScript/jquery-latest.js"></script>
        <script type="text/javascript" src="../../../Recursos/JavaScript/jquery.tablesorter.min.js"></script>       
        <script type="text/javascript">
		$(function() {
			$("table").tablesorter({debug: true});
		});
		</script>
    </head>
    <body>
        
        <%
            int numberSon = 1;
            List<Encargado> list = (List<Encargado>) request.getSession().getAttribute("ListEncargados");
        %>
        
             <div id="ReportCarDoc" >
                 <a href="administrador_encargado_form_add.jsp" target="body">Agregar Encargado</a>

                <table border="2" id="repGen">
                    <thead>
                    <tr>
                        <th>Encargado Id</th>
                        <th>#</th>
                        <th>APELLIDOS Y NOMBRES</th>
                        <th>EMAIL</th>
                        <th>MOVIL</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (Encargado dt : list) {
                    %>
                    <tr>
                        <td><%=dt.getEncargadoId()%></td>
                        <td><%=numberSon++%></td>
                        <td><%=dt.getApellido()%> , <%=dt.getNombre()%></td>
                        <td><%=dt.getEmail()%></td>
                        <td><%=dt.getNumtel()%></td>
                    </tr>
                    <%}%>
                        </tbody>
                </table>
            </div> 
    </body>
</html>

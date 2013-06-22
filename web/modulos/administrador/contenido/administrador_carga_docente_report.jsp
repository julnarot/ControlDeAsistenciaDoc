
<%@page import="upeu.rrhh.model.Cargadocente"%>
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
            List<Cargadocente> list = (List<Cargadocente>) request.getSession().getAttribute("ListCargaDocente");
        %>
        <h1>DISTRIBUCIÓN DE LA CARGA DOCENTE</h1>
             <div id="ReportCarDoc" >

                 <a href="administrador_carga-docente_fm_add.jsp" target="body">Ingresar Nueva Carga</a>

                <table border="2" id="repGen">
                    <thead>
                    <tr>
                        <th>CargaDocenteId</th>
                        <th>#</th>
                        <th>GRADO</th>
                        <th>APELLIDOS Y NOMBRES</th>
                        <th>ASIGNATURA</th>
                        <th>CR</th>
                        <th>HT</th>
                        <th>E.A.P</th>
                        <th>C</th>
                        <th>G</th>
                        <th id="thnoStil" colspan="2">OPSIONES</th>

                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (Cargadocente dt : list) {
                           
                    %>
                    <tr>
                        <td><%=dt.getCargadocenteId()%></td>
                        <td><%=numberSon++%></td>
                        <td><%=dt.getGradoAc()%></td>
                        <td><%=dt.getApellidos()%> , <%=dt.getNombres()%></td>
                        <td><%=dt.getCurso()%></td>
                        <td><%=dt.getCreditos()%></td>
                        <td><%=dt.getHoras()%></td>
                        <td><%=dt.getEap()%></td>
                        <td><%=dt.getCiclo()%></td>
                        <td><%=dt.getGrupo()%></td>
                        <td id="thnoStil">Edit</td>
                        <td id="thnoStil">Remove</td>
                        
                    </tr>
                    <%}%>
                        </tbody>
                </table>
            </div>   
    </body>
</html>

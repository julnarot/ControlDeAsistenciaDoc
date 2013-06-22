 


<%@page import="upeu.rrhh.model.Docente"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <body>
        <%
            int numberSon = 1;
            List<Docente> listDocente = (List<Docente>) request.getSession().getAttribute("ListDocente");


        %>
        
            <div id="content" align="center" style="background-color:#97B098; height:600px;width:1000px;float:left;">

                <a href="administrador_docente_form_add.jsp">Ingresar Nueva Docente</a>

                <table border="1" >
                    <tr>
                        <th>#</th>
                        <th>docenteid</th>
                        <th>nombres</th>
                        <th>apellidos</th>
                        <th>fechanac</th>
                        <th>numcelular</th>
                        <th>email</th>
                        <th>sexo</th>
                        <th>gradoac</th>
                        <th>dni</th>
                        <th>estado</th>

                    </tr>

                    <%
                        for (Docente to : listDocente) {
                    %>
                    <tr  >
                        <td><%=numberSon++%></td>
                        <td><%=to.getDocenteid()%></td>
                        <td><%=to.getNombres()%></td>
                        <td><%=to.getApellidos()%></td>
                        <td><%=to.getFechanac()%></td>
                        <td><%=to.getNumcelular()%></td>
                        <td><%=to.getEmail()%></td>
                        <td><%=to.getSexo()%></td>
                        <td><%=to.getGradoac()%></td>
                        <td><%=to.getDni()%></td>
                        <td><%=to.getEstado()%></td>

                    </tr>
                    <%}%>








                </table>


            </div>
        

    </body>
</html>
</html>






 

<%@page import="upeu.rrhh.model.Facultad"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <body>
        <%
            int numberSon = 1;
            List<Facultad> listFacultad = (List<Facultad>) request.getSession().getAttribute("ListFacultad");


        %>
            <div id="content" align="center" style="background-color:#97B098; height:600px;width:1000px;float:left;">

                <a href="administrador_facultad_form_add.jsp">Ingresar Nueva Facultad</a>

                <table border="1" >
                    <tr>
                        <th>#</th>
                        <th>facultadid</th>
                        <th>numtel</th>
                        <th>nombre</th>

                    </tr>

                    <%
                        for (Facultad to : listFacultad) {
                    %>
                    <tr  >
                        <td><%=numberSon++%></td>
                        <td><%=to.getFacultadid()%></td>
                        <td><%=to.getNumtel()%></td>
                        <td><%=to.getNombre()%></td>
                    </tr>
                    <%}%>








                </table>


            </div>
        

    </body>
</html>
</html>






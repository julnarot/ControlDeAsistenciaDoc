  

<%@page import="upeu.rrhh.model.Curso"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <body>
        <%
            int numberSon = 1;
            List<Curso> listCurso = (List<Curso>) request.getSession().getAttribute("ListCurso");


        %>
        <div id="container" style="width:1500px; height:800px ;">
            <div id="header"   style="background-color:#89B4D1; width:1000px; height:125px ;">



            </div>
            <div id="menu" style=" background-color:#8998C3;  height:600px;width:260px;float:left;">
                <nav>
                    <ul>
                        <li><a href="../../AdministradorController?opt=1" >Reporte Facultades</a></li>
                        <li><a href="../../AdministradorController?opt=4" >Reporte Carreras</a></li>
                        <li><a href="../../AdministradorController?opt=7" >Reporte Docente</a></li>
                        <li><a href="../../AdministradorController?opt=10" >Reporte Cursos</a></li>
                        <li><a href="" >Reporte alumnos</a></li> 
                    </ul>
                </nav>
            </div>
            <div id="content" align="center" style="background-color:#97B098; height:600px;width:1000px;float:left;">

                <a href="../../AdministradorController?opt=11">Ingresar Nueva Facultad</a>

                <table border="1" >
                    <tr>
                        <th>#</th>
                        <th>cursoid</th>
                        <th>nombre</th>
                        <th>codigo</th>
                        <th>numcreditos</th>
                        <th>numhoras</th>

                    </tr>

                    <%
                        for (Curso to : listCurso) {
                    %>
                    <tr  >
                        <td><%=numberSon++%></td>
                        <td><%=to.getCursoid()%></td>
                        <td><%=to.getNombre()%></td>
                        <td><%=to.getCodigo()%></td>
                        <td><%=to.getNumcreditos()%></td>
                        <td><%=to.getNumhoras()%></td>

                    </tr>
                    <%}%>








                </table>


            </div>
        </div>

    </body>
</html>
</html>






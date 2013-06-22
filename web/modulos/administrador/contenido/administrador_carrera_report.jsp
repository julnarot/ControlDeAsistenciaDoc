 

<%@page import="upeu.rrhh.dao.FacultadDAO"%>
<%@page import="upeu.rrhh.model.Carrera"%>

<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <body>
        <%
            int numberSon = 1;
            List<Carrera> listCarrera = (List<Carrera>) request.getSession().getAttribute("ListCarrera");
            FacultadDAO facMang = new FacultadDAO();

        %>
            <div id="content" align="center" style="background-color:#97B098; height:600px;width:1000px;float:left;">

                <a href="administrador_carrera_form_add.jsp">Ingresar Nueva Carrera</a>

                <table border="1" >
                    <tr>
                        <th>#</th>
                        <th>carreraId</th>
                        <th>nombre</th>
                        <th>Facultad</th>

                    </tr>

                    <%
                        for (Carrera to : listCarrera) {
                            String a = facMang.finById(to.getFacultadid()).getNombre();

                    %>
                    <tr  >
                        <td><%=numberSon++%></td>
                        <td><%=to.getCarreraid()%></td>
                        <td><%=to.getNombre()%></td>
                        <td><%=a%></td>
                    </tr>
                    <%}%>


                </table>


            </div>
        

    </body>
</html>
</html>






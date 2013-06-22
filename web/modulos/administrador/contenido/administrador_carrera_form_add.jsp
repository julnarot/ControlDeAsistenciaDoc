 

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

                <form action="../../../AdministradorController">


                    <table border="1">
                        <tr>

                            <th>nombre</th>
                            <th><input type="text" name="nombre"/></th>

                        </tr>
                        <tr>

                            <th>Facultad</th>
                            <th>
                                <select name="facultadId">
                                    <%for (Facultad to : listFacultad) {%>
                                    <option value="<%=to.getFacultadid()%>"><%= to.getNombre()%></option>
                                    <%}%>
                                </select>


                            </th>

                        </tr>
                        <tr>


                            <th colspan="2"><input type="hidden" name="opt" value="6"/><input type="submit" value="Aceptar"/></th>

                        </tr>

                    </table>
                </form>


            </div>
        

    </body>
</html>

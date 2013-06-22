  

<%@page import="upeu.rrhh.model.Facultad"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <body>
        <%
            int numberSon = 1;
            List<Facultad> listFacultad = (List<Facultad>) request.getSession().getAttribute("ListFacultad");


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

                <form action="../../AdministradorController">


                    <table border="1">
                        <tr>

                            <th>nombre</th>
                            <th><input type="text" name="nombre"/></th>

                        </tr>
                        <tr>

                            <th>codigo</th>
                            <th><input type="text" name="codigo"/></th>

                        </tr>
                        <tr>

                            <th>numcreditos</th>
                            <th><input type="text" name="numcreditos"/></th>

                        </tr>
                        <tr>

                            <th>numhoras</th>
                            <th><input type="text" name="numhoras"/></th>

                        </tr>

                        <tr>
                            <th colspan="2"><input type="hidden" name="opt" value="14"/><input type="submit" value="Aceptar"/></th>

                        </tr>

                    </table>
                </form>


            </div>
        </div>

    </body>
</html>
</html>






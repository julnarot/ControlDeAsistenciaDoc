 

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
                            <th>nombres :</th>
                            <th><input type="text" name="nombres"/></th>
                        </tr>
                        <tr>
                            <th>apellidos :</th>
                            <th><input type="text" name="apellidos"/></th>
                        </tr>
                        <tr>
                            <th>fechanac :</th>
                            <th><input type="text" name="fechanac"/></th>
                        </tr>
                        <tr>
                            <th>numcelular :</th>
                            <th><input type="text" name="numcelular"/></th>
                        </tr>
                        <tr>
                            <th>email :</th>
                            <th><input type="text" name="email"/></th>
                        </tr>
                        <tr>
                            <th>sexo :</th>
                            <th>Masculino<input type="radio" name="sexo" value="Maculino"/>Femenino<input type="radio" name="sexo" value="Femenino"/></th>
                        </tr>
                        <tr>
                            <th>gradoac :</th>
                            <th><input type="text" name="gradoac"/></th>
                        </tr>
                        <tr>
                            <th>dni :</th>
                            <th><input type="text" name="dni"/></th>
                        </tr>
                        <tr>
                            <th colspan="2"><input type="hidden" name="opt" value="9"/><input type="submit" value="Aceptar"/></th>
                        </tr>
                    </table>
                </form>
            </div>
    </body>
</html>
</html>






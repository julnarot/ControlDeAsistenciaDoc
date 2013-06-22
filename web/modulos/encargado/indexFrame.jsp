
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
<STYLE>

</STYLE>
        </head>
        <body style="padding: 0px 5px 5px 5px">  
            <div style="-moz-border-radius: 10px">
            <table style="width: 100%; height: 100%">
            <tr>
                <td colspan="2" style="background-color: beige">
            
            
                    <div id="xmenu" style="background-color: green" >
                        <iframe  name="head" frameborder="0"  width="100%" scrolling="no" src="head.jsp"></iframe>
            </div>                           
            </td>
            </tr>
            <tr>
            <td style="width: 160px" >
                
            <div id="xmenu" style="height: 500px;  background-color: red "  >
                <iframe  name="menu" frameborder="0" height="300px" width="100%" scrolling="no" src="menu.jsp"></iframe>
            </div>                           
            </td>
            <td>
            <div id="xbody" style=" width: 100%; height: 500px;  background-color: blue" >
            <iframe  name="body" frameborder="0" height="100%" width="100%" src="body.jsp"></iframe>
            </div>                        
            </td>

            </tr>  
            <tr>
                <td colspan="2" style="height: 30px; background-color: yellow">
            <%@include file="copy.jsp" %>
            </td>
            </tr>
            </table> 
            </div>
        </body>
    </html>

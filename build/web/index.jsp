<%-- 
    Document   : index
    Created on : 15/08/2018, 11:04:48
    Author     : Windows 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.API" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nota Mais</title>
    </head>
    <body>
        <%
            //Teste para verificar se a API esta funcionando
            API con = new API("", "GET");
            String json = con.getJsonString();
            out.print(json);
        %>
    </body>
</html>

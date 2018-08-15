<%-- 
    Document   : index
    Created on : 15/08/2018, 11:04:48
    Author     : Windows 7
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Hashtable"%>
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
            //Instanciando Objeto da API
            API con = new API("users/auth", "POST");
            //Agrupando informações para serem enviada para API
            Hashtable<Integer, String> source = new Hashtable<Integer,String>();
            HashMap<String, String> map = new HashMap(source);
            map.put("email", "alef@dotpet.com.br");
            map.put("password", "35924781");
            
            //Pegando retorno da API
            String json = con.getJsonString(map);
            //Printando na Tela o retorno
            out.print(json);
        %>
    </body>
</html>

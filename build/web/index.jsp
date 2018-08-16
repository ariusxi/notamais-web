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
            //Primeiro parametro: Rota da requisição
            //Segundo parametro: Tipo de requisição
            //Terceiro parametro (obrigatório em algumas requisições): Token de sessão
            API con = new API("users/reset-password/5b733feb6ddc15187c1ce1c3", "POST", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjViNzMzZmViNmRkYzE1MTg3YzFjZTFjMyIsImVtYWlsIjoiYWxlZkBkb3RwZXQuY29tLmJyIiwibmFtZSI6IkFsZWYgRmVsaXgiLCJyb2xlcyI6WyJ1c2VyIl0sImlhdCI6MTUzNDQyMzQyNSwiZXhwIjoxNTM0NTA5ODI1fQ.hQesqtR8TD9kDqLHLfYiCzq9fa24ksQNIsXuUsPubHU");
            //Agrupando informações para serem enviada para API
            Hashtable<Integer, String> source = new Hashtable<Integer,String>();
            HashMap<String, String> map = new HashMap(source);
            map.put("password", "123456");
            
            //Pegando retorno da API
            String json = con.getJsonString(map);
            //Printando na Tela o retorno
            out.print(json);
        %>
    </body>
</html>

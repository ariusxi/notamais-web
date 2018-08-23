<%-- 
    Document   : forgot-password
    Created on : 23/08/2018, 12:36:04
    Author     : lucas
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Hashtable"%>
<%@page import="dao.API"%>

<%
    String email = request.getParameter("email");

    API con = new API("users/generate-token", "POST", "");

    Hashtable<Integer, String> source = new Hashtable<Integer, String>();
    HashMap<String, String> map = new HashMap(source);
    map.put("email", email);

    String responseJSON = con.getJsonString(map);

    out.print(responseJSON);
%>

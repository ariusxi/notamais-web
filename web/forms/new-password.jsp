<%-- 
    Document   : new-password
    Created on : 23/08/2018, 17:26:25
    Author     : lucas
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Hashtable"%>
<%@page import="dao.API"%>

<%

    String password = request.getParameter("password");
    String token = request.getParameter("token");

    response.setContentType("text/html;charset=UTF-8");

    String url = "users/update-password/" + token;
    API con = new API(url, "POST", "");

    Hashtable<Integer, String> source = new Hashtable<Integer, String>();
    HashMap<String, String> map = new HashMap(source);
    map.put("password", password);

    String responseJSON = con.getJsonString(map);

    out.print(responseJSON);

%>
<%-- 
    Document   : acess-user
    Created on : 31/08/2018, 09:36:49
    Author     : Isabela
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Hashtable"%>
<%@page import="dao.API"%>

<%

    String id = request.getParameter("id");

    response.setContentType("text/html;charset=UTF-8");

    String url = "users/activate/" +id;
    
    API con = new API(url, "GET", "");

    Hashtable<Integer, String> source = new Hashtable<Integer, String>();
    HashMap<String, String> map = new HashMap(source);
    map.put("id", id);

    String responseJSON = con.getJsonString(map);

    out.print(responseJSON);

%>
<script type="text/javascript">
   window.location.href = "https://notamais.herokuapp.com/active";
 </script>

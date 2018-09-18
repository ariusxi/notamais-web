<%-- 
    Document   : dashboard
    Created on : 24/08/2018, 08:37:12
    Author     : Windows 7
--%>

<jsp:include page="../views/layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <% if (session.getAttribute("roles").equals("user")) { %>
        Dashboard
    <% }else if(session.getAttribute("roles").equals("admin")){ %>
    <p>Usu�rios cadastrados</p>
        <canvas id="user-chart"></canvas>
    <% } %>
</div>
<jsp:include page="../views/layout/footer-auth.jsp" />

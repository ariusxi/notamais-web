<%-- 
    Document   : dashboard
    Created on : 24/08/2018, 08:37:12
    Author     : Windows 7
--%>

<jsp:include page="../views/layout/header-auth.jsp" />
<<<<<<< HEAD
        <div class="col-sm-12 col-md-9 col-lg-9">
            Dashboard
        </div>
<div class="space-footer"></div>
<jsp:include page="../views/layout/footer.jsp" />
=======
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <% if (session.getAttribute("roles").equals("user")) { %>
        Dashboard
    <% }else if(session.getAttribute("roles").equals("admin")){ %>
    <p>Usuários cadastrados</p>
        <canvas id="user-chart"></canvas>
    <% } %>
</div>
<jsp:include page="../views/layout/footer-auth.jsp" />
>>>>>>> 0612e05f7c0968c07619100abf0fc9aac8c73d8b

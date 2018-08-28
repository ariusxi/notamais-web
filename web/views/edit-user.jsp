<%-- 
    Document   : edit-user
    Created on : Aug 27, 2018, 10:16:30 PM
    Author     : lucas
--%>

<jsp:include page="layout/header-auth.jsp"/>
<div class="col-sm-12 col-md-9 col-lg-9">
    <div class="card">
        <div class="card-body">
            <form id="formEditUser">
                <div class="form-group ">
                    <label>Nome:</label>
                    <input type="text" class="form-control w-50" value="<%= session.getAttribute("name")%>"/>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="text" class="form-control w-50" value="<%= session.getAttribute("email")%>"/>
                </div>
                <input type="submit" class="btn btn-dark" value="Editar">
            </form>
        </div>
    </div>
</div>
<jsp:include page="layout/footer.jsp"/>

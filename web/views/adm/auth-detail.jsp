<%-- 
    Document   : auth-detail
    Created on : 15/10/2018, 11:15:50
    Author     : lucas
--%>

<jsp:include page="../layout/header-auth.jsp" />

<div class="col-sm-12 col-md-12 col-lg-12 mt-5">
    <div class="col-sm-12 col-md-12 col-md-4">
        <div class="card">
            <div class="card-body cardAuthDetail">
                <h3>Detalhes</h3>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="idAuth">ID</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="idAuth" name="idAuth" readonly/>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="datePayment">Data/Horário</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="dateAuth" name="dateAuth" readonly/>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="typePayment">IP</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="ipAuth" name="ipAuth" readonly/>
                    </div>
                </div>
                <h3>Usuário</h3>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="idUser">ID</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="idUser" name="idUser" readonly/>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="emailUser">Email</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="emailUser" name="emailUser" readonly/>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="nameUser">Nome</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="nameUser" name="nameUser" readonly/>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="typeUser">Tipo</label>
                        <input type="text" class="form-control-plaintext text-light h4" id="typeUser" name="typeUser" readonly/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer-auth.jsp" />

<script>

    var authDetail = <%= request.getAttribute("auth-detail")%>;
    var userDetail = <%= request.getAttribute("user-detail")%>;
  
    var date = new Date(authDetail.date);

    $(".cardAuthDetail #idAuth").val(authDetail._id);
    $(".cardAuthDetail #dateAuth").val(date.toLocaleDateString() + " " + date.toLocaleTimeString());
    $(".cardAuthDetail #ipAuth").val(authDetail.ip);
    $(".cardAuthDetail #sessionAuth").val(authDetail.session);

    $(".cardAuthDetail #idUser").val(userDetail.user._id);
    $(".cardAuthDetail #emailUser").val(userDetail.user.email);
    $(".cardAuthDetail #nameUser").val(userDetail.user.name);

    switch (userDetail.user.roles[0]) {
        case "admin":
            $(".cardAuthDetail #typeUser").val("Administrador");
            break;
        case "user":
            $(".cardAuthDetail #typeUser").val("Usu?rio");
            break;
        case "counter":
            break;
            $(".cardAuthDetail #typeUser").val("Contador");
        case "employee":
            break;
            $(".cardAuthDetail #typeUser").val("Funcion?rio");
        default:
            $(".cardAuthDetail #typeUser").val(userDetail.user.roles);
            break;
    }

</script>
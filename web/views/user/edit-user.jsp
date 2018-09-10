<%-- 
    Document   : edit-user
    Created on : 28/08/2018, 17:04:32
    Author     : lucas
--%>

<jsp:include page="../layout/header-auth.jsp"/>
<div class="col-sm-12 col-md-9 col-lg-9">
    <div class="card">
        <div class="card-body">
            <form id="formEditUser">
                <div class="form-row">
                    <div class="form-group col-md-6 ">
                        <label>Nome:</label>
                        <input type="text" class="form-control" id="name" name="name" value="<%= session.getAttribute("name")%>" onkeydown="onlyLetter(this)"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Email:</label>
                        <input type="text" class="form-control" id="email" name="email" value="<%= session.getAttribute("email")%>"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label>Nickname:</label>
                        <input type="text" class="form-control" id="nickname" name="nickname"/>
                    </div>
                    <div class="form-group col-md-4">
                        <label>CPF:</label>
                        <input type="text" class="form-control cpf" id="cpf" name="cpf"/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Gênero:</label>
                        <select class="form-control" id="gender" name="gender">
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label>Nome fantasia:</label>
                        <input type="text" class="form-control" id="namefantasy" name="namefantasy"/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>CNPJ</label>
                        <input type="text" class="form-control cnpj" id="cnpj" name="cnpj"/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>IE</label>
                        <input type="text" class="form-control" id="ie" name="ie"/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Telefone</label>
                        <input type="text" class="form-control" id="telephone" name="telephone"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Nova senha:</label>
                        <input type="password" class="form-control" id="newpassword" name="newpassword"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Confirme a nova senha:</label>
                        <input type="password" class="form-control" id="confirmnewpassword" name="confirmnewpassword"/>
                    </div>
                </div>
                <input type="submit" class="btn btn-dark" value="Editar">
            </form>
            <div class="alert alert-info mb-0 mt-2" id="message">

            </div>
        </div>
    </div>
</div>
       

<jsp:include page="../layout/footer.jsp"/>

<style rel="stylesheet">
    #message{
        display: none;
    }
</style>

<script type="text/javascript">

    $(function () {
        $('#name').bind('keydown', onlyLetter);
        $('#namefantasy').bind('keydown', onlyLetter);
        $('#cpf').bind('keydown', onlyNumber);
        $('#cnpj').bind('keydown', onlyNumber);
        $('#ie').bind('keydown', onlyNumber);
        $('#telephone').bind('keydown', onlyNumber);
    });


    $(document).ready(function () {

        var userData = '<%= request.getAttribute("userData")%>'
        var userDataJson = JSON.parse(userData);

        var userProfile = userDataJson.profile[0];
        var userClient = userDataJson.client[0];
        var user = userDataJson.user;

        //Profile data
        $('#idUser').val(user._id);
        $('#nickname').val(userProfile.nickname);
        $('#cpf').val(userProfile.cpf);
        if (userProfile.gender == "M") {
            $("#gender").append("<option value='" + userProfile.gender + "' selected>" + userProfile.gender + "</option>");
            $("#gender").append("<option value='F'>F</option>");
        } else if (userProfile[0].gender == "F") {
            $("#gender").append("<option value='" + userProfile.gender + "' selected>" + userProfile.gender + "</option>");
            $("#gender").append("<option value='M'>M</option>");
        }

        //Client data
        $('#namefantasy').val(userClient.fantasia);
        $('#cnpj').val(userClient.cnpj);
        $('#ie').val(userClient.ie);
        $('#telephone').val(userClient.telephone);

    });

    $('#formEditUser').submit(function (event) {
        event.preventDefault();
        var form = $(this);
        $.ajax({

            url: "edit-user",
            method: "post",
            data: form.serialize(),
            beforeSend: function () {
                $('#message').css('display', 'block');
                $('#message').html("Aguarde...");
            },
            success: function (data) {
                $('#message').html(data);
            },
            error: function (error) {
                $('#message').html(error.responseText);
            }

        });

    });

</script>
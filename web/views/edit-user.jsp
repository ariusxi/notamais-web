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
                <div class="form-row">
                    <input type="hidden" id="idUser" name="idUser" />
                    <div class="form-group col-md-6 ">
                        <label>Nome:</label>
                        <input type="text" class="form-control" id="name" name="name" value="<%= session.getAttribute("name")%>"/>
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
                        <input type="text" class="form-control" id="cpf" name="cpf"/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Gênero:</label>
                        <select class="form-control" id="gender" name="gender">
                        </select>
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
<jsp:include page="layout/footer.jsp"/>

<style rel="stylesheet">
    #message{
        display: none;
    }
</style>

<script type="text/javascript">

    $(document).ready(function () {
        var userData = '<%= request.getAttribute("userData")%>'
        var userDataJson = JSON.parse(userData)[0];

        $('#formEditUser #idUser').val(userDataJson._id);
        $('#nickname').val(userDataJson.nickname);
        $('#cpf').val(userDataJson.cpf);
        if (userDataJson.gender == "M") {
            $("#gender").append("<option value='" + userDataJson.gender + "' selected>" + userDataJson.gender + "</option>");
            $("#gender").append("<option value='F'>F</option>");
        } else {
            $("#gender").append("<option value='" + userDataJson.gender + "' selected>" + userDataJson.gender + "</option>");
            $("#gender").append("<option value='M'>M</option>");
        }

    });

    $('#formEditUser').submit(function (event) {
        event.preventDefault();
        var form = $(this);
        $.ajax({

            url: "user-edit",
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
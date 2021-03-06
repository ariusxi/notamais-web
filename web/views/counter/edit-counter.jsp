<%-- 
    Document   : edit-user
    Created on : Aug 27, 2018, 10:16:30 PM
    Author     : lucas
--%>

<jsp:include page="../layout/header-auth.jsp"/>
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <h3>Imagem de Perfil</h3>
    <div class="col-sm-12 col-md-12 col-md-4">
        <div class="card">
            <div class="card-body">
                <form id="imageUser" action="" method="POST" enctype="multipart/formdata">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                            <div class="fileinput-new thumbnail img-circle img-raised">
                                <% if(session.getAttribute("image").equals("default")){ %>
                                <img src="${pageContext.request.contextPath}/assets/img/default-user.png">
                                <% }else{ %>
                                <img src="<%= session.getAttribute("image") %>">
                                <% } %>
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail img-circle img-raised" style=""></div>
                            <div>
                                <span class="btn btn-raised btn-round btn-default btn-file">
                                    <span class="fileinput-new">Alterar Foto</span>
                                    <span class="fileinput-exists">Alterar</span>
                                    <input type="hidden" id="token" value="<% out.print(session.getAttribute("token")); %>">
                                    <input type="hidden" id="user" value="<% out.print(session.getAttribute("id")); %>">
                                    <input type="file" name="file" id="file">
                                <div class="ripple-container"></div></span>
                            </div>
                            <input type="submit" class="btn btn-primary btn-round" value="ATUALIZAR IMAGEM"/>
                        </div>
                        <div id="feedback-image"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <h3>Dados de Perfil</h3>
    <div class="card">
        <div class="card-body">
            <form id="formEditCounter">
                <div class="form-row">
                    <input type="hidden" id="idCounter" name="idCounter" />
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
                        <input type="text" class="form-control cpf" id="cpf" name="cpf"/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>G�nero:</label>
                        <select class="form-control fix-select-option" id="gender" name="gender">
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

<jsp:include page="../layout/footer-auth.jsp"/>

<style rel="stylesheet">
    #message{
        display: none;
    }
</style>

<script type="text/javascript">

    $(function () {
        $('#name').bind('keydown', onlyLetter);
        $('#cpf').bind('keydown', onlyNumber);
    });

    $(document).ready(function () {
        var counterData = '<%= request.getAttribute("counterData")%>'
        var counterDataJson = JSON.parse(counterData);

        var counter = counterDataJson.user;
        var counterProfile = counterDataJson.profile[0];

        $('#idCounter').val(counter._id);
        $('#nickname').val(counterProfile.nickname);
        $('#cpf').val(counterProfile.cpf);
        if (counterProfile.gender == "M") {
            $("#gender").append("<option value='" + counterProfile.gender + "' selected>" + counterProfile.gender + "</option>");
            $("#gender").append("<option value='F'>F</option>");
        } else {
            $("#gender").append("<option value='" + counterProfile.gender + "' selected>" + counterProfile.gender + "</option>");
            $("#gender").append("<option value='M'>M</option>");
        }

    });

    $('#formEditCounter').submit(function (event) {
        event.preventDefault();
        var form = $(this);
        console.log(form.serialize());
        $.ajax({

            url: "edit-counter",
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
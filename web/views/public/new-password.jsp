<%-- 
    Document   : new-password
    Created on : 23/08/2018, 15:21:24
    Author     : lucas
--%>

<jsp:include page="../layout/header.jsp" />
<div class="page-header header-filter" style="background-image: url('http://demos.creative-tim.com/material-bootstrap-wizard/assets/img/wizard-book.jpg'); background-size: cover; background-position: top center;">
    <div class="container">
        <div class="row mt-3 justify-content-center">
            <div class="col-sm-12 col-md-4">
                <div class="card card-login">
                    <form id="formNewPassword" class="form" method="POST" action="">
                        <div class="card-header card-header-primary text-center">
                            <h4>Redifinição de Senha</h4>
                        </div>
                        <div class="card-body">
                            <span class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">mail</i>
                                        </span>
                                    </div>
                                    <input type="password" name="password" id="password" class="form-control" placeholder="Nova senha...">
                                </div>
                            </span>
                            <span class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">mail</i>
                                        </span>
                                    </div>
                                    <input type="password" name="confirmpassword" id="confirmpassword" class="form-control" placeholder="Confirme a nova senha...">
                                </div>
                            </span>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <input type="submit" class="btn btn-primary login btn-round  btn-block" value="Salvar"/>
                        </div>
                        <div class="alert alert-info mt-2 mb-0" id="message">

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" />

<style rel="stylesheet">
    #message{
        display: none;
    }
</style>

<script type="text/javascript">

    $("#formNewPassword").submit(function (e) {
        e.preventDefault();

        var password = $('#password').val();
        var cpassword = $('#confirmpassword').val();

        if(password == "" || cpassword == ""){
            $('#message').css('display', 'block');
            $('#message').html('Você deve preencher todos os campos');
        }

        if (password != cpassword) {
            $('#message').css('display', 'block');
            $('#message').html('As senhas devem ser iguais');
            return false;
        }
        
        if(password.length < 6){
            $("#message").css('display', 'block');
            $("#message").html("A sua senha não pode ser menor que 6 digitos");
            return false;
        }

        var form = $(this);
        var token = location.search.split('token=')[1];
        var formData = form.serialize() + "&token=" + token;

        $('#message').css('display', 'none');
        setNewPassword(formData);

    });

    function setNewPassword(formData) {
        $.ajax({
            url: "../../forms/new-password.jsp",
            method: "post",
            data: formData,
            beforeSend: function () {
                $('#message').css('display', 'block');
                $('#message').html('Aguarde...');
            },
            success: function (data) {
                var dataJSON = JSON.parse(data);
                $('#message').css('display', 'block');
                $('#message').html(dataJSON.message);
                if (dataJSON.message == "Senha atualizada com sucesso") {
                    setTimeout(function () {
                        $(location).attr('href','/notamais-web/');
                    }, 2000);
                }
            },
            error: function (error) {
                $('#message').css('display', 'block');
                $('#message').html(error.responseText);
            }
        });
    }


</script>
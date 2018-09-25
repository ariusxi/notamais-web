<%-- 
    Document   : new-password
    Created on : 23/08/2018, 15:21:24
    Author     : lucas
--%>

<jsp:include page="../layout/header.jsp" />
<nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
        <div class="navbar-translate">
            <a class="navbar-brand">
                Nota+ 
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="sr-only">Toggle navigation</span>
                <span class="navbar-toggler-icon"></span>
                <span class="navbar-toggler-icon"></span>
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Administrador</a>
                </li>
              <!--  <li class="nav-item">
                    <a class="nav-link" href="#">SST</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Exames</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">eSocial</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Gerencia</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Receber</a>
                </li>-->
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/register">Cadastre-se</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="page-header header-filter" style="background-image: url('${pageContext.request.contextPath}/assets/img/background.jpg');
        background-size: cover; background-position: top center;">
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
<%-- 
    Document   : forgot-password
    Created on : 23/08/2018, 10:43:32
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
        background-size: cover;background-position: top center;">
    <div class="container">
        <div class="row mt-3 justify-content-center">
            <div class="col-sm-12 col-md-4">
                <div class="card card-login">
                    <form id="formForgotPassword" class="form" method="POST" action="">
                        <div class="card-header card-header-primary text-center">
                            <h4>Esqueci minha senha</h4>
                        </div>
                        <div class="card-body">
                            <p class="text-center m-0">Digite o seu endereço de e-mail.</p>
                            <p class="text-center m-0">Nós enviaremos um link para redefinir a senha da sua conta.</p>
                            <span class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">mail</i>
                                        </span>
                                    </div>
                                    <input type="email" name="email" class="form-control" placeholder="Email...">
                                </div>
                            </span>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <input type="submit" class="btn btn-primary login btn-round  btn-block" value="Enviar"/>
                        </div>
                        <div class="alert alert-info mt-2 mb-0" id="message">

                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <a href="login" class="btn btn-primary login btn-round btn-block btn-link">Voltar</a>
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

    $("#formForgotPassword").submit(function (e) {
        e.preventDefault();

        var form = $(this);

        $.ajax({
            url: "forgot-password",
            method: "post",
            data: form.serialize(),
            beforeSend: function () {
                $('#message').css('display', 'block');
                $('#message').html('Aguarde...');
            },
            success: function (data) {
                var dataJSON = JSON.parse(data);
                $('#message').css('display', 'block');
                $('#message').html(dataJSON.message+'<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><i class="material-icons">clear</i></span></button>').addClass('alert-info').removeClass('alert-danger');
            },
            error: function (error) {
                $('#message').css('display', 'block');
                $('#message').html(error.responseText+'<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><i class="material-icons">clear</i></span></button>').addClass('alert-danger').removeClass('alert-info');
            }
        });

    });

</script>

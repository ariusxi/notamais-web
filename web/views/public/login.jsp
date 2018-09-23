<%-- 
    Document   : login
    Created on : 24/08/2018, 08:37:12
    Author     : lucas
--%>

<jsp:include page="../layout/header.jsp" />

<div class="page-header header-filter" style="background-image: url('http://demos.creative-tim.com/material-bootstrap-wizard/assets/img/wizard-book.jpg'); background-size: cover; background-position: top center;">
    
    <div class="container">
         <br>
                    <br> <br>
                   
        <div class="row mt-3 justify-content-center">
            <div class="col-sm-12 col-md-4">
                <div class="card card-login">
                    
                    <form id="formLogin" class="form" method="POST" action="">
                        <div class="card-header card-header-primary text-center">
                            <h4>Entrar no Nota+</h4>
                        </div>
                        <div class="card-body">
                            <span class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">mail</i>
                                        </span>
                                    </div>
                                    <input type="email" name="login" class="form-control" placeholder="Email...">
                                </div>
                            </span>
                            <span class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">lock_outline</i>
                                        </span>
                                    </div>
                                    <input type="password" name="password" class="form-control" placeholder="Senha...">
                                </div>
                            </span>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <input type="submit" class="btn btn-primary login btn-round  btn-block" value="Entrar"/>
                        </div>
                        <div class="alert alert-info mt-2 mb-0" id="message">

                        </div>
                        <div class="footer text-center">
                            <a href="forgot-password" class="btn btn-primary btn-link btn-wd btn-link">Esqueci minha senha</a>
                            <a href="register" class="btn btn-primary btn-link btn-wd btn-link">Cadastre-se</a>
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

    $("#formLogin").submit(function (e) {
        e.preventDefault();

        var form = $(this);
        var formData = form.serialize();

        setLogin(formData);

    });

    function setLogin(formData) {
        $.ajax({
            url: "login",
            method: "post",
            data: formData,
            beforeSend: function () {
                $('#message').css('display', 'block');
                $('#message').html('Aguarde...');
            },
            success: function (data) {

                var dataJSON = JSON.parse(data);
                if (dataJSON.message != null) {
                    $('#message').css('display', 'block');
                    $('#message').html('Login ou Senha invalidos<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><i class="material-icons">clear</i></span></button>').addClass('alert-danger').removeClass('alert-info');
                } else {
                    $('#message').css('display', 'block');
                    $('#message').html('Login bem sucedido.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><i class="material-icons">clear</i></span></button>').addClass('alert-info').removeClass('alert-danger');
                    setTimeout(function () {
                        if(dataJSON.firstlogin == true && dataJSON.roles[0] == "user"){
                            $(location).attr('href', '/notamais-web/first-login');
                        }else{
                            $(location).attr('href', '/notamais-web/dashboard');
                        }
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

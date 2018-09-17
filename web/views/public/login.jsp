<%-- 
    Document   : login
    Created on : 24/08/2018, 08:37:12
    Author     : lucas
--%>

<jsp:include page="../layout/header.jsp" />
<div class="container">
    <div class="row mt-3 justify-content-center">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-header">
                    <div class="h5 text-left mb-0">Entrar no Nota+</div>    
                </div>
                <div class="card-body">
                    <p class="text-center">
                        <i class="fa fa-fw fa-sign-in fa-4x"></i>
                    </p>
                    <form id="formLogin" class="mt-4">
                        <div class="form-group">
                            <label for="login">Email</label>
                            <input type="text" class="form-control" name="login" id="login" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Senha</label>
                            <input type="password" class="form-control" name="password" id="password" required>
                        </div>
                        <div class="text-center mb-3" >
                            <a href="forgot-password"style="color: orange">Esqueci minha senha</a>
                        </div>
                        <input type="submit" value="Entrar" class="btn btn-secondary form-control">
                    </form>
                    <div class="alert alert-info mt-2 mb-0" id="message">

                    </div>
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
                    $('#message').html(dataJSON.message);
                } else {
                    $('#message').css('display', 'block');
                    $('#message').html('Login bem sucedido.');
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

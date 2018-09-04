<%-- 
    Document   : new-password
    Created on : 23/08/2018, 15:21:24
    Author     : lucas
--%>

<jsp:include page="../layout/header.jsp" />
<div class="container">
    <div class="row mt-3 justify-content-center">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-header">
                    <div class="h5 text-left mb-0">Redefinição de Senha</div>    
                </div>
                <div class="card-body">
                    <p class="text-center">
                        <i class="fa fa-fw fa-key fa-4x"></i>
                    </p>
                    <form id="formNewPassword" class="mt-4">
                        <div class="form-group">
                            <label for="password">Nova senha</label>
                            <input type="password" class="form-control" name="password" id="password" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmpassword">Confirme a nova senha</label>
                            <input type="password" class="form-control" name="confirmpassword" id="confirmpassword" required>
                        </div>
                        <input type="submit" value="Salvar" class="btn btn-secondary form-control">
                    </form>
                    <div class="alert alert-info mt-2 mb-0" id="message"></div>
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
                        $(location).attr('href','/');
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
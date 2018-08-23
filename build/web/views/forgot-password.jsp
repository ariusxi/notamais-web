<%-- 
    Document   : forgot-password
    Created on : 23/08/2018, 10:43:32
    Author     : lucas
--%>

<jsp:include page="../views/layout/header.jsp" />
<div class="container">
    <div class="row mt-3 justify-content-center">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-header">
                    <div class="h5 text-left mb-0">Esqueci minha senha</div>    
                </div>
                <div class="card-body">
                    <p class="text-center">
                        <i class="fa fa-fw fa-life-ring fa-4x"></i>
                    </p>
                    <p class="text-center m-0">Digite o seu endereço de e-mail.</p>
                    <p class="text-center m-0">Nós enviaremos um link para redefinir a senha da sua conta.</p>
                    <form action="../forms/forgot-password.jsp" method="POST" class="mt-4">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" id="email">
                        </div>
                        <input type="submit" value="Enviar" class="btn btn-primary form-control">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../views/layout/footer.jsp" />

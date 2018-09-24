<%-- 
    Document   : forgot-password
    Created on : 23/08/2018, 10:43:32
    Author     : lucas
--%>

<jsp:include page="../layout/header.jsp" />
<div class="page-header header-filter" style="background-image: url('https://pixabay.com/get/e131b8072af11c22d9584518a33219c8b66ae3d01ab6164495f5c17c/student-849825_1920.jpg');
        background-size: cover; background-position: top center;">
    <div class="container">
        <div class="row mt-3 justify-content-center">
            <div class="col-sm-12 col-md-4">
                <div class="card card-login">
                    <form id="formForgotPassword" class="form" method="POST" action="">
                        <div class="card-header card-header-primary text-center">
                            <h4>Usuário Ativo!</h4>
                        </div>
                        <div class="card-body">
                            <p class="text-center m-0">Usuário foi ativo com sucesso.</p> <br>
                            <p class="text-center m-0">Seja Bem vindo ao Nota Mais! <i class='far fa-smile-o '></i>  </p>
                            <span class="bmd-form-group">
                                <div class="input-group">
                       <p class="text-center m-0">Economize tempo na gestão de documentos fiscais, acesse o Nota+ </p>

                                  
                                </div>
                            </span>
                        </div>
                       
                        <div class="alert alert-info mt-2 mb-0" id="message">

                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12"> <BR>
                            <a href="login" class="btn btn-primary login btn-round  btn-block" >Entrar</a>
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


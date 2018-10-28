

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
               <!--
                <li class="nav-item active">
                    <a class="nav-link" href="#">Administrador</a>
                </li>
               -->
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
<div class="page-header header-filter" style="background-image: url('${pageContext.request.contextPath}/assets/img/background.jpg'); background-position: top center;">
    
    <div class="container">      
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
                            <center>
                                <div class="g-recaptcha" id="r_c" data-callback="callback" data-sitekey="6LfqDXIUAAAAAFCdsYg6fL4rX00CximlpeN9Ftwk"></div>
                            </center>
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

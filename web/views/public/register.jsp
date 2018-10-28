<jsp:include page="../layout/header.jsp" />
<style>
    body{
        background-image: url('${pageContext.request.contextPath}/assets/img/background.jpg');
        background-position: center center;
	background-size: cover;
	background-attachment: fixed;
    }   
</style>

<div class="container">
    <div class="row mt-12 justify-content-center text-center">
        <div class="col-sm-12 col-md-4 col-lg-4">
            <% if(request.getParameter("plan") != null){ %>
            <input type="hidden" name="plan" id="plan" value="<% out.print(request.getParameter("plan")); %>"/>
            <div class="card card-pricing bg-primary">
                <div class="card-body text-center">
                    <div class="icon">
                        <i class="material-icons">business</i>
                    </div>
                    <h3 class="card-title"></h3>
                    <p class="card-description">
                        
                    </p>
                    <a href="index.jsp" class="btn btn-white btn-round">Alterar plano</a>
                </div>
            </div>
            <% }else{ %>
            <input type="hidden" name="plan" id="plan"/>
            <% } %>
        </div>
    </div>
    <div class="row mt-12 justify-content-center text-center user-register">
        <div class="col-sm-12 col-md-4 col-lg-4">
            <div class="card card-login">
                <div class="card-header card-header-primary text-center">
                    <div class="col-sm-12 col-md-12 col-lg-12 text-center">
                        <h5 class="title-register">Escolha o tipo de usuário</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 col-md-6 col-lg-6 user-register">
                        <a href="" class="open-register" id="user">
                            <h1><i class="fas fa-user"></i></h1>
                            <p>Usuário</p>
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-6 col-lg-6 counter-register">
                        <a href="" class="open-register" id="counter">
                            <h1><i class="fas fa-user-tie"></i></h1>
                            <p>Contador</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row user mt-12 justify-content-center">
        <div class="col-sm-12 col-md-6 col-lg-6">
            <div class="card card-login">
                <form action="" method="POST" id="user-register">
                    <div class="card-header card-header-primary text-center">
                        <h5 class="title-register">Cadastro de Usuário</h5>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label for="fullname">Nome de Usuário</label>
                                    <input type="text" class="form-control"  placeholder="Nome Completo" name="fullname" id="fullname">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" placeholder="Email" name="email" id="email">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label for="nickname">Nickname</label>
                                    <input type="text" class="form-control" placeholder="Nickname" name="nickname" id="nickname">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="cpf">CPF</label>
                                    <input type="text" class="form-control cpf" placeholder="CPF" name="cpf" id="cpf">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="nickname">Gênero</label>
                                    <select class="form-control" id="gender" name="gender">
                                        <option value="">Escolha o seu gênero</option>
                                        <option value="M">Masculino</option>
                                        <option value="F">Feminino</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="password">Senha</label>
                                    <input type="password" class="form-control" placeholder="Senha" name="password" id="password">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="confirm">Confirme sua Senha</label>
                                    <input type="password" class="form-control" placeholder="Confirme sua Senha" name="confirm" id="confirm">
                                </div>
                            </div>
                            <hr/>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <h5 class="title-register">Dados da Empresa</h5>
                                <hr/>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="fantasia">Nome Fantasia</label>
                                    <input type="text" class="form-control"  placeholder="Nome Fantasia" name="fantasia" id="fantasia">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="cnpj">CNPJ</label>
                                    <input type="text" class="form-control cnpj"  placeholder="CNPJ" name="cnpj" id="cnpj">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="ie">IE</label>
                                    <input type="text" class="form-control ie"  placeholder="IE" name="ie" id="ie">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="telephone">Telefone</label>
                                    <input type="text" class="form-control telephone"  placeholder="Telefone" name="telephone" id="telephone">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12 text-center">
                                <input type="submit" class="btn btn-primary btn-round" value="Cadastrar">
                                <input type="button" class="btn btn-link back-type" value="Voltar">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row counter mt-12 justify-content-center">
        <div class="col-sm-12 col-md-6 col-lg-6">
            <div class="card card-login">
                <form action="" method="POST" id="counter-register">
                    <div class="card-header card-header-primary text-center">
                        <h5 class="title-register">Cadastro de Contador</h5>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label for="fullname">Nome de Usuário</label>
                                    <input type="text" class="form-control"  placeholder="Nome Completo" name="fullname" id="fullname">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" placeholder="Email" name="email" id="email">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="nickname">Nickname</label>
                                    <input type="text" class="form-control" placeholder="Nickname" name="nickname" id="nickname">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="cpf">CPF</label>
                                    <input type="text" class="form-control cpf" placeholder="CPF" name="cpf" id="cpf">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <div class="form-group">
                                    <label for="nickname">Gênero</label>
                                    <select class="form-control" id="gender" name="gender">
                                        <option value="">Escolha o seu gênero</option>
                                        <option value="M">Masculino</option>
                                        <option value="F">Feminino</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="password">Senha</label>
                                    <input type="password" class="form-control" placeholder="Senha" name="password" id="password">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label for="confirm">Confirme sua Senha</label>
                                    <input type="password" class="form-control" placeholder="Confirme sua Senha" name="confirm" id="confirm">
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12 text-center">
                                <input  type="submit" class="btn btn-primary btn-round" value="Cadastrar">
                                <input type="button" class="btn btn-link back-type" value="Voltar">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row mt-12 justify-content-center text-center">
        <div class="alert alert-info mt-2 mb-0 col-sm-12 col-md-4 col-lg-4" id="message" style="margin-bottom:100px !important;">
        </div>
    </div>
</div>
<div class="space-footer"></div>
<jsp:include page="../layout/footer.jsp" />

<script type="text/javascript">

    $(function () {
        $('#user-register #fullname').bind('keydown', onlyLetter);
        $('#counter-register #fullname').bind('keydown', onlyLetter);
        $('#fantasia').bind('keydown', onlyLetter);
        $('#cpf').bind('keydown', onlyNumber);
        $('#cnpj').bind('keydown', onlyNumber);
        $('#ie').bind('keydown', onlyNumber);
        $('#telephone').bind('keydown', onlyNumber);
    });

</script>
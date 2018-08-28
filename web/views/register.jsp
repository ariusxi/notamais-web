<jsp:include page="../views/layout/header.jsp" />
<div class="container">
    <div class="row mt-12 justify-content-center text-center user-register">
        <div class="col-sm-12 col-md-12 col-lg-12 text-center">
            <h1 class="title-register">Escolha o tipo de usuário</h1>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-6">
            <a href="" class="open-register" id="user">
                <h1 style="color: #4E4D4C"><i class="fas fa-user"></i></h1>
                <p style="color: orange">Usuário</p>
            </a>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-6 text-center  counter-register">
            <a href="" class="open-register" id="counter">
                <h1 style="color: #4E4D4C"><i class="fas fa-user-tie"></i></h1>
                <p style="color: orange">Contador</p>
            </a>
        </div>
    </div>
    <div class="row user">
        <form action="" method="POST" id="user-register">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <h1 class="title-register">Cadastro de Usuário</h1>
                </div>
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
                <hr/>
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <h3 style="color: orange" class="title-register">Dados da Empresa</h3>
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
                        <input type="text" class="form-control"  placeholder="IE" name="ie" id="ie">
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-lg-6">
                    <div class="form-group">
                        <label for="telephone">Telefone</label>
                        <input type="text" class="form-control"  placeholder="Telefone" name="telephone" id="telephone">
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <input type="submit" class="btn btn-secondary" value="Cadastrar">
                    <input type="button" class="btn btn-secondary back-type" value="Voltar">
                   
                </div>
            </div>
        </form>
    </div>
    <div class="row counter">
        <form action="" method="POST" id="counter-register">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <h1 class="title-register">Cadastro de Contador</h1>
                </div>
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
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <input  type="submit" class="btn btn-secondary" value="Cadastrar">
                    <input type="button" class="btn btn-secondary back-type" value="Voltar">
                </div>
            </div>
                      
        </form>
          <hr/>
    </div>
    <div class="alert alert-info mt-2 mb-0" id="message" style="margin-bottom:100px !important;">

    </div>
</div>
<div class="space-footer"></div>
<jsp:include page="../views/layout/footer.jsp" />
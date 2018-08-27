<jsp:include page="../views/layout/header-auth.jsp" />
    <div class="col-sm-12 col-md-9 col-lg-9">
        <ul class="nav nav-tabs">
            <li class="active">
                <a  href="#list" data-toggle="tab">Lista de Funcionarios</a>
            </li>
            <li>
                <a href="#register" data-toggle="tab">Cadastrar Funcion�rio</a>
            </li>
        </ul>
        <div class="tab-content ">
            <div class="tab-pane active" id="list">
                Lista de Funcion�rios
            </div>
            <div class="tab-pane" id="register">
            <form action="" method="POST" id="employee-register">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h1 class="title-register">Cadastro de Funcion�rio</h1>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="name">Nome do Funcion�rio</label>
                            <input type="text" class="form-control"  placeholder="Nome Completo" name="name" id="name">
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
                            <label for="nickname">G�nero</label>
                            <select class="form-control" id="gender" name="gender">
                                <option value="">Escolha o seu g�nero</option>
                                <option value="M">Masculino</option>
                                <option value="F">Feminino</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <input type="submit" class="btn btn-primary" value="Cadastrar">
                        <input type="button" class="btn btn-primary back-type" value="Voltar">
                    </div>
                </div>
            </form>
            <div class="alert alert-info mt-2 mb-0" id="message" style="margin-bottom:100px !important;">

            </div>
        </div>
    </div>
</div>
<jsp:include page="../views/layout/footer.jsp" />
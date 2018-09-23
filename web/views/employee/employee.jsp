<jsp:include page="../layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <ul class="nav nav-tabs">
        <li class="active">
            <a class="nav-link active" href="#list" data-toggle="tab">Lista de Funcionarios</a>
        </li>
        <li>
            <a  class="nav-link" href="#register" data-toggle="tab">Cadastrar Funcionário</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="list">
            <h2 class="title-register">Lista de Funcionários</h2>
            <div class="table-responsive">
                <table id="employee-list" class="display table">
                    <thead>
                        <tr>
                            <td>Nome</td>
                            <td>Gênero</td>
                            <td>Nickname</td>
                            <td>CPF</td>
                            <td>Ações</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>

                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane" id="register">
            <form action="" method="POST" id="employee-register">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h1 class="title-register">Cadastro de Funcionário</h1>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="name">Nome do Funcionário</label>
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
                            <label for="email">Email do Funcionario </label>
                            <input type="email" class="form-control" placeholder="Email" name="email" id="email">
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
                            <select class="form-control fix-select-option"  id="gender" name="gender">
                                <option value="">Escolha o seu gênero</option>
                                <option value="M">Masculino</option>
                                <option value="F">Feminino</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <input type="submit" class="btn btn-secondary" value="Cadastrar">
                        <input type="button" class="btn btn-secondary back-type" value="Voltar">
                    </div>
                </div>
            </form>
            <div class="alert alert-info mt-2 mb-0" id="message" style="margin-bottom:100px !important;">

            </div>
        </div>
    </div>
</div>
<div class="space-footer"></div>
<jsp:include page="../layout/footer-auth.jsp" />

<script type="text/javascript">
    $(function () {
        $('#name').bind('keydown', onlyLetter);
    });
</script>
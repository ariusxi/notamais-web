<jsp:include page="../layout/ header-auth.jsp" />
    <div class="col-sm-12 col-md-9 col-lg-9">
        <ul class="nav nav-tabs">
            <li class="active">
                <a class="nav-link active" href="#list" data-toggle="tab">Lista de Planos</a>
            </li>
            <li>
                <a class="nav-link" href="#register" data-toggle="tab">Cadastrar Plano</a>
            </li>
        </ul>
        <div class="tab-content ">
            <div class="tab-pane active" id="list">
                <h2 class="title-register">Lista de Planos</h2>
                <table id="plans-list" class="display table">
                    <thead>
                        <tr>
                            <td>Nome</td>
                            <td>Descri��o</td>
                            <td>Pre�o</td>
                            <td>Quantidade de XML</td>
                            <td>A��es</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane" id="register">
            <form action="" method="POST" id="plan-register">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h1 class="title-register">Cadastro de Plano</h1>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="name">Nome do Plano</label>
                            <input type="text" class="form-control"  placeholder="Titulo" name="name" id="name">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="value">Pre�o</label>
                            <input type="text" class="form-control" placeholder="Pre�o" name="value" id="value">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="qtdeXML">Quantidade de XML</label>
                            <input type="number" class="form-control cpf" placeholder="Quantidade de XML" name="qtdeXML" id="qtdeXML">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="description">Descri��o do Plano</label>
                            <textarea class="form-control" placeholder="Descri��o do Plano" id="description" name="description"></textarea>
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
<div class="space-footer"></div>
<jsp:include page="../layout/footer.jsp" />
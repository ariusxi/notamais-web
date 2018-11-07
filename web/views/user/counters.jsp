<jsp:include page="../layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <ul class="nav nav-tabs">
        <li class="active">
            <a class="nav-link active" href="#listCounter" data-toggle="tab" onclick="montarLista()">Lista de Contadores</a>
        </li>
        <li>
            <a  class="nav-link" href="#addCounter" data-toggle="tab">Adicionar novo contador</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="listCounter">
            <h2 class="title-register">Lista de Contadores</h2>
            <table class="table-responsive" id="counter-list">

            </table>
        </div>
        <div class="tab-pane" id="addCounter">
            <h2 class="title-register">Pesquise por um novo Contador</h2>

            <div class="form-row">
                <div class="form-group col-10">
                    <input type="text" class="form-control" id="pesquisar" name="pesquisar"/> 
                </div>
                <div class="form-group col">
                    <input type="submit" class="btn btn-dark" id="btnPesquisarContador" value="Pesquisar">

                </div>
            </div>  
            <div class="alert alert-info mt-2 mb-0" id="message" style="margin-bottom:100px !important;">

            </div>
            <table class="table-responsive" id="add-counter-list">

            </table>
        </div>
    </div>
</div>
</div>
<div class="space-footer"></div>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" id="modalCounterDetails" aria-labelledby="modalCounterDetails" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">Detalhes do contador</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4">
                        <div id="photoCounter"></div>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Nome</label>
                                <div id="nameCounter"></div>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <div id="emailCounter"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>CPF</label>
                                <div id="cpfCounter"></div>
                            </div>
                            <div class="col-md-4">
                                <label>Sexo</label>
                                <div id="genderCounter"></div>
                            </div>
                            <div class="col-md-4">
                                <label>Nickname</label>
                                <div id="nicknameCounter"></div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div clas="col-md-12">
                                <label>Contratos recentes</label>
                                <div id="jobsCounter"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer-auth.jsp" />

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/user/counters.js" charset="utf-8"></script>    

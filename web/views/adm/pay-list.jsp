<jsp:include page="../layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <ul class="nav nav-tabs">
        <li class="active">
            <a class="nav-link active" href="#receber" data-toggle="tab">Contas a Receber</a>
        </li>
   <!-- <li>
            <a class="nav-link" href="#pagar" data-toggle="tab">Contas a Pagar</a>
        </li>  -->
    </ul>
    <input type="hidden" id="JSON" value='<%= request.getAttribute("pagamentos") %>' />
    <div class="tab-content ">
        <div class="tab-pane  active" id="receber">
            <h2 class="title-register">Contas a Receber</h2>
            <form id="form-payment-report" action="views/adm/payment-report.jsp" method="POST">
                <h3>Filtros</h3>
                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-5">
                        <label>De:</label> <input required class="form-control" type="date" id="dt_de" name="dt_de" />
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-5">
                        <label>Até:</label> <input required class="form-control" type="date" id="dt_ate" name="dt_ate" />
                    </div>
                    <div class="col-sm-12 col-md-2 col-lg-2">
                        <button id="btn_processar" class="btn btn-primary">Processar</button>
                    </div>
                </div>
                <input type="hidden" id="json_data" name="json_data" value='<%= request.getAttribute("pagamentos") %>' />
            </form>
            <div class="table-responsive">
                <table  class="display table" id="contaReceber">
                    <thead>
                        <tr>
                            <th>Cliente</th>
                            <th>Data</th>
                            <th>Forma de pagamento</th>
                            <th>Valor</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <div class="col-sm-12 col-md-12 col-lg-12 mt-4" style="margin-top: 15px; margin-bottom: 15px; padding: 5px; ">
                    <p style="font-size: 16pt; color: #fff;">Total de Pagamentos: <strong style="float:right" id="totalPgto">0</strong></p>
                    <p style="font-size: 16pt; color: #fff;">Total Geral: <span style="float:right">R$<strong id="totalGeral">0,00</strong></span></p>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="pagar">
            <h2 class="title-register">Contas a Pagar</h2>
            <table class="display table table-striped">
                <thead>
                    <tr>
                        <th>Cliente</th>
                        <th>Data</th>
                        <th>Forma de pagamento</th>
                        <th>Valor</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="space-footer"></div>
<jsp:include page="../layout/footer-auth.jsp" />
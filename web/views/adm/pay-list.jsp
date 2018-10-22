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
            <div class="table-responsive">
                <table  class="display table" id="contaReceber">
                    <thead>
                        <tr>
                            <th>Cliente</th>
                            <th>Data</th>
                            <th>Forma de pagamento</th>
                            <th>Valor</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
            
            <form id="form-payment-report" action="views/adm/payment-report.jsp" method="POST">
                <h3>Filtros</h3>
                <div>    
                    <label>De:</label> <input required class="form-control" type="date" id="dt_de" name="dt_de" >
                    <label>Até:</label> <input required class="form-control" type="date" id="dt_ate" name="dt_ate" >
                    <p style="border:solid 1px #fff; border-radius: 3px; color: #fff; font-size: 14pt; margin-top: 15px; margin-bottom: 15px; padding: 5px; " id="result"></p>
                </div>
                <input type="hidden" id="json_data" name="json_data" value='<%= request.getAttribute("pagamentos") %>' />
                <button id="btn_processar" class="btn btn-primary">Processar</button>
            </form>
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
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
                            <th>Valor</th>
                            <th>Cliente</th>
                            <th>Data</th>
                            <th>Forma de pagamento</
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
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


<jsp:include page="../layout/header-auth.jsp" />

<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <ul class="nav nav-tabs">
        <li>
            <a class="nav-link active" href="#list" data-toggle="tab" >Lista de usuários</a>
        </li>
        <li>
            <a class="nav-link" href="#contadores" data-toggle="tab">Lista de contadores</a>
        </li>
    </ul>
    <div class="tab-content ">
        <div class="tab-pane active" id="list">
            <h2 class="title-register">Lista de usuários</h2>
            <div class="table-responsive">
                <table id="users-list" class="display table">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane" id="contadores">
            <h2 class="title-register">Lista de Contadores</h2>
            <table id="counter-list" class="display table">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Ações</th>
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


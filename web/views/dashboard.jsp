<%-- 
    Document   : dashboard
    Created on : 24/08/2018, 08:37:12
    Author     : Windows 7
--%>

<jsp:include page="../views/layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <% if (session.getAttribute("roles").equals("user")) { %>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <% if (session.getAttribute("company").equals("")) { %>
            <div class="alert alert-warning">
                <div class="container">
                    <div class="alert-icon">
                        <i class="material-icons">warning</i>
                    </div>
                    <button type="button" id="<% out.print(session.getAttribute("id")); %>" class="close activate-sefaz">
                        <span aria-hidden="true">Ativar</span>
                    </button>
                    Atenção: Detectamos que a sua empresa não está registrada no SEFAZ
                </div>
            </div>
            <% } else { %>
            <div class="alert alert-success">
                <div class="container">
                    <div class="alert-icon">
                        <i class="material-icons">check</i>
                    </div>
                    Sua conta esta ativada no SEFAZ
                </div>
            </div>
            <% } %>
        </div>
        <div class="row col-12 justify-content-center">
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="card card-stats">
                    <div class="card-header card-header-warning card-header-icon">
                        <div class="card-icon">
                            <i class="material-icons">insert_drive_file</i>
                        </div>
                        <p class="card-category text-light">Envios de xml do mês</p>
                        <h3 class="card-title text-light" id="number-files">
                            <div class="lds-roller">
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                            </div>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="card card-stats">
                    <div class="card-header card-header-primary card-header-icon">
                        <div class="card-icon">
                            <i class="material-icons">person</i>
                        </div>
                        <p class="card-category text-light">Cadastros do mês</p>
                        <h3 class="card-title text-light" id="number-user">
                            <div class="lds-roller">
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                                <div></div>
                            </div>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-12 justify-content-center">
            <div class="col-sm-12 col-md-12 col-lg-4">
                <div class="card card-chart">
                    <div class="card-header card-header-warning">
                        <canvas id="xml-chart"></canvas>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">XMLs Enviados</h4>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-4">
                <div class="card card-chart">
                    <div class="card-header card-header-primary">
                        <canvas id="employee-chart"></canvas>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">Funcionários Registrados</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } else if (session.getAttribute("roles").equals("admin")) { %>
    <div class="row">
        <div class="col-lg-4 col-md-12 col-sm-12">
            <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">person</i>
                    </div>
                    <p class="card-category">Cadastros do mês</p>
                    <h3 class="card-title" id="number-user">
                        <div class="lds-roller">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </h3>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12 col-sm-12">
            <div class="card card-stats">
                <div class="card-header card-header-primary card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">insert_drive_file</i>
                    </div>
                    <p class="card-category">Envios do último mês</p>
                    <h3 class="card-title" id="number-files">
                        <div class="lds-roller">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </h3>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12 col-sm-12">
            <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">attach_money</i>
                    </div>
                    <p class="card-category">Pagamentos do mês</p>
                    <h3 class="card-title" id="number-pay">
                        <div class="lds-roller">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </h3>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-4 col-lg-4">
            <div class="card card-chart">
                <div class="card-header card-header-warning">
                    <canvas id="user-chart"></canvas>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Usuários cadastrados</h4>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-4 col-lg-4">
            <div class="card chard-chart">
                <div class="card-header card-header-primary">
                    <canvas id="dispatch-chart"></canvas>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Envios de cada mês</h4>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-4 col-lg-4">
            <div class="card chard-chart">
                <div class="card-header card-header-success">
                    <canvas id="payments-chart"></canvas>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Envios de cada mês</h4>
                </div>
            </div>
        </div>
    </div>
    <% }%>
</div>
<jsp:include page="../views/layout/footer-auth.jsp" />

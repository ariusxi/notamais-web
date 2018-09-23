<%-- 
    Document   : dashboard
    Created on : 24/08/2018, 08:37:12
    Author     : Windows 7
--%>

<jsp:include page="../views/layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <% if (session.getAttribute("roles").equals("user")) { %>
    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-6">
            <div class="card card-chart">
                <div class="card-header card-header-warning">
                    <canvas id="xml-chart"></canvas>
                </div>
                <div class="card-body">
                  <h4 class="card-title">XMLs Enviados</h4>
                </div>
            </div>
        </div>
    </div>
    <% }else if(session.getAttribute("roles").equals("admin")){ %>
    <div class="row">
        <div class="col-lg-4 col-md-12 col-sm-12">
            <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">person</i>
                    </div>
                    <p class="card-category">Cadastros do �ltimo m�s</p>
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
                    <p class="card-category">Envios do �ltimo m�s</p>
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
                    <p class="card-category">Pagamentos do m�s</p>
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
                  <h4 class="card-title">Usu�rios cadastrados</h4>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-4 col-lg-4">
            <div class="card chard-chart">
                <div class="card-header card-header-primary">
                    <canvas id="dispatch-chart"></canvas>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Envios de cada m�s</h4>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-4 col-lg-4">
            <div class="card chard-chart">
                <div class="card-header card-header-success">
                    <canvas id="payments-chart"></canvas>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Envios de cada m�s</h4>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</div>
<jsp:include page="../views/layout/footer-auth.jsp" />

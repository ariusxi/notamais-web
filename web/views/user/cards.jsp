<%-- 
    Document   : cards
    Created on : 01/09/2018, 23:50:37
    Author     : Chu
--%>

<jsp:include page="../layout/header-auth.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 mt-4">
    <ul class="nav nav-tabs">
        <li class="active">
            <a class="nav-link active" href="#list" data-toggle="tab" onclick="montarListaCard()">Lista de Cart�o de Cr�dito</a>
        </li>
        <li>
            <a  class="nav-link" href="#register" data-toggle="tab">Cadastrar Cart�o de Cr�dito</a>
        </li>
    </ul>

    <div class="tab-content ">
        <div class="tab-pane active" id="list">
            <h2 class="title-register">Lista de Cart�es de Cr�dito</h2>
            <div class="table-responsive">
                <table id="cards-list" class="display table text-center">
                    <thead>
                        <tr>
                            <td>N�mero do cart�o</td>
                            <td>Titular</td>
                            <td>C�digo de Seguran�a</td>
                            <td>Data de expira��o</td>
                            <td>Bandeira</td>
                            <td>Tipo</td>
                            <td>A��es</td>
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
            <form action="" method="POST" id="card-register">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h1 class="title-register">Adicionar um cart�o de cr�dito</h1>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="number">N�mero do cart�o</label>
                            <input type="text" class="form-control number"  placeholder="N�mero do cart�o" name="number" id="number">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="holder">Titular</label>
                            <input type="text" class="form-control" placeholder="Titular" name="holder" id="holder">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="expiration-date">Data de expira��o</label>
                            <input type="text" class="form-control expirationDate" placeholder="Data de expira��o" name="expiration-date" id="expiration-date">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="security-code">C�digo de Seguran�a</label>
                            <input type="text" class="form-control securityCode" placeholder="C�digo de seguran�a" size="4" max="4" name="security-code" id="security-code">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="brand">Bandeira</label>
                            <select class="form-control fix-select-option" id="brand" name="brand">
                                <option value="" >Bandeira</option>
                                <option value="master">Master</option>
                                <option value="visa">Visa</option>
                                <option value="elo">Elo</option>
                                <option value="amex">Amex</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="card-type">Tipo:</label>
                            <select class="form-control fix-select-option" id="card-type" name="card-type">
                                <option value="">Tipo</option>
                                <option value="CreditCard">Cart�o de Cr�dito</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <input type="submit" class="btn btn-primary btn-rounded" value="Cadastrar">
                    </div>
                </div>
            </form>
            <div class="alert alert-info mt-2 mb-0" id="message" style="margin-bottom:100px !important;">

            </div>
        </div>
    </div>

</div>
<jsp:include page="../layout/footer-auth.jsp" />

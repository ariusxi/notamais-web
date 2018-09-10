<%-- 
    Document   : cards
    Created on : 01/09/2018, 23:50:37
    Author     : Chu
--%>

<jsp:include page="../layout/header-auth.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"></script>
<div class="col-sm-12 col-md-9 col-lg-9">
    <ul class="nav nav-tabs">
        <li class="active">
            <a class="nav-link active" href="#list" data-toggle="tab">Lista de Cartão de Crédito</a>
        </li>
        <li>
            <a  class="nav-link" href="#register" data-toggle="tab">Cadastrar Cartão de Crédito</a>
        </li>
    </ul>
    
    <div class="tab-content ">
        <div class="tab-pane active" id="list">
            <h2 class="title-register">Lista de Cartões de Crédito</h2>
            <table id="cards-list" class="display table">
                <thead>
                    <tr>
                        <td>Número do cartão</td>
                        <td>Titular</td>
                        <td>Código de Segurança</td>
                        <td>Data de expiração</td>
                        <td>Bandeira</td>
                        <td>Tipo</td>
                        <td>Ações</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                    </tr>
                </tbody>
            </table>
        </div>
        
<<<<<<< HEAD
     
=======
   
   
   <table>
         <h2 class="title-register">Formas de Pagamento</h2>
           

        </h1>
        <form>
            <tr>        
            <td><input type="radio" name="pag" id="bol" value="Boleto" />  
  Boleto<br /></td><td></td></tr>                                                                         
            
            <tr>
            <td><input type="radio" name="pag" id="cred" value="Crédito" /> 
            
  Crédito<br /></td><td></td></tr>	
            
            <tr>
            <td><input type="radio" name="pag" id="deb" value="Débito" />
   Débito</td><td></td></tr>
                        
           
        </table>
		
	</form>

   
   
   
   
   
   
>>>>>>> e74b6028ee34d2a0a1da94782e65b379d44ccd9f
        <div class="tab-pane" id="register">
            <form action="" method="POST" id="card-register">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h1 class="title-register">Adicionar um cartão de crédito</h1>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="number">Número do cartão</label>
                            <input type="number" class="form-control"  placeholder="Número do cartão" name="number" id="number">
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
                            <label for="expiration-date">Data de expiração</label>
                            <input type="text" class="form-control expirationDate" placeholder="Data de expiração" name="expiration-date" id="expiration-date">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="security-code">Código de Segurança</label>
                            <input type="text" class="form-control securityCode" placeholder="Código de segurança" size="4" max="4" name="security-code" id="security-code">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 col-lg-4">
                        <div class="form-group">
                            <label for="brand">Bandeira</label>
                            <select class="form-control" id="brand" name="brand">
                                <option value="">Escolha a bandeira do seu cartão de crédito</option>
                                <option value="" selected="">Bandeira</option>
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
                            <select class="form-control" id="card-type" name="card-type">
                                <option value="">Escolha a bandeira do seu cartão de crédito</option>
                                <option value="CreditCard">Cartão de Crédito</option>
                                <option value="DebitCard">Cartão de Débito</option>
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
<jsp:include page="../layout/footer.jsp" />
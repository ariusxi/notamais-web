<%-- 
    Document   : first-login
    Created on : 01/09/2018, 19:28:04
    Author     : Windows 7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <title>Bem vindo ao Nota+</title>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <link href="${pageContext.request.contextPath}/assets/css/first-login.css" rel="stylesheet"/>
       
    </head>
    <body>
        <div class="image-container set-full-height" style="background-image: url('http://demos.creative-tim.com/material-bootstrap-wizard/assets/img/wizard-book.jpg')">

	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">
		            <!-- Wizard container -->
		            <div class="wizard-container">
		                <div class="card wizard-card" data-color="red" id="wizard">
		                    <form action="" method="POST" id="first-login">

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">
		                        		Bem vindo ao Nota+
		                        	</h3>
                                            <h5>Faça os passos abaixo para continuar</h5>
		                    	</div>
                                        <div class="wizard-navigation">
                                            <ul>
                                                <li><a href="#captain" data-toggle="tab">Escolha um tipo</a></li>
                                                <li><a href="#details" data-toggle="tab">Escolha um plano</a></li>
                                                <li><a href="#description" data-toggle="tab">Pagamento</a>
                                                </li>
                                            </ul>
                                        </div>

		                        <div class="tab-content">
		                            <div class="tab-pane" id="captain">
		                                <div class="row">
		                                    <div class="col-sm-10 col-sm-offset-1">
		                                        <div class="col-sm-6">
		                                            <div class="choice" id="test" data-toggle="wizard-radio" rel="tooltip" title="Selecione esta opção para começar com um plano que dura 7 dias com 10 espaços para armazenar XML">
		                                                <input type="radio" name="plan" class="plan" value="test">
		                                                <div class="icon">
		                                                    <i class="material-icons">account_circle</i>
		                                                </div>
		                                                <h6>Plano de Teste (7 Dias)</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-6">
		                                            <div class="choice" id="pay" data-toggle="wizard-radio" rel="tooltip" title="Escolha esta opção para contratar um plano">
		                                                <input type="radio" name="plan" class="plan" value="pay">
		                                                <div class="icon">
		                                                    <i class="material-icons">account_balance_wallet</i>
		                                                </div>
		                                                <h6>Contratar um plano</h6>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
                                            <div class="tab-pane" id="details">
                                                <div class="col-sm-12 col-md-12 col-lg-12">
                                                    <div id="plans">

                                                    </div>
                                                </div>
		                            </div>
		                            <div class="tab-pane" id="description">
		                                <div class="row">
		                                    <h4 class="info-text">Informe os dados do seu cartão</h4>
		                                    <div class="col-sm-6">
	                                    		<div class="credit-card cf">
                                                            <img src="${pageContext.request.contextPath}/assets/img/master64.png" width="80" id="brand">
                                                            <img src="http://alfoart.com/images/golden_credit_card/chip.png" width="40" id="chip">
                                                            <div class="card-number">
                                                                3845 3485 5868 3359
                                                            </div>
                                                            <div class="card-name">
                                                                Nome do Cartão
                                                            </div>
                                                            <div class="valid">
                                                                <div class="group">
                                                                    <i>Validade</i>
                                                                </div>
                                                                <div class="expiry">01/20</div>
                                                            </div>
                                                        </div>
		                                    </div>
		                                    <div class="col-sm-6">
                                                        <div class="col-sm-6">
                                                            <label for="CardNumber">Número do Cartão</label>
                                                            <input type="text" class="form-control" id="CardNumber" name="CardNumber" maxlength="19">
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label for="Holder">Nome</label>
                                                            <input type="text" class="form-control" id="Holder" name="Holder">
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label for="ExpirationDate">Validade</label>
                                                            <input type="text" class="form-control" id="ExpirationDate" name="ExpirationDate" maxlength="5">
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <label for="SecurityCode">CVV</label>
                                                            <input type="text" class="form-control" id="SecurityCode" name="SecurityCode" maxlength="4">
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <label for="Brand">Bandeira</label>
                                                            <select name="Brand" id="Brand" class="form-control">
                                                                <option value="" selected="">Bandeira</option>
                                                                <option value="master">Master</option>
                                                                <option value="visa">Visa</option>
                                                                <option value="elo">Elo</option>
                                                                <option value="amex">Amex</option>
                                                            </select>
   <h4> Defina a forma de pagamento</h4>      
   <div>        <input type="radio" name="pag" id="bol" value="Boleto" />  
  Boleto<br />                                                                        
           <input type="radio" name="pag" id="cred" value="Crédito" /> 
            
  Crédito	
  <br>
          <input type="radio" name="pag" id="deb" value="Débito" />
   Débito
   </div>
            
        
                  
           
    
		
	

                                                        </div>
		                                    </div>
                                                    <div class="col-sm-12" id="feedback"></div>
		                                </div>
		                            </div>
		                        </div>
	                        	<div class="wizard-footer">
                                            <div id="message"></div>
                                            <div class="pull-right">
                                                <input type='button' class='btn btn-next btn-fill btn-danger btn-wd' name='next' value='Próximo' />
<<<<<<< HEAD
                                                <input type='button' class='btn btn-finish btn-fill btn-danger btn-wd' name='finish' value='Finalizar' />
                                                
=======
                                                <input type='button' class='btn btn-finish btn-fill btn-danger btn-wd' name='finish' value='Finalizar' /> 

>>>>>>> e74b6028ee34d2a0a1da94782e65b379d44ccd9f
                                            </div>
                                            
                                            <div class="pull-left">
                                                <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Anterior' />
                                                
                                            </div>
                                            <div class="clearfix"></div>
	                        	</div>
                                                                                                           
		                    </form>
                                                            
		                </div>
		            </div> <!-- wizard container -->
		        </div>
                    </div> <!-- row -->
		</div> <!--  big container -->

	    <div class="footer">
	        <div class="container text-center">
                    &copy; Nota+ todos os direitos reservados
	        </div>
	    </div>
	</div>
        
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.mask.js" type="text/javascript"></script>
        <script src='${pageContext.request.contextPath}/assets/js/first-login.js'></script>
        <script src='${pageContext.request.contextPath}/assets/js/script-first.js'></script>
    </body>
</html>

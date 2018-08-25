<%-- 
    Document   : index
    Created on : 15/08/2018, 11:04:48
    Author     : Windows 7
--%>

<jsp:include page="views/layout/header.jsp" />
<!-- Container element -->
<div class="parallax">
    <div class="caption">
        <span class="border">
            <p>Uma nova forma de armazenar seus arquivos XML</p>
            <button>Contrate</button>
        </span>
    </div>
</div>

<div class="container about">
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <h3>Sobre o sistema</h3>
            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
        </div>
    </div>
</div>
<section class="register">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6 text-center">
                <h3>Empresas</h3>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </p>
                <p>
                    <a href="register" class="btn btn-outline-light">Cadastre-se</a>
                </p>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-6 text-center">
                <h3>Contadores</h3>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </p>
                <p>
                    <a href="register" class="btn btn-outline-light">Cadastre-se</a>
                </p>
            </div>
        </div>
    </div>
</section>
<section class="parallax-icons">
    <div class="container text-center">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-3">
                <h1><i class="fas fa-server"></i></h1>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-3">
                <h1><i class="fas fa-database"></i></h1>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-3">
                <h1><i class="fas fa-cloud"></i></h1>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-3">
                <h1><i class="fas fa-file"></i></h1>
            </div>
        </div>
    </div>
</section>
<div class="container plans">
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <h3>Para empresas</h3>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
            </p>
            <div class="wrapper">
                <div id="plans">
                    <div id="plan" class="plan">
                        <h2 class="plan-heading">Basic</h2>
                        <div class="plan-subheading">$10/mo</div>
                        <div class="plan-divider">or</div>
                        <div class="plan-highlight">
                            $119/year <small>(save 10%)</small>
                        </div>
                        <ul class="plan-features">
                            <li>100GB Disk Space</li>
                            <li>1000GB Data Transfer/month</li>
                            <li>10 Domains</li>
                        </ul>
                    </div>
                    <div id="plan" class="plan">
                        <h2 class="plan-heading">Basic</h2>
                        <div class="plan-subheading">$10/mo</div>
                        <div class="plan-divider">or</div>
                        <div class="plan-highlight">
                            $119/year <small>(save 10%)</small>
                        </div>
                        <ul class="plan-features">
                            <li>100GB Disk Space</li>
                            <li>1000GB Data Transfer/month</li>
                            <li>10 Domains</li>
                        </ul>
                    </div>
                    <div id="plan" class="plan">
                        <h2 class="plan-heading">Basic</h2>
                        <div class="plan-subheading">$10/mo</div>
                        <div class="plan-divider">or</div>
                        <div class="plan-highlight">
                            $119/year <small>(save 10%)</small>
                        </div>
                        <ul class="plan-features">
                            <li>100GB Disk Space</li>
                            <li>1000GB Data Transfer/month</li>
                            <li>10 Domains</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6">
                <h3>Fale Conosco</h3>
                 <form action="" method="POST" id="contato">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="email">E-mail</label>
                            <input type="text" class="form-control" id="email" placeholder="Digite seu email" name="email"/>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="title">Titulo</label>
                            <input type="text" class="form-control" id="title" placeholder="Informe o motivo do contato" name="title"/>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <label for="text">Mensagem</label>
                            <textarea type="text" class="form-control" id="text" placeholder="Digite a sua mensagem" name="text"></textarea>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <input type="submit" class="btn btn-success" value="Enviar"/>
                    </div>
                </form>
                <div class="alert alert-success mt-2 mb-0" id="message">    
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-6">
                <h3>Informações de contato</h3>
                <p>Email: notamais2018@gmail.com</p>
                <p>Suporte: notamais2018@gmail.com</p>
                <p>Horário de Atendimento</p>
                <p>Segunda à Sexta das 08h às  18h</p>
                <h3>Onde estamos</h3>
                <p>Bairro: Liberdade</p>
                <p>CEP: 01503-000</p>
            </div>
        </div>
    </div>
</div>
<div class="space-footer"></div>
<jsp:include page="views/layout/footer.jsp" />

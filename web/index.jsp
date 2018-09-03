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
            <p >
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
            </p>
            <div class="wrapper">
                <div id="plans">
                    
                </div>
                
            </div>
        </div>
    </div>
</div>
<p align="center"> <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#modalQuickView">Detalhes</button></p>
  <!-- TESTANDO MODAL PLANOS -->

  
    <!-- Modal: modalQuickView -->
    <div class="modal fade" id="modalQuickView" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-5">
                            <!--Carousel Wrapper-->
                            <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">
                                <!--Slides-->
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="assets/img/imagem1.jpg" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="assets/img/imagem2.jpg" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="assets/img/imagem3.jpg" alt="Third slide">
                                    </div>
                                </div>
                                <!--/.Slides-->
                                <!--Controls-->
                                <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                                <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                                <!--/.Controls-->
                               
                            </div>
                            <!--/.Carousel Wrapper-->
                        </div>
                        <div class="col-lg-7">
                            <h2 class="h2-responsive product-name">
                                <strong>Nota +</strong>
                            </h2>
                            <h4 class="h4-responsive">
                                <span class="green-text">
                                    <h5> A parir de </h5>
                <strong>$49</strong>
              </span>
          
                            </h4>

                            <!--Accordion wrapper-->
                            <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">

                                <!-- Accordion card -->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header" role="tabpanel" id="headingOne">
                                        <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <h5 class="mb-0">
                                                Standard <i class="fa fa-angle-down rotate-icon"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                        <div class="card-body">
                                            <div id="card1">
                                    
                                            </div>
                                            </div>
                                    </div>
                                </div>
                                <!-- Accordion card -->

                                <!-- Accordion card -->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="headingTwo">
                                        <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <h5 class="mb-0">
                                                Plus <i class="fa fa-angle-down rotate-icon"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                                        <div class="card-body">
                                          <div id="card2">
                                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Accordion card -->

                                <!-- Accordion card -->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header" role="tab" id="headingThree">
                                        <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            <h5 class="mb-0">
                                                Premium <i class="fa fa-angle-down rotate-icon"></i>
                                            </h5>
                                        </a>
                                    </div>

                                    <!-- Card body -->
                                    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                                        <div class="card-body">
                                           <div id="card3">
                                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Accordion card -->
                            </div>
                            <!--/.Accordion wrapper-->

                            <!-- Add to Cart -->
                            <div class="card-body">
                               
                                <div class="text-center">

                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                    <button class="btn btn-dark"> <a href="register">Cadastre-se</a>
                  <i  aria-hidden="true"></i>
                </button>
                                </div>
                            </div>
                            <!-- /.Add to Cart -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal: modalQuickView -->


    <!--FIM DO TESTE -->
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
                        <br/>
                        <input type="submit" class="btn btn-outline-light" value="Enviar"/>
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

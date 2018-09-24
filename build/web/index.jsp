<%-- 
    Document   : header
    Created on : 23/08/2018, 09:28:57
    Author     : lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <title>Nota+</title>
        <!-- CSS Files -->
        <link href="${pageContext.request.contextPath}/assets/css/material-kit.min.css" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
    </head>

    <body class="landing-page sidebar-collapse">
        <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
            <div class="container">
                <div class="navbar-translate">
                    <a class="navbar-brand">
                        Nota Mais 
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="navbar-toggler-icon"></span>
                        <span class="navbar-toggler-icon"></span>
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Administrador</a>
                        </li>
                      <!--  <li class="nav-item">
                            <a class="nav-link" href="#">SST</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Exames</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">eSocial</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Gerencia</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Receber</a>
                        </li>-->
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/register">Cadastre-se</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="page-header header-filter" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/assets/img/background.jpg');">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h1 class="title"> Uma nova forma de armazenar seus arquivos XML</h1>

                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="main main-raised">
            <div class="container">
                <div class="section text-center">
                    <div class="row">
                        <div class="col-md-8 ml-auto mr-auto">

                            <h2 class="title">Sobre o sistema</h2>
                            <h5 class="description">This is the paragraph where you can write more details about your
                                product. Keep you user engaged by providing meaningful information. Remember that by this
                                time, the user is curious, otherwise he wouldn&apos;t scroll to get here. Add a button if
                                you want the user to see more.</h5>

                            <br> <br>
                        </div>
                    </div>
                    <div class="features">
                        <div class="row">


                            <div class="col-sm-12 col-md-6 col-lg-6 text-center">
                                <div class="info">
                                    <div class="icon ">
                                        <i class="material-icons">verified_user</i>
                                    </div>
                                    <h4 class="info-title">Empresas</h4>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
                                        irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                                        deserunt mollit anim id est laborum.
                                    </p>
                                    <p>
                                        <a href="register" class="btn btn-primary btn-raised btn-round">Cadastre-se</a>
                                    </p>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6 text-center">
                                <div class="info">
                                    <div class="icon ">
                                        <i class="material-icons">fingerprint</i>
                                    </div>
                                    <h4 class="info-title">Contadores</h4>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
                                        irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                                        deserunt mollit anim id est laborum.
                                    </p>
                                    <p>
                                        <a href="register" class="btn btn-primary btn-raised btn-round">Cadastre-se</a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section text-center">

                <div class="container plans">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <h3>Para empresas</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                ullamco laboris nisi ut aliquip ex ea commodo consequat.
                            </p>
                            <div class="wrapper">
                                <div id="plans" class="row">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--<p align="center"> <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#modalQuickView">Detalhes</button></p>
      <!-- TESTANDO MODAL PLANOS -->


                <!-- Modal: modalQuickView -->
                <div class="modal fade" id="modalQuickView" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <!--Carousel Wrapper-->
                                        <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails"
                                            data-ride="carousel">
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
                                            <a class="carousel-control-prev" href="#carousel-thumb" role="button"
                                                data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#carousel-thumb" role="button"
                                                data-slide="next">
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
                                                    <a data-toggle="collapse" href="#collapseOne" aria-expanded="true"
                                                        aria-controls="collapseOne">
                                                        <h5 class="mb-0">
                                                            Standard <i class="fa fa-angle-down rotate-icon"></i>
                                                        </h5>
                                                    </a>
                                                </div>

                                                <!-- Card body -->
                                                <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne"
                                                    data-parent="#accordion">
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
                                                    <a class="collapsed" data-toggle="collapse" href="#collapseTwo"
                                                        aria-expanded="false" aria-controls="collapseTwo">
                                                        <h5 class="mb-0">
                                                            Plus <i class="fa fa-angle-down rotate-icon"></i>
                                                        </h5>
                                                    </a>
                                                </div>

                                                <!-- Card body -->
                                                <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo"
                                                    data-parent="#accordion">
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
                                                    <a class="collapsed" data-toggle="collapse" href="#collapseThree"
                                                        aria-expanded="false" aria-controls="collapseThree">
                                                        <h5 class="mb-0">
                                                            Premium <i class="fa fa-angle-down rotate-icon"></i>
                                                        </h5>
                                                    </a>
                                                </div>

                                                <!-- Card body -->
                                                <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree"
                                                    data-parent="#accordion">
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
                                                    <i aria-hidden="true"></i>
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
                <div class="section section-contacts">
                    <div class="row">
                        <div class="col-md-8 ml-auto mr-auto">
                            <h2 class="text-center title">Contato</h2>
                            <h4 class="text-center description">Entre em contato com o grupo Nota+</h4>
                            <br>
                            <form action="" method="POST" id="contato">
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label for="email">E-mail</label>
                                        <input type="text" class="form-control" id="email" placeholder="Digite seu email"
                                            name="email" />
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label for="title">Titulo</label>
                                        <input type="text" class="form-control" id="title" placeholder="Informe o motivo do contato"
                                            name="title" />
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label for="text">Mensagem</label>
                                        <textarea type="text" class="form-control" id="text" placeholder="Digite a sua mensagem"
                                            name="text"></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <br />
                                    <input type="submit" class="btn btn-primary btn-round" value="Enviar" />
                                </div>
                            </form>
                            <div class="alert alert-success mt-2 mb-0" id="message" style="display:none;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         
        <!--Start of Zendesk Chat Script-->
        <script type="text/javascript">
        window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
        d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
        _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
        $.src="https://v2.zopim.com/?60xKJ9iLLTNO0tHe1vP54pEK02yMFmlP";z.t=+new Date;$.
        type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
        </script>
        <!--End of Zendesk Chat Script-->
        <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
        <script>
            var OneSignal = window.OneSignal || [];
            //Dev: f2f5720e-15a4-446b-b683-12954e009076
            //Productions: 6a8eed60-3d61-4064-847e-94062f9d70dc
            OneSignal.push(["init", {
                //Alterne aqui as chaves do Push Notification
                //Produção
                appId: "159ddb12-4eac-4ac4-9dbe-ea9aaae0b507",
                //Desenvolvimento
                //appId: "159ddb12-4eac-4ac4-9dbe-ea9aaae0b507",
                autoRegister: true,
                httpPermissionRequest: {
                    enable: true,
                    modalTitle: 'Obrigado por se Inscrever',
                    modalMessage: "Você vai receber nossas promoções, elas pode ser canceladas a qualquer momento.",
                    modalButtonText: 'Fechar'
                },
                welcomeNotification: {
                    "title": "Nota Mais",
                    "message": "Obrigado por se Inscrever!",
                    "url": ""
                },
                promptOptions: {
                    siteName: "Nota Mais",
                    actionMessage: "Gostaria de Receber nossas novidades e promoções?",
                    exampleNotificationTitle: "Exemplo da Notificação",
                    exampleNotificationMessage: "Este é um exemplo de notificação",
                    exampleNotificationCaption: "Você pode cancelar a qualquer momento",
                    acceptButtonText: "Aceitar",
                    cancelButtonText: "Não, obrigado"
                },
                notifyButton: {
                    enable: true,
                    displayPredicate: function () {
                        return OneSignal.isPushNotificationsEnabled().then(function (isPushEnabled) {
                            return !isPushEnabled;
                        });
                    },
                    colors: {
                        'circle.background': 'rgb(204,105,47)',
                        'circle.foreground': 'white',
                        'badge.background': 'rgb(204, 105, 47)',
                        'badge.foreground': 'white',
                        'badge.bordercolor': 'white',
                        'pulse.color': 'white',
                        'dialog.button.background.hovering': 'rgb(77, 101, 113)',
                        'dialog.button.background.active': 'rgb(70, 92, 103)',
                        'dialog.button.background': 'rgb(84,110,123)',
                        'dialog.button.foreground': 'white'
                    },
                    size: 'small',
                    theme: 'default',
                    position: 'bottom-left',
                    offset: {
                        bottom: '30px',
                        left: '10px',
                        right: '0px'
                    },
                    prenotify: true,
                    showCredit: false,
                    text: {
                        'tip.state.unsubscribed': 'Inscreva-se para receber nossas promoções',
                        'tip.state.subscribed': "Você está recebendo nossas notificações",
                        'tip.state.blocked': "Você bloqueou nossas notificações",
                        'message.prenotify': 'Clique para se inscrever',
                        'message.action.subscribed': "Obrigado por se inscrever!",
                        'message.action.resubscribed': "Obrigado, você vai receber nossas notificações!",
                        'message.action.unsubscribed': "Você cancelou nossas notificações.",
                        'dialog.main.title': 'Gerenciar Notificações',
                        'dialog.main.button.subscribe': 'RECEBER NOTIFICAÇÕES',
                        'dialog.main.button.unsubscribe': 'NÃO RECEBER NOTIFICAÇÕES',
                        'dialog.blocked.title': 'Desbloquear Notificações',
                        'dialog.blocked.message': "Siga essas instruções para liberar as notificações:"
                    }
                }
            }]);
        </script>

        <!--   Core JS Files   -->
        <script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>

        <script src="${pageContext.request.contextPath}/assets/js/material-kit.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/script.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plan/plan.js" type="text/javascript"></script>
    </body>
</html>
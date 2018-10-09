<%-- 
    Document   : header
    Created on : 23/08/2018, 09:28:57
    Author     : lucas
--%>

<%@page contentType="text/html"%>
<%
    try {
        session = request.getSession(false);
        if (session.isNew()) {
            response.sendRedirect("/");
        } else {

        }
    } catch (Exception e) {
        response.sendRedirect("/");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <title>Nota+</title>
        <!-- Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/assets/css/jquery.dataTables.min.css" rel="stylesheet"/>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <!-- Material Kit CSS -->
        <link href="${pageContext.request.contextPath}/assets/dashboard/assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/material-kit.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/fix.css" rel="stylesheet"/>
    </head>
    <body class="dark-edition">
        <div class="wrapper ">
            <div class="sidebar" data-color="purple" data-background-color="black" data-image="./assets/img/sidebar-2.jpg">
                <div class="logo">
                    <a href="#" class="simple-text logo-normal">
                        Nota+
                    </a>
                </div>
                <div class="sidebar-wrapper">
                    <ul class="nav fix-dashboard-menu">
                        <li class="nav-item">
                            <div class="text-center">
                                <% if(session.getAttribute("image").equals("default")){ %>
                                <img src="${pageContext.request.contextPath}/assets/img/default-user.png" class="img-fluid img-thumbnail img-profile" width="100" alt="<%= session.getAttribute("name")%>"><br/><br/>
                                <% }else{ %>
                                <img src="<%= session.getAttribute("image") %>" class="img-fluid img-thumbnail img-profile" width="93%" alt="<%= session.getAttribute("name")%>"><br/><br/>
                                <% } %>
                                <h5 class="card-title">
                                    <%= session.getAttribute("name")%>
                                </h5>
                                <h6 class="card-subtitle mb-2 text-muted">
                                    <%= session.getAttribute("roles")%>
                                </h6>
                            </div>
                        </li>
                        <% if (session.getAttribute("roles").equals("user")) { %>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="dashboard">
                                <i class="material-icons">dashboard</i>
                                <p>Meu Perfil</p>
                            </a>
                        </li>
                        <% }%>
                        <% if (session.getAttribute("roles").equals("user")) { %>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="employee">
                                <i class="material-icons">person_pin</i>
                                <p>Funcionários</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="counters">
                                <i class="material-icons">monetization_on</i>
                                <p>Contadores</p>
                            </a>
                        </li>                      
                        <li class="nav-item active  ">
                            <a class="nav-link" href="user-plan">
                                <i class="material-icons">subtitles</i>
                                <p>Meu Plano</p>
                            </a>
                        </li>
                        <% } else if (session.getAttribute("roles").equals("admin")) {  %>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="dashboard">
                                <i class="material-icons">home</i>
                                <p>Página Inicial</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="plan">
                                <i class="material-icons">subtitles</i>
                                <p>Planos</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="users">
                                <i class="material-icons">supervised_user_circle</i>
                                <p>Usuários</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="pay-list">
                                <i class="material-icons">payment</i>
                                <p>Pagamentos</p>
                            </a>
                        </li>
                        <% }%>
                        <% if (session.getAttribute("roles").equals("user")) { %>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="edit-user">
                                <i class="material-icons">person</i>
                                <p>Alterar perfil</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="card">
                                <i class="material-icons">style</i>
                                <p>Meus Cartões</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="upload-xml">
                                <i class="material-icons">insert_drive_file</i>
                                <p>Lista de NFes</p>
                            </a>
                        </li>
                        <% } else if (session.getAttribute("roles").equals("counter")) { %>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="edit-counter">
                                <i class="material-icons">dashboard</i>
                                <p>Alterar dados de perfil</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="lista-arquivos">
                                <i class="material-icons">insert_drive_file</i>
                                <p>Lista de Arquivos</p>
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="invitations">
                                <i class="material-icons">dashboard</i>
                                <p>Convites <span class="badge badge-light countInvitation text-dark"></span> </p>
                            </a>
                        </li>
                        <% } else if (session.getAttribute("roles").equals("employee")) { %>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="edit-counter">
                                <i class="material-icons">dashboard</i>
                                <p>Alterar dados de perfil</p>
                            </a>
                        </li>
                        <li class="nav-item active  ">
                            <a class="nav-link" href="upload-xml">
                                <i class="material-icons">insert_drive_file</i>
                                <p>Lista de NFes</p>
                            </a>
                        </li>
                        <% }%>
                    </ul>
                </div>
            </div>
            <div class="main-panel">
                <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
                    <div class="container-fluid">
                        <div class="navbar-wrapper">
                            <a class="navbar-brand" href="dashboard">Dashboard</a>
                        </div>
                        <div class="navbar-wrapper">
                            <a class="navbar-brand" href="logout.jsp">Sair</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                            <span class="navbar-toggler-icon icon-bar"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end">
                            <ul class="navbar-nav">
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="content mt-3">
                    <div class="container-fluid">
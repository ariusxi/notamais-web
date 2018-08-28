<%-- 
    Document   : header
    Created on : 23/08/2018, 09:28:57
    Author     : lucas
--%>

    <%@page contentType="text/html"%>
        <!DOCTYPE html>
        <html lang="pt_br">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="Content-Type" content="text/html;">
            <title>Nota Mais</title>
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

        </head>

        <body>
            <!-- search for navbar bootstrap -->
            <nav class="navbar navbar-expand-lg navbar-dark blue-sky m-0">
                <a class="navbar-brand" href="#">
                    Nota+
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <% if(session.getAttribute("roles").equals("user")){ %>
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard">Página Inicial</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="employee">Meus funcionários</a>
                        </li>
                        <% }else{ %>
                        <% } %>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#"><%= session.getAttribute("name") %></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Sair</a>
                        </li>
                    </ul>
                </div>
            </nav>
           <div class="container-fluid user-profile mb-5">
                <div class="row employee">
                    <div class="col-sm-12 col-md-3 col-lg-3">
                        <div class="list-group">
                            <div class="list-group-item ">
                                <div class="text-center">
                                    <img src="${pageContext.request.contextPath}/assets/img/default-user.png" class="img-fluid img-thumbnail img-profile" alt="<%= session.getAttribute("name") %>"><br/><br/>
                                </div>
                                <h5 class="card-title"><%= session.getAttribute("name") %></h5>
                                <h6 class="card-subtitle mb-2 text-muted"><%= session.getAttribute("roles") %></h6>
                            </div>
                            <a href="dashboard" class="list-group-item list-group-item-action">Meu perfil</a>
                            <% if(session.getAttribute("roles").equals("user")){ %>
                            <a href="employee" class="list-group-item list-group-item-action">Funcionários</a>
                            <% }else if(session.getAttribute("roles").equals("admin")){  %>
                            <a href="plan" class="list-group-item list-group-item-action">Planos</a>
                            <% } %>
                            <a href="user-edit" class="list-group-item list-group-item-action">Alterar dados de perfil</a>
                        </div>
                    </div>
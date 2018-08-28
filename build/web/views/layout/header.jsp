<%-- 
    Document   : header
    Created on : 23/08/2018, 09:28:57
    Author     : lucas
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>Nota Mais</title>
            
            <!-- Fonts -->
            <link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
            <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
            <link href="${pageContext.request.contextPath}/assets/css/plans.css" rel="stylesheet"/>
            <!-- Bootstrap -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        </head>

        <body>
            <!-- search for navbar bootstrap -->
            <nav class="navbar navbar-expand-lg navbar-dark blue-sky">
                <a class="navbar-brand" href="#">
                    Nota+  
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Administrador</a>
                        </li>
                        <li class="nav-item">
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
                        </li>
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
            </nav>
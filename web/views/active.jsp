<%-- 
    Document   : active
    Created on : 20/09/2018, 12:13:12
    Author     : Murah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    
<div class="page-header header-filter" style="background-image: url('http://demos.creative-tim.com/material-bootstrap-wizard/assets/img/wizard-book.jpg'); background-size: cover; background-position: top center;">
    
    <div class="container">
         <br>
                    <br> <br>
                   
        <div class="row mt-3 justify-content-center">
            <div class="col-sm-12 col-md-4">
                <div class="card card-login">
                    
                    <form id="formLogin" class="form" method="POST" action="">
                        <div class="card-header card-header-primary text-center">
                            <h4>Usuário Ativo!</h4>
                        </div>
                        <div class="card-body">
                            <span class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">mail</i>
                                        </span>
                                    </div>
                                    <input type="email" name="login" class="form-control" placeholder="Email...">
                                </div>
                            </span>
                            <span class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">lock_outline</i>
                                        </span>
                                    </div>
                                    <input type="password" name="password" class="form-control" placeholder="Senha...">
                                </div>
                            </span>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12">
                        <a href="login" type="submit" class="btn btn-primary login btn-round  btn-block" value="Entrar no Nota+"/></a>
                        </div>
                        <div class="alert alert-info mt-2 mb-0" id="message">

                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%-- 
    Document   : upload-xml
    Created on : 10/09/2018, 19:31:20
    Author     : Isabela
--%>

<style>
.inputfile{
    width: 0.1px;
    height: 0.1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
}
</style>
    
<jsp:include page="../layout/header-auth.jsp" />

<h2 class="title-register"  >Upload de XML</h2>

<form id="formulario" class="upload box" method="post" enctype="multipart/form-data">
    <div id="drop_file_zone">
        <div id="drag_upload_file">
            <p>Arraste o arquivo arquivo</p>
            <p>ou</p>
            <p><input type="button" value="Selecione um arquivo" class="btn btn-primary btn-rounded file"/></p>
            <input type="file" id="file" name="file" accept="text/xml"/>
        </div>
    </div>
    
    <input type="hidden" id="user" value="<%out.print(session.getAttribute("id"));%>">
    <input type="hidden" id="token" value="<%out.print(session.getAttribute("token"));%>">
    
    <!-- <button class="btn btn-secondary" type="button" > 
    <i class="fa fa-times ng-scope" aria-hidden="true"></i> Remover</button>-->
</form>
<div class="table-responsive ">    
    <table id="xml-list" class="display table fix-upload-a">
        <thead>
            <tr>
                <th>Nº</th>
                <th>Nome</th>
                <th>XML</th>
                <th>Data de envio</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>   
        </tbody>
    </table>  
</div>
<jsp:include page="../layout/footer-auth.jsp"/>

<script>
    $(function(){
        var json = '<%= request.getAttribute("plano")%>';
        var html="";
        if(json == ""){
            html += "<div class='card'>";
            html += "<div class='card-header card-header-danger text-light' id='titulo'>Verificamos que seu plano expirou <i class='far fa-frown'></i> </div>";
            html += "<a href='first-login' class='btn btn-success' >Clique aqui e renove!</a>";
            $("#formulario").html(html);
        }
    });
</script>
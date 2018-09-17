<%-- 
    Document   : upload-xml
    Created on : 10/09/2018, 19:31:20
    Author     : Isabela
--%>


<jsp:include page="../layout/header-auth.jsp" />

<h2 class="title-register">Upload de XML</h2>
<table id="upload" class="display table">
              
                
</table>
<form id="formulario" class="upload" method="post" enctype="multipart/form-data">
    <label>Importar arquivo <br><small> (Tipos de arquivo suportados: .xml)</small></label>
    <div class="custom-file">
        <input type="file" accept=".xml" name="file" class="custom-file-input" id="customFile">
        <label class="custom-file-label" for="customFile"><i class="fa fa-folder-open" style="margin-right: 5px;"></i>Escolher arquivo</label>
    </div>
    <div class="alert alert-info mt-2 mb-0" id="message">

    </div>
    <button class="btn btn-light btn-sm" style="width: 90px;" type="submit">Enviar</button>
  
    <input type="hidden" id="user" value="<%out.print(session.getAttribute("id"));%>">
    <input type="hidden" id="token" value="<%out.print(session.getAttribute("token"));%>">
    
    <!-- <button class="btn btn-secondary" type="button" > 
    <i class="fa fa-times ng-scope" aria-hidden="true"></i> Remover</button>-->
</form>
<div class="table-responsive">
    <table id="xml-list" class="display table">
        <thead>
            <tr>
                <th>#</th>
                <th>URL</th>
                <th>Data de envio</th>
            </tr>
        </thead>
        <tbody>
            <tr>

            </tr>
        </tbody>
    </table>
</div>
<jsp:include page="../layout/footer-auth.jsp"/>
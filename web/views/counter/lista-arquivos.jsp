<%-- 
    Document   : lista-arquivos
    Created on : 01/10/2018, 23:55:34
    Author     : Isabela
--%>
    
<jsp:include page="../layout/header-auth.jsp" />

<h2 class="title-register"  >Lista de Arquivos </h2>

<!--<form id="formulario"  class="upload" method="post" enctype="multipart/form-data">
    
   
    
    <label >Importar arquivo <br><small> (Tipos de arquivo suportados: .xml)</small></label>
    <table id="upload" class="display table">
              
                
    </table>
    <input type="hidden" id="user" value="<%out.print(session.getAttribute("id"));%>">
    <input type="hidden" id="token" value="<%out.print(session.getAttribute("token"));%>">
    
    <!-- <button class="btn btn-secondary" type="button" > 
    <i class="fa fa-times ng-scope" aria-hidden="true"></i> Remover</button>
</form>-->
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



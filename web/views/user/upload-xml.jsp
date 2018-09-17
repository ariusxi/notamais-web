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

<form id="formulario"  class="upload" method="post" enctype="multipart/form-data">
    
    <div class="row">
    
        <div class="col-sm-12 col-md-5 col-lg-5">
            <div class="form-group">
                <label for="name">Nome:</label>
                <input class="form-control" type="text" id="name" name="name" placeholder="nome" >
            </div>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-6">
            <div class="form-group">
                <label for="description">Descrição: </label>
                <input type="text" class="form-control" id="description" name="description" placeholder="descrição" >
            </div>
        </div>
    </div>
    
    <label >Importar arquivo <br><small> (Tipos de arquivo suportados: .xml)</small></label>
    <table id="upload" class="display table">
              
                
    </table>
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
                <th>Nome</th>
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

<script>
    
    $(function(){
    
    var json = '<%= request.getAttribute("plano")%>';
       
	var obj = JSON.parse(json);
        
	var upload = obj.active;
	var html="";
	
	if(obj.ativo =true){
		html += " <div class='card' style=' margin-top:  5px; padding-top: 3px;' >    ";
		html += " <input type='file' name='file' id='file' class='inputfile'  accept='.xml' />";
		html += "<label for='file' style='margin-left: 35px; width: 1000px;'> <i class='fa fa-folder-open' style='margin-right: 5px;'></i>Escolha um arquivo <button class='btn btn-success btn-sm' style='width: 100px; margin-left:700px;'>Enviar</button></label>";
		html += "<div class='alert alert-info mt-2 mb-0' id='message'>";
		html += "</div>";
		html += "</div>";   
                console.log(obj);
    }else{ 
        html += "<div class='card'>";
        html += "<div class='card-header text-light' id='titulo'>Verificamos que seu plano expirou <i class='far fa-frown'></i> </div>";
       
        html += "<a href='first-login' class='btn btn-success' >Clique aqui e renove!</a>";
        
         html += "</div>";  
        
       
    }  
	$("#upload").append(html);
        
});

</script>
<%-- 
    Document   : upload-xml
    Created on : 10/09/2018, 19:31:20
    Author     : Isabela
--%>


<style type="text/css">
  
</style>
<jsp:include page="../layout/header-auth.jsp" />

    
            <h2 class="title-register">Upload de XML</h2>
            <table id="upload" class="display table">
              
                
            </table>
<form id="formulario" class="upload" method="post" enctype="multipart/form-data">
    <label>Importar arquivo <br><small> (Tipos de arquivo suportados: .xml)</small></label>
  <div class="custom-file">
  <input type="file" accept=".xml" class="custom-file-input" id="customFile">
  <label class="custom-file-label" for="customFile"><i class="fa fa-folder-open" style="margin-right: 5px;"></i>Escolher arquivo</label>
</div>
    <button class="btn btn-light btn-sm" style="width: 90px;" type="submit">Enviar</button>
  
    <input type="hidden" id="user" value="<%out.print(session.getAttribute("id"));%>">
    <input type="hidden" id="token" value="<%out.print(session.getAttribute("token"));%>">
    
   <!-- <button class="btn btn-secondary" type="button" > 
    <i class="fa fa-times ng-scope" aria-hidden="true"></i> Remover</button>-->
</form>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$("#formulario").submit(function (e) {
	e.preventDefault();
        var user =  $("#user").val();
        var token = $("#token").val();
    var form = new FormData($(this)[0]);
    $.ajax({
        url: "https://notamaisapi.herokuapp.com/files/send/"+user,
        headers: { 'x-access-token': token },
		data: form,
		contentType: false,
		cache: false,
		processData: false,
		type: "POST",
        dataType: "json",
        data: form,
        success: function (response) {
            alert('okkkkkk!');
          //window.location.href = "/views/user/cards.jsp";
        },
        error: function (e) {
            alert('Erro ao carregar pagina');
        }
    });
	return false;
});
</script>
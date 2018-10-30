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
    <table id="xml-list-counter" class="display table fix-upload-a">
        <thead>
            <tr>
                <th>Nº</th>
                <th>Nome</th>
                <th>XML</th>
                <th>Data de envio</th>
            </tr>
        </thead>
        <tbody>   
        </tbody>
    </table>  
</div>
<input type="hidden" id="idCliente" name="idCliente" value="<% out.println(request.getParameter("cliente"));%>" />

<jsp:include page="../layout/footer-auth.jsp"/>

<script type="text/javascript">
    $("#xml-list-counter").ready(function () {
        loader();

        $.ajax({
            url: "lista-arquivos",
            method: "POST",
            dataType: "json",
            data: {
                methodType: "list-xml",
                idCliente: $("#idCliente").val()
            },
            success: function (data) {
                $.each(data, function (i, value) {
                    var name = value.name;
                    if (value.name == undefined) {
                        name = "-";
                    }
                    var html = "<tr><td>" + (i + 1) + "</td><td>" + name + "</td><td><a target='_blank' title='" + value.xml + "' href='" + value.xml + "'>Acessar</a></td><td>" + formatDate(value.date) + "</td>";
                    $("#xml-list-counter tbody").append(html);

                });

                $("#xml-list-counter").dataTable({
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
                    }
                });
                closeLoader();
            }, error: function (e) {
                console.log(e);
            }
        });
    });
</script>



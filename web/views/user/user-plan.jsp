<jsp:include page="../layout/header-auth.jsp"/>

<div class="col" id="plano">
    <h2>Meu plano</h2>
    <hr />
</div>

<script>
    window.onload = function(){
        var json = '<%= request.getAttribute("plano")%>';
        
        console.log(json);

        var obj = JSON.parse(json);
        var plano = obj.plan
        
        var html="";
        
        console.log(obj);
        
        html += "<div class='card'>";
        html += "<div class='card-header' id='titulo'>" + plano.name + "</div>";
        html += "<div class='card-body'>";
        html += "<h5 class='card-title' id='qtdXML'>" + "Armazenamento de " + plano.qtdeXML + " XMLs" + "</h5>";
        html += "<p class='card-text' id='descricao'>" + plano.description + "</p>";
        html += "<strong class='card-text' id='preco'>" + "R$" + plano.value + ",00/mês" + "</strong>";
        html += "<br /><br />";
        html += "<a href='list-plan' class='btn btn-primary'>Alterar Plano</a>";
        html += "</div>";
        html += "</div>";
        
        $("#plano").append(html);
    };
</script>
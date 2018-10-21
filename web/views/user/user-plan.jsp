<jsp:include page="../layout/header-auth.jsp"/>


<div class="col" id="plano">
    <h2>Meu plano</h2>
    <hr />
</div>

<jsp:include page="../layout/footer-auth.jsp"/>

<script>
    
    
    window.onload = function(){
        var json = '<%= request.getAttribute("plano")%>';
        
        console.log(json);
        if(json != ""){
            
        var obj = JSON.parse(json);
        var plano = obj.plan
        var html="";
        
         
      
        html += "<div class='card'>";
        html += "<div class='card-header card-header-success text-light' id='titulo'>" + plano.name + "</div>";
        html += "<div class='card-body'>";
        html += "<h5 class='card-title' id='qtdXML'>" + "Armazenamento de " + plano.qtdeXML + " XMLs" + "</h5>";
        html += "<p class='card-text' id='descricao'>" + plano.description + "</p>";
        html += "<strong class='card-text' id='preco'>" + "R$" + plano.value + ",00/mês" + "</strong>";
        html += "<br /><br />";
        html += "<a href='list-plan' class='btn btn-primary'>Alterar Plano</a>";
        html += "</div>";
        html += "</div>";
        
        $("#plano").append(html);
        }
        else{
     
     
        var html="";
              
        html += "<div class='card'>";
        html += "<div class='card-header text-light' id='titulo'>Verificamos que você ainda não possui um plano <i class='far fa-frown'></i> </div>";
       
        html += "<a href='first-login' class='btn btn-danger' >Clique aqui e contrate!</a>";
        
         html += "</div>";
        
     
        
        $("#plano").append(html);
        }
   };
</script>
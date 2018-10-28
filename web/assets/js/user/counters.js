$(function(){  
    meusContadores();
    $("a[href='#listCounter']").click(meusContadores);
});
    
$("#btnPesquisarContador").click(function(){
    if($("#pesquisar").val() == ""){
    $("#pesquisar").focus();
    return;
}
    
$("#message").hide();
    
    pesquisar();
});

function pesquisar(){
        $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type : "counters-list-search",
            search : $("#pesquisar").val()
        },
        success: function(json){
            $("#add-counter-list").html("");
            //montar tabela
            var html="";
            var contadores = JSON.parse(json);
            
            if(contadores.length == 0){
                $("#message").html("Nenhum resultado encontrado");
                $("#message").show();
                return;
            }  
            
            html+="<table  class='display table'>";
            html+="<thead>";
            html+="<tr>";
            html+="<th>Nome</th>";
            html+="<th>Email</th>";
            html+="<th>Nickname</th>";
            html+="<th>CPF</th>";
            html+="<th>Aç&otilde;es</th>";
            html+="</tr>";
            html+="</thead>";
            html+="<tbody>";
            
            var c = 0;
            for(var i=0; i < contadores.length; i++){
            
            var contador = contadores[i];
            
                if(contador.pending == 0){
                    c++;
                    html+="<tr>";
                    html+="<td>" + contador.counter.name + "</td>";
                    html+="<td>" + contador.counter.email + "</td>";
                    html+=" <td>" + contador.profile.nickname + "</td>";
                    html+="<td>" + contador.profile.cpf + "</td>";
                    html+="<td><button type='button' class='btn btn-primary' data-id-contador='" + contador.counter._id + "' onClick='convidar(this)' >Enviar solicitaç&atilde;o</button></td>";
                    html+="</tr>";
                }   
            }
            
            html+="</tbody>";
            html+="</table>";
            
        if(c > 0){         
        $("#add-counter-list").append(html);
        }
        else{
        $("#message").html("Nenhum resultado encontrado");
        $("#message").show();
        } 
         
        },error: function(e){
            console.log(e);
        }
    });
}

function meusContadores(){
    montarLista();  
}

function montarLista(){
    $("#message").hide();
    
     $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type : "counters-list",
        },
        
        success: function(json){
            $("#counter-list").html("");
            //montar tabela
            var html="";
            var convites = JSON.parse(json);
            
           html+="<table  class='display table'>";
            html+="<thead>";
            html+="<tr>";
            html+="<th>Nome</th>";
            html+="<th>Email</th>";
            html+="<th>Status</th>";
            html+="<th>Aç&otilde;es</th>";
            html+="</tr>";
            html+="</thead>";
            html+="<tbody>";       
            
            for(var i=0; i < convites.length; i++){
            
            var convite = convites[i];
                html+="<tr>";
                html+="<td>" + convite.counter.name + "</td>";
                html+="<td>" + convite.counter.email + "</td>";
                html+=" <td>" + (convite.approved?"Aprovado":"Aguardando aprovaç&atilde;o") + "</td>";
                html+="<td><button type='button' data-id-convite='" + convite._id + "' onclick='excluir(this)' class='btn btn-primary'>Excluir</button></td>";
                html+="</tr>";
            }
            
            html+="</tbody>";
            html+="</table>";

        $("#counter-list").append(html);
        
        $("#counter-list > table").dataTable({
            "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
            }
        });
          
        },error: function(e){
            console.log(e);
        }
    });
}

function convidar(btn){ 
    $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type : "add-counter",
            idContador : $(btn).attr("data-id-contador")
        },
        success: function(json){
           
        $(btn).closest("tr").remove();
        
        },error: function(e){
            console.log(e);
            var msg = JSON.parse(json);
            $("#message").html(msg.mensagem); 
            $("#message").show();
        }
    });
}

/* FUNÇÃO EXCLUIR
function excluir(btn){ 
    $.ajax({
        url: "counters",
        method: "POST",
        data: {
            type : "delete-counter",
            idConvite : $(btn).attr("data-id-convite")
        },
        
        success: function(json){
        $(btn).closest("tr").remove();
        
        },error: function(e){
            console.log(e);
            var msg = JSON.parse(json);
            $("#message").html(msg.mensagem); 
            $("#message").show();
        }
    });
}  */
